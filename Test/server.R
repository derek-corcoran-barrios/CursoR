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
data("mtcars")

shinyServer(function(input, output) {
  
  output$distPlot <- renderPlot({
    ggplot(mtcars, aes_string(x = input$Variable, y = "mpg")) + geom_smooth(method = input$Modelo) + geom_point()
  })

})
