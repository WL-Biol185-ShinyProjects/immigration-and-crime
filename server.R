library(shiny)
library(dplyr)
library(ggplot2)
shinyServer(function(input, output) {
master_immigration <- read.csv("Master_Immigration.csv") 
crime <- read.csv("CRIME.csv")
rate <- read.csv("rate.csv")
region_totals <- read.csv("region_totals.csv")
rate$X = NULL


  output$master_immigration <- renderDataTable({
    master_immigration
  })
  
  output$crime <- renderDataTable({
    crime
  })
  
  output$rate <- renderDataTable({
    rate
  })
  

  output$region_totals = renderDataTable({
    region_totals
  })
  

  output$immtypePlot <- renderPlot({
    master_immigration%>%
      filter(immigrant_type == input$immigrant_type) %>%
      filter(country %in% input$country) %>%
      filter(year >= input$year[1], year <= input$year[2]) %>%
      ggplot(aes(year, number, color = country)) + geom_point() + geom_smooth(method = "loess", span =.3)
  })
    

  output$crimetimePlot <- renderPlot({
    crime %>%
      filter(type %in% input$type) %>%
      ggplot(aes(year, crime_rate, color = type)) + geom_point() + geom_smooth(method = "loess", span =.3)
  })
  
  output$totalratePlot <- renderPlot({
    rate %>%
      filter(country %in% input$totalcountry) %>%
      filter(year >= input$year[1], year <= input$year[2]) %>%
      ggplot(aes(year, number, color = country)) + geom_point() + geom_smooth(method = "loess", span =.3)
  })
  
  
  output$regionPlot <- renderPlot({
    master_immigration %>%
     filter(region %in% input$region) %>%
     filter(year >= input$year[1], year <= input$year[2])%>%
     ggplot(aes(year, number, color = country)) + geom_point()
  })
  

  output$totalregionPlot <- renderPlot({
    region_totals %>%
      filter(region %in% input$region) %>%
      filter(year >= input$year[1], year <= input$year[2]) %>%
      ggplot(aes(year, number, color = region)) + geom_point()
  })

  output$totalrateTable <- renderDataTable({
    rate %>%
      filter(country %in% input$totalcountry) %>%
      filter(year >= input$year[1], year <= input$year[2])
  })
  
  output$regionTable <- renderDataTable({
    master_immigration %>%
      filter(region %in% input$region) %>%
      filter(year >= input$year[1], year <= input$year[2])
  })
  
  output$crimetimeTable <- renderDataTable({
    crime %>%
      filter(type %in% input$type)
  })
  
  output$immtypeTable <- renderDataTable({
    master_immigration%>%
      filter(immigrant_type %in% input$immigrant_type) %>%
      filter(country %in% input$country) %>%
      filter(year >= input$year[1], year <= input$year[2])

  })
  
  datasetInput <- reactive({
    switch(input$dataset,
           "Master Immigration Data" = master_immigration,
           "Crime Data" = crime,
           "Total Immigration Rates" = rate)
  })
  
  output$downloadData <- downloadHandler(
    filename = function() {paste(input$dataset, '.csv', sep='')},
    content = function(file)  {
      write.csv(datasetInput(), file)}
  )
  
 
})
  
