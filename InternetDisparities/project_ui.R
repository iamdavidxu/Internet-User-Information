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
                          h1("Introduction"),
                          p("For this project we plan on exploring the relationship between internet service speed and prices in different areas across the United States, and how different internet service providers redline certain areas to essentially price-gouge lower income areas."),
                          p("During the Covid-19 pandemic, people were forced to remain online for a much more extensive amount of time than ever before, and this lead to internet service providers increasing prices to maximize profits.
                          Lower-income areas often have high prices for low internet speeds, something that is completely unnecessary and only goes to further the socioeconomic differences in major cities and the United States as a whole.
                          The data we are using for this project is hosted on Kaggle and has three data files with information primarily on AT&T, as well as a summary file with specific demographic breakdowns of areas.
                          We will compare the data for AT&T across the country to determine which areas are experiencing the most Internet Redlining."),
                          p("Some questions we are exploring include:"),
                          p("What types of Internet are most often used, and what are the implications of usage of those types?"),
                          p("How does the Internet speed for each provider vary by download and upload speed?"),
                          p("How are different areas across the country impacted by internet redlining practices?"),
                          img(src = "https://mrkp-static-production.themarkup.org/uploads/2022/10/isp_main-841x473.jpg", height = 841, width = 473)
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
