#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny); library(RCurl);library(ggplot2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Spanish Population Pyramid from 1971 to 2017"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
            h1('Select the year of the pyramid plot'),
            # h1('H1 text'),
            # h2('H2 Text'),
            # h3('H3 Text'),
            # h4('H4 Text'),
            hr(),
       sliderInput("year",
                   "Year",
                   min = 1971,
                   max = 2017,
                   value = 1980)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot"),
       hr(),
       h3('By selecting a year the plot presents Spanish Population by age and sex.
         The evolution of the depicted pyramid can be observed by comparison. '),
       hr(),
       p("Final Project for Developing Data Products JHU course, coursera."),
       p("Github repository at https://github.com/angieFelipe/Dev.-Data-Project-Final-Project"),
       p("Angie Felipe"),
       p("03/06/2018"),
       p(a("Github repository link", href="https://github.com/angieFelipe/Dev.-Data-Project-Final-Project")),
       hr()
    )
  )
))
