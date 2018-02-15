#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
library(randomForest)
source("R/funcs.R")
load("data/models.79.Rdata")
load("data/models.63.Rdata")

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  output$distTable <- renderTable({
    

    x_TN<-as.numeric(input$x_TN)
    # if(x_TN<0)
    #   x_TN<-NA
    x_TP<-as.numeric(input$x_TP)
    # if(x_TP<0)
      # x_TP<-NA
    x_CHLA<-as.numeric(input$x_CHLA)
    # if(x_CHLA<0)
      # x_CHLA<-NA
    x_AFDM<-as.numeric(input$x_AFDM)
    # if(x_AFDM<0)
      # x_AFDM<-NA
    BioStimScore(x_TN=x_TN, x_TP=x_TP, x_CHLA=x_CHLA, x_AFDM=x_AFDM, mod79 = my.models.79, mod63 = my.models.63)

    })
  
})
