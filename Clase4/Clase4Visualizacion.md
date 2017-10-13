<style>
.reveal h1, .reveal h2, .reveal h3 {
  word-wrap: normal;
  -moz-hyphens: none;
}
</style>

<style>
.small-code pre code {
  font-size: 1em;
}
</style>

Clase 4 visualización de datos
========================================================
author: Derek Corcoran
date: "13/10, 2017"
autosize: true
transition: rotate

ggplot2
========================================================
class: small-code

* Paquete de visualización de datos de tidy data
* ggplot(data.frame, aes(nombres de columna))
* + geom_algo(argumentos, aes(columnas))
* + theme_algo() estilo
* Personalización de ejes y leyendas


```r
library(ggplot2)
data("diamonds")
ggplot(diamonds, aes(x = carat, y=price)) + geom_point(aes(color = cut))
```

***

![plot of chunk unnamed-chunk-2](Clase4Visualizacion-figure/unnamed-chunk-2-1.png)

Argumentos para geoms
=================

* **color**: color de lineas o puntos 
* **alpha**: transparencia, de 0 (transparente) a 1 (solido)
* **size**: tamaño de puntos
* **pch**: tipo de punto
* **fill**: color dentro de un area (barras, intervalos)

color
=================
class: small-code


```r
library(ggplot2)
data("diamonds")
ggplot(diamonds, aes(x = carat, y=price)) + geom_point(aes(color = cut)) + theme_classic()
```

![plot of chunk unnamed-chunk-3](Clase4Visualizacion-figure/unnamed-chunk-3-1.png)

alpha
=================
class: small-code


```r
library(ggplot2)
data("diamonds")
ggplot(diamonds, aes(x = carat, y=price)) + geom_point(aes(color = cut), alpha = 0.1) + theme_classic()
```

![plot of chunk unnamed-chunk-4](Clase4Visualizacion-figure/unnamed-chunk-4-1.png)

size
=================
class: small-code


```r
library(ggplot2)
data("mtcars")
ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point(aes(size = hp)) + theme_classic()
```

![plot of chunk unnamed-chunk-5](Clase4Visualizacion-figure/unnamed-chunk-5-1.png)

shape
=================
class: small-code


```r
library(ggplot2)
data("diamonds")
ggplot(diamonds, aes(x = carat, y=price)) + geom_point(aes(shape = cut)) + theme_classic()
```

![plot of chunk unnamed-chunk-6](Clase4Visualizacion-figure/unnamed-chunk-6-1.png)

fill
=================
class: small-code


```r
library(ggplot2)
data("diamonds")
ggplot(diamonds, aes(x = cut, y=price)) + geom_boxplot(aes(fill = clarity)) + theme_classic()
```

![plot of chunk unnamed-chunk-7](Clase4Visualizacion-figure/unnamed-chunk-7-1.png)

Una variable categórica una continua
===========

* geom_boxplot
* geom_jitter
* geom_violin
* geom_bar

geom_jitter
==================
class: small-code


```r
data("iris")
ggplot(iris, aes(x = Species, y = Petal.Length)) + geom_jitter(aes(color = Species))
```

![plot of chunk unnamed-chunk-8](Clase4Visualizacion-figure/unnamed-chunk-8-1.png)

geom_violin
================
class: small-code


```r
data("iris")
ggplot(iris, aes(x = Species, y = Petal.Length)) + geom_violin(fill = "red")
```

![plot of chunk unnamed-chunk-9](Clase4Visualizacion-figure/unnamed-chunk-9-1.png)

Se pueden combinar
============
class: small-code


```r
data("iris")
ggplot(iris, aes(x = Species, y = Petal.Length)) + geom_violin() + geom_jitter(aes(color = Species))
```

![plot of chunk unnamed-chunk-10](Clase4Visualizacion-figure/unnamed-chunk-10-1.png)

Pero el orden importa
============
class: small-code


```r
data("iris")
ggplot(iris, aes(x = Species, y = Petal.Length)) + geom_jitter(aes(color = Species)) + geom_violin()
```

![plot of chunk unnamed-chunk-11](Clase4Visualizacion-figure/unnamed-chunk-11-1.png)


Dos variables continuas
===========

* geom_point
* geom_smooth
* geom_line
* geom_hex
* geom_rug
