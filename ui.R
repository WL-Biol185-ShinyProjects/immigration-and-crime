library(shiny)
library(shinythemes)
master_immigration <- read.csv("Master_Immigration.csv")
crime <- read.csv("CRIME.csv")
rate <- read.csv("rate.csv")
# Define UI for application that draws a histogram
fluidPage(
  theme = shinytheme("superhero"),
  # Application title
  titlePanel("Crime and Immigration in the United States"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(

        selectInput("immigrant_type", label = "Type", choices = unique(master_immigration$immigrant_type)),
        checkboxGroupInput("country", label = "Country", choices = unique(master_immigration$country)),
        sliderInput("year", label = "Time Period", min = 1800, max = 2017, value = c(1800,2017)),
        checkboxGroupInput("region", label = "Region", choices = unique(master_immigration$region)),
        checkboxGroupInput("type", label = "Crime Type", choices = unique(crime$type)),
        checkboxGroupInput("totalcountry", label = "Country for Overall Rate", choices = unique(rate$country))
        ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("immtypePlot"),
      plotOutput("crimetimePlot"),
      plotOutput("totalratePlot"),
      plotOutput("regionPlot")
  )


  )
  )
