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

state_chose <- selectInput(
  "state.choice",
  label = "State Picker",
  choices = list(
    "AL" = "AL", "AR" = "AR", "CA" = "CA", "FL" = "FL", "GA" = "GA", 
    "IL" = "IL", "IN" = "IN", "KS" = "KS", 
    "KY" = "KY", "LA" = "LA", "MI" = "MI", "MO" = "MO", "MS" = "MS", 
    "NC"  = "NC", "OH" = "OH", "OK" = "OK", 
    "SC" = "SC", "TN" = "TN", "TX" = "TX", "WI" = "WI"
  )
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
                          state_chose                     
                        ),
                        
                        mainPanel(
                          plotOutput("pie_chart"),
                          plotOutput("pie_chart_state")
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
