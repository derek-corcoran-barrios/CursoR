

library(shiny)

shinyUI(fluidPage(
  
  titlePanel("Datos de motor trends de 1974"),
  
  sidebarLayout(
    sidebarPanel(
      fileInput("File", "Elije tu archivo", 
                accept = c(".csv"), 
                placeholder = "No file selected"),
      selectInput("VariableX",
                  "Selecciona la Variable x:",
                  choices =  c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                               "gear", "carb"),
                  selected = "wt"),
      selectInput("VariableY",
                  "Selecciona la Variable y:",
                  choices =  c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                               "gear", "carb"),
                  selected = "mpg"),
      checkboxGroupInput("Factores", "Transformar en factores:",
                         c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                           "gear", "carb"), selected = "am")
    ),
    mainPanel(
       plotOutput("distPlot"),
       textInput("Formula", "Escribe la formula de tu modelo:",
                   value =  "y ~ x + I(x^2)"),
       selectInput("Color",
                   "Variable secundaria:",
                   choices = c("cyl", "disp", "hp", "drat", "wt", "qsec", "vs", "am", 
                               "gear", "carb")),
       submitButton("Actualizar modelo", icon("refresh"))
    )
  )
))
