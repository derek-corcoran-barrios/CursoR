######Receta
library(readr)
library(lubridate)
library(dplyr)
library(ggplot2)
library(stringr)

IB15Tem <- read_csv("~/Documents/CursoR/Clase6/T&H/IB15Tem.csv") %>% rename(Temperatura = Value, Date.Time = `Date/Time`) %>% select(Date.Time, Value) %>% mutate(Date.Time = dmy_hms(Date.Time)) %>% mutate(ID = "IB15")

colnames(IB15Tem) <- make.names(colnames(IB15Tem))
IB15Tem$Date.Time <- dmy_hms(IB15Tem$Date.Time)

IB15Tem <- IB15Tem 

Temperaturas <- ArchivosTemp %>% map(read_csv) %>% map(~rename(.x, Temperatura = Value, Date.Time = `Date/Time`)) %>% map(~mutate(.x, Date.Time = dmy_hms(Date.Time, truncated = 1))) %>% map(~select(.x, Date.Time, Temperatura)) %>% map2(.y = IDs, ~ mutate(.x, ID = .y)) %>% reduce(rbind) 

ggplot(IB15Tem, aes(x = Date.Time, y = Temperatura)) + geom_line()
#####for loop

getwd()
setwd("/home/derek/Documents/CursoR/Clase6/T&H")
Archivos <- list.files()
ArchivosTemp <- list.files(pattern = "Tem.csv")
IDs <- str_replace(ArchivosTemp, "Tem.csv", "")
Temperaturas <- list()

for (i in 1:length(ArchivosTemp)){
  Temperaturas[[i]] <- read_csv(ArchivosTemp[i])
  
  colnames(Temperaturas[[i]]) <- make.names(colnames(Temperaturas[[i]]))
  Temperaturas[[i]]$Date.Time <- dmy_hms(Temperaturas[[i]]$Date.Time)
  
  Temperaturas[[i]] <- Temperaturas[[i]] %>% select(Date.Time, Value) %>% rename(Temperatura = Value) %>% mutate(ID = IDs[i])
 print(i)  
}

Temperaturas <- do.call(rbind,Temperaturas) 
  
  
#####purrr loop

library(purrr)
getwd()
setwd("/home/derek/Documents/CursoR/Clase6/T&H")
Archivos <- list.files()
ArchivosTemp <- list.files(pattern = "Tem.csv")


a <- ArchivosTemp %>% map(read_csv) %>% map(~rename(.x, Temperatura = Value, Date.Time = `Date/Time`)) %>% map(~mutate(.x, Date.Time = dmy_hms(Date.Time, truncated = 1))) %>% map(~select(.x, Date.Time, Temperatura)) %>% map2(.y = IDs, ~ mutate(.x, ID = .y)) %>% reduce(rbind) 


a <- a %>% mutate(Day = day(Date.Time)) %>% group_by(ID, Day) %>% summarise_all(funs(mean, sd))
