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
ui <- fluidPage(
  number_slider,
  textOutput("test_word")
)

