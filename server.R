library(shiny)
library(dplyr)
library(ggplot2)
shinyServer(function(input, output) {
master_immigration <- read.csv("Master_Immigration.csv") 
crime <- read.csv("CRIME.csv")

  output$immtypePlot <- renderPlot({
    master_immigration%>%
      filter(immigrant_type == input$immigrant_type) %>%
      filter(country == input$country) %>%
      ggplot(aes(year, number, color = country)) + geom_line()
  })
    

  output$crimetimePlot <- renderPlot({
    crime %>%
      filter(type == input$type) %>%
      ggplot(aes(year, crime_rate, color = type)) + geom_line()
  })
  
  
  #output$totalrate <- renderPlot({
  #rate %>%
    #filter(country == input$country) %>%
    #ggplot(aes(year, number, color = country)) + geom_line()
  #})
  
  
  })