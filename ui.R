library(shiny)
library(shinythemes)
master_immigration <- read.csv("Master_Immigration.csv")
crime <- read.csv("CRIME.csv")
rate <- read.csv("rate.csv")
region_totals <- read.csv("region_totals.csv")
rate$X = NULL

library(shiny)
library(dplyr)
library(ggplot2)
library(shinydashboard)
shinytheme("superhero")
dashboardPage(
  dashboardHeader(title = "Crime and Immigration"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Home", tabName = "home"),
      menuItem("Graphs and Data", tabName = "data"),
      menuItem("Tables", tabName = "tables"),
      menuItem("Sources and Acknowledgements", tabName = "sources"))),
  
  dashboardBody(
    tabItems(
      tabItem(tabName = "home",
              fluidPage(
                titlePanel("Crime and Immigration Rates Over Time in the Unites States"),
                h5("Welcome to the Crime and Immigration Rates Over Time in the United States   App! This app is designed to allow the user to experiment with viewing different rates of immigration over time and how they relate to changes in crime rates over time. Filters are avaiable to allow for examination of certain types of immigrants, only immigrants from certain countries, or only during certain time periods. Crime rates may also be filtered by the specific type of crime.",
                   br(),
                   br(),
                   "Given the recent US Presidential Election of 2016 and the appearance of policies and rhetoric that have broadly depicted immigrants from many countries in a negativel light, we feel it is important and our responsibility as citizens to better understand the nature of immigration in the US and educate ourselves on a personal level.",
                   br(),
                   br(),
                   "We compiled our data from publicly available statistics from the US Department of Homeland Security and the US Federal Bureau of download and free use for future projects. We hope you enjoy the application!"))),
      
      tabItem(tabName = "data",
              fluidRow(
                box(position = "above",
                    width = 12,
                    sliderInput("year", 
                                label = "Time Period", 
                                min = 1800, 
                                max = 2017, 
                                value = c(1800,2017)
                    )),
                
                tabBox(width = 12,
                       tabPanel("Immigrant Type",
                                width = 12,
                                fluidRow(
                                  box(width = 6,
                                      selectizeInput("country",
                                                     label = "Country",
                                                     choices = unique(master_immigration$country),
                                                     selected = "Mexico", multiple = TRUE)),
                                  box(width = 6,
                                      selectInput("immigrant_type",
                                                  label = "Type",
                                                  choices = unique(master_immigration$immigrant_type),
                                                  selected = "Lawful")),
                                  box(width = 12, strong("Plot of Immigration Rate Over Time by Immigrant Type"),
                                      plotOutput("immtypePlot")),
                                  box(width = 12, strong("Output Table of Data"),
                                      dataTableOutput("immtypeTable"))
                                )),
                       
                       tabPanel("Crime Rate",
                                width = 12,
                                fluidRow(
                                  box(width = 12,
                                      checkboxGroupInput("type",
                                                         label = "Crime Type",
                                                         choices = unique(crime$type),
                                                         selected = "Drug Related")),
                                  box(width = 12, strong("Plot of Crime Rates Over Time by Crime Type"),
                                      plotOutput("crimetimePlot"), strong("*Crime Rates are incidence per 100,000 people*")),
                                  box(width = 12, strong("Output Table of Data"),
                                      dataTableOutput("crimetimeTable"))
                                )),
                       
                       tabPanel("Total Immigration Rates",
                                width = 12,
                                fluidRow(
                                  box(width = 12,
                                      selectizeInput("countrytotal",
                                                     label = "Country",
                                                     choices = unique(rate$country),
                                                     selected = "Mexico", multiple = TRUE)),
                                  box(width = 12, strong("Plot of Total Immigration Rates of All Immigrant Types"),
                                      plotOutput("totalratePlot")),
                                  box(width = 12, strong("Output Table of Data"),
                                      dataTableOutput("totalrateTable"))
                                )),
                       
                       tabPanel("Immigration by Region",
                                width = 12,
                                fluidRow(
                                  box(width = 12,
                                      checkboxGroupInput("region", 
                                                         label = "Region", 
                                                         choices = unique(master_immigration$region), 
                                                         selected = "Middle East")),
                                  box(width = 12, strong("Plot of All Countries Separately in a Region"),
                                      plotOutput("regionPlot")),
                                  box(width = 12, strong("Plot of Total Immigrants Summed from All Countries in a Region"),
                                      plotOutput("totalregionPlot")),
                                  box(width = 12, strong("Output Table of Data"),
                                      dataTableOutput("regionTable"))
                                ))
                ))),
      tabItem(tabName  = "tables",
              fluidRow(
                tabBox(width = 12,
                       tabPanel("Master Immigration Data Table",
                                dataTableOutput("master_immigration")),
                       tabPanel("Crime Data Table",
                                dataTableOutput("crime")),
                       tabPanel("Total Immigration Rates Table",
                                dataTableOutput("rate"))
                )
              )
      ),
      tabItem("sources",
              fluidPage(
                titlePanel("Acknowledgements and Sources"),
                h5(
                  br(),
                  "As mentioned our dately was freely retrieved from the annually publish statistics from the US Department of Homeland Security and the US Federal Bureau of Investigation. Below are the links to download our fully compiled data sets. We hope you enjoy them!",
                  br(),
                  br(),
                  selectInput("dataset", "Choose a dataset:",
                                                  choices = c("Immigration Data", "Crime Data", "Total Immigration Rates")),
                          downloadButton('downloadData', 'Download'),
                  br(),
                  br(),
                  "Additonally, we would like to extend our deepest gratitude to Dr. Whitworth for all his guidance and help in making this app a reality!",
br(),
br(),
"Yours Truly,",
br(),
br(),
"Harrison Westgarth and Kara Farroni")
              ))
    )
  ))
