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
                       selected = "Mexico")
        ),

    # Show a plot of the generated distribution
    mainPanel(
      tabsetPanel(type="pills",
                  tabPanel('Immigrant Type', 
                           plotOutput("immtypePlot")),
                  tabPanel('Crime Rates', 
                           plotOutput("crimetimePlot")),
                  tabPanel('Immigration Rates', 
                           plotOutput("totalratePlot")),
                  tabPanel('Immigration by Region', 
                           plotOutput("regionPlot"))
                  
                  
                  )
            )


        )
  )
  
