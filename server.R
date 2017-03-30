library(shiny)
shinyServer(function(input, output) {
  
  output$immtypePlot <- renderPlot({
    master_immigration <- read.csv("Master_Immigration.csv")
    master_immigration%>%
      filter(immigrant_type == input$immigrant_type) %>%
      ggplot(aes(year, number)) + geom_point()
  })
    

output$crimetimePlot <- renderPlot({
  crime <- read.csv("CRIME.csv")
  crime %>%
    filter(type == input$type) %>%
    ggplot(aes(year, crime_rate)) + geom_line()
})
})