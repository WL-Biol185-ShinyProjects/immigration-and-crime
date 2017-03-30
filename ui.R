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
<<<<<<< HEAD

        selectInput("immigrant_type", label = "Type", choices = unique(master_immigration$immigrant_type)
        #sliderInput("year", label = "Period", min = 1800, max = 2017, value = c(1800,2017))
        #checkboxGroupInput("country", label = "Countries", choices = unique(master_immigration$country)
        )),

=======
        selectInput("immigrant_type", label = "Type", choices = unique(master_immigration$immigrant_type)),
        checkboxGroupInput("type", label = "Crime Type", choices = unique(crime$type))
        ),
>>>>>>> b38a59354f2f486e70c817da72fa8320e5b7f779
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("immtypePlot"),
      plotOutput("crimetimePlot")
      
  )
<<<<<<< HEAD

)

sidebarLayout(
  sidebarPanel(
    checkboxGroupInput("type", label = "Crime Type", choices = unique(crime$type),
  mainPanel(
    plotOutput("crimetimePlot")
=======
>>>>>>> b38a59354f2f486e70c817da72fa8320e5b7f779
  )
  )
<<<<<<< HEAD
    

=======

    
>>>>>>> b38a59354f2f486e70c817da72fa8320e5b7f779
