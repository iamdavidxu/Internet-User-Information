#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

number_slider <- sliderInput(
  inputId = "slider",
  label = "Test Slider",
  min = 0,
  max = 10,
  value = 5,
)


# Define UI for application that draws a histogram
ui <- shinyUI(fluidPage(
  
  navbarPage("Internet Information", 
             tabPanel("Introduction"),
             tabPanel("Page 1",
                      sidebarLayout(
                        sidebarPanel(
                          number_slider
                        ),
                        
                        mainPanel(
                          textOutput("test_word")
                        )
                      )
             ),
             tabPanel("Page 2",
                      sidebarLayout(
                        sidebarPanel(
                          #add widgets and input things here
                          
                        ),
                        
                        mainPanel(
                          #add main code here like plots
                          
                        )
                      )
             ), 
             tabPanel("Page 3",
                      sidebarLayout(
                        sidebarPanel(
                          #add widgets and input things here
                          
                        ),
                        
                        mainPanel(
                          #add main code here like plots
                          
                        )
                      )
             ), 
             tabPanel("Summary"),
                      
  
  )  
  
))
