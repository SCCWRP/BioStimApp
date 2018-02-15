#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Biostimulatory Scoring Tool for California"),
  h5("Enter values for biostimulatory factors (nutrients and organic matter). If data are missing, leave blank. The app will automatically select the models that are appropriate for the available data."),
  h5("Charcters are treated as missing data. Negative values are treated as zeros."),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
       textInput(inputId="x_TN",
                   "Total N (mg/L):"),
       textInput(inputId="x_TP",
                    "Total P (mg/L):"),
       textInput(inputId="x_CHLA",
                    "Chlorphyll a (mg/m2):"),
       textInput(inputId="x_AFDM",
                    "Ash-free dry mass (mg/cm2):"),
       submitButton("Run")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       tableOutput("distTable")
    )
  )
))
