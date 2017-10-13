#para leer los archivos
library(readxl)
#Para manipular los datos
library(dplyr)
#Para transformar los textos
library(stringr)
#para generar las fechas
library(lubridate)

####Leer la pestaña de la temperatura media
TempMedia <- read_excel("~/Downloads/estado-aire80422dea683e61618024ff030098b759.xlsx", sheet = "E10000003")

#Eliminar de TempMedia las columnas codigo variable y Unidad de medida, y 
#cambiar el nombre de la columna valorF a TempMedia

TempMedia <- TempMedia %>% select(-Codigo_variable, -Unidad_medida)
colnames(TempMedia)[4] <- "TempMedia"

#Eliminar fechas con valor de mes 13

TempMedia <- TempMedia[!str_detect(TempMedia$Fecha, "_13"),]

#Remplazar dias 00, por 01

TempMedia$Fecha <- str_replace(TempMedia$Fecha, "_00", "_01")

##Transformar en formato Fecha

TempMedia$Fecha <- ymd(TempMedia$Fecha)

##############################################################################################3
####Leer la pestaña Humedad Media
HumMedia <- read_excel("~/Downloads/estado-aire80422dea683e61618024ff030098b759.xlsx", sheet = "E10000006")


#Eliminar de HumMedia las columnas codigo variable y Unidad de medida, y 
#cambiar el nombre de la columna valorF a HumMedia

HumMedia <- HumMedia %>% select(-Codigo_variable, -Unidad_medida)
colnames(HumMedia)[4] <- "HumMedia"

#Eliminar fechas con valor de mes 13

HumMedia <- HumMedia[!str_detect(HumMedia$Fecha, "_13"),]

####Leer la pestaña estaciones Meteorologicas
EM <- read_excel("~/Downloads/estado-aire80422dea683e61618024ff030098b759.xlsx", sheet = "T001")