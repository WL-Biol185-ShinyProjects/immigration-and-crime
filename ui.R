library(shiny)
library(shinythemes)
master_immigration <- read.csv("Master_Immigration.csv")
crime <- read.csv("CRIME.csv")
rate <- read.csv("rate.csv")
rate$X = NULL

# Define UI for application that draws a histogram
fluidPage(
  theme = shinytheme("superhero"),
  # Application title
  titlePanel("Crime and Immigration in the United States"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(

        selectInput("immigrant_type", 
                    label = "Type", 
                    choices = unique(master_immigration$immigrant_type), 
                    selected = "Lawful"),
        selectizeInput("country", 
                       label = "Country", 
                       choices = unique(master_immigration$country), 
                       selected = "Mexico", multiple = TRUE),
        sliderInput("year", 
                    label = "Time Period", 
                    min = 1800, 
                    max = 2017, 
                    value = c(1800,2017)
                    ),
        checkboxGroupInput("region", 
                           label = "Region", 
                           choices = unique(master_immigration$region), 
                           selected = "Middle East"),
        checkboxGroupInput("type", 
                           label = "Crime Type", 
                           choices = unique(crime$type), 
                           selected = "Drug Related"),
        selectizeInput("totalcountry", 
                       label = "Country for Overall Rate", 
                       choices = unique(rate$country), 
                       selected = "Mexico"),
        
        selectInput("dataset", "Choose a dataset:",
                    choices = c("Immigration Data", "Crime Data", "Total Immigration Rates")),
        downloadButton('downloadData', 'Download')
                   ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type="pills",
                  
                  tabPanel('Immigrant Type', 
                           plotOutput("immtypePlot"), 
                           dataTableOutput("immtypeTable")),
                  
                  tabPanel('Crime Rates', 
                           plotOutput("crimetimePlot"), 
                           dataTableOutput("crimetimeTable")),
                  
                  tabPanel('Immigration Rates', 
                           plotOutput("totalratePlot"), 
                           dataTableOutput("totalrateTable")),
                  
                  tabPanel('Immigration by Region', 
                           plotOutput("regionPlot"), 
                           dataTableOutput("regionTable")),
                  
                  tabPanel('Master Immigration Data Table',
                           dataTableOutput("master_immigration")),
                  
                  tabPanel('Crime Data Table',
                           dataTableOutput("crime")),
                  
                  tabPanel('Total Immigration Rates Table',
                           dataTableOutput("rate"))

                  )
            )


))
  
