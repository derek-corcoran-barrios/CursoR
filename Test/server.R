#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(purrr)
data("mtcars")

shinyServer(function(input, output, session) {

  
  z <- reactive({
    inFile <- input$File
        if (is.null(inFile)){
        mt <- as.data.frame(mtcars)
        }
        else{
        mt <- read.csv(inFile$datapath)
        }
        mt
  })
  
  observe({
    vchoices <- colnames(z())
    updateSelectInput(session, "VariableX", choices = vchoices)
    updateSelectInput(session, "VariableY", choices = vchoices)
    updateCheckboxGroupInput(session, "Factores", choices = vchoices)
    updateSelectInput(session, "Color", choices = vchoices)
  })
  
###############################
###############################
  
  output$distPlot <- renderPlot({
    inFile <- input$File
    if (is.null(inFile)){
    mt <- as.data.frame(map_at(mtcars, factor, .at = input$Factores))
    }
    else{
    mt <- read.csv(inFile$datapath)
    }
    p<- ggplot(mt, aes_string(x = input$VariableX, y = input$VariableY)) 
    if (class(mt[,input$VariableX]) == "numeric"){
      p <- p + stat_smooth(method = "lm", formula = input$Formula, aes_string(fill = input$Color)) + geom_point()
    }
    if (class(mt[,input$VariableX]) == "factor"){
      p <- p + geom_boxplot(aes_string(fill = input$Color))
    }
    p
  })

})
