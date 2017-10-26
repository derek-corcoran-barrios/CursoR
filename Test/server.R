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

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    mt <- as.data.frame(map_at(mtcars, factor, .at = input$Factores))
    p<- ggplot(mt, aes_string(x = input$Variable, y = "mpg")) 
    if (class(mt[,input$Variable]) == "numeric"){
      p <- p + stat_smooth(method = "lm", formula = input$Formula, aes_string(fill = input$Color)) + geom_point()
    }
    if (class(mt[,input$Variable]) == "factor"){
      p <- p + geom_boxplot(aes_string(fill = input$Color))
    }
    p + ylim(input$YLIM)
  })
})
