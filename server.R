library(shiny)
library(dplyr)
library(ggplot2)
shinyServer(function(input, output) {
master_immigration <- read.csv("Master_Immigration.csv") 
crime <- read.csv("CRIME.csv")
rate <- read.csv("rate.csv")

  output$immtypePlot <- renderPlot({
    master_immigration%>%
      filter(immigrant_type == input$immigrant_type) %>%
      filter(country == input$country) %>%
      filter(year >= input$year[1], year <= input$year[2]) %>%
      ggplot(aes(year, number, color = country)) + geom_point() + geom_smooth(method = "loess")
  })
    

  output$crimetimePlot <- renderPlot({
    crime %>%
      filter(type == input$type) %>%
      ggplot(aes(year, crime_rate, color = type)) + geom_line()
  })
  
  output$totalratePlot <- renderPlot({
    rate %>%
      filter(country == input$totalcountry) %>%
      ggplot(aes(year, number, color = country)) + geom_line()
  })
  
  })