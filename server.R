#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

        pobEsp <- read.csv(text=getURL("https://raw.githubusercontent.com/angieFelipe/Dev.-Data-Project-Final-Project/master/pobEsp.csv"))
        pobEsp<-pobEsp[,-1]
        pobEsp$sexo<-as.factor(pobEsp$sexo)
        levels(pobEsp$sexo) <- c("Male","Female")
        options(scipen = 999) # turns of scientific notations like 1e+40
  output$distPlot <- renderPlot({
    
    # generate bins based on input$bins from ui.R
          #reading the dataset
         
          #introduce the selected year
          n<-input$year
          pob<-pobEsp[pobEsp$year==n,c(1,2,4)]

    
    # draw the plot for the year
    
    ggplot(data=pob) +
            geom_bar(aes(edad,poblacion,fill=sexo), stat = "identity",subset(pob,pob$sexo=="Male")) +
            geom_bar(aes(edad,-poblacion,fill=sexo), stat = "identity",subset(pob,pob$sexo=="Female")) +
            scale_y_continuous(labels=abs) +
            scale_x_continuous(breaks=seq(0,100,10),labels=seq(0,100,10)) +
            labs(title="Spanish population pyramid by age and sex", 
                 subtitle=paste0("year: ",n),
                 caption = "data from INE",
                 x = "Age",
                 y = "Resident Population") +
            coord_flip()
    
    
    
  })
  
})
