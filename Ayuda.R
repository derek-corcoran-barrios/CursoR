library(dplyr)

###Leer la idea
Ejemplo <- read_excel("~/Downloads/Ejemplo R 2017.xlsx")

#####Cambiar nombre de columnas a nombres que les guste a R

colnames(Ejemplo) <- make.names(colnames(Ejemplo))

###Cambiar Context score y weighted context score a numeros

Ejemplo$context.score <- as.numeric(Ejemplo$context.score)
Ejemplo$weighted.context...score <- as.numeric(Ejemplo$weighted.context...score)

Ejemplo <- Ejemplo %>% filter(context.score >= -0.2)
####El problema de este grafico es que tiene demaciadas variables categoricas, tienes 136 diferenctes

ggplot(Ejemplo, aes(x = miRNA, y = context.score)) + geom_point()

### te recominedo este plot
ggplot(Ejemplo, aes(x = seed.match, y = context.score)) + geom_violin()+ geom_jitter(aes(color = seed.match))