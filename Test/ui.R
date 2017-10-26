

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Datos de motor trends de 1974"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("Variable",
                  "Selecciona la Variable x:",
                  choices = c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                              "gear", "carb"),
                  selected = "wt"),
      sliderInput("YLIM", "Selecciona los límites del eje y:", min = 0, max = 40, 
                  step = 2, value = c(0,20)
                  ),
      checkboxGroupInput("Factores", "Transformar en factores:",
                         c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                           "gear", "carb"), selected = "am"),
      selectInput("Color",
                  "Color segun la variable:",
                  choices = c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                              "gear", "carb"))
    ),
    mainPanel(
       plotOutput("distPlot"),
       textInput("Formula", "Escribe la formula de tu modelo:",
                   value =  "y ~ x + I(x^2)"),
       submitButton("Actualizar modelo", icon("refresh"))
    )
  )
))
