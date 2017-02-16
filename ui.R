library(shiny)

# Define UI for application that draws a histogram
fluidPage(
  
  # Application title
  titlePanel("Old Faithful Geyser Data"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      sliderInput("bins",
                  "Number of bins:",
                  min = 1,
<<<<<<< HEAD
                  max = 50,
                  value = 30)
    ),
    actionButton("goButton", "Go!"),
=======
                  max = 100,
                  value = 30)
    ),
    
>>>>>>> c856f3de537b44f8f3be33b99fcc36f13dfcd582
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
)
