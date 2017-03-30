library(shiny)
master_immigration <- read.csv("Master_Immigration.csv")
crime <- read.csv("CRIME.csv")
# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Crime and Immigration in the United States"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(

        selectInput("immigrant_type", label = "Type", choices = unique(master_immigration$immigrant_type)),
        checkboxGroupInput("type", label = "Crime Type", choices = unique(crime$type))
        ),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("immtypePlot"),
      plotOutput("crimetimePlot")
      
  )


  )
  )
