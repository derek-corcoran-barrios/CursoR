

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Datos de motor trends de 1974"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput("Variable",
                  "Selecciona la Variable x:",
                  choices = c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                              "gear", "carb"),
                  selected = "wt")
    ),
    mainPanel(
       plotOutput("distPlot"),
       selectInput("Modelo", "Selecciona el tipo de modelo:",
                   choices = c("lm", "loess", "gam"), selected = "lm")
    )
  )
))
