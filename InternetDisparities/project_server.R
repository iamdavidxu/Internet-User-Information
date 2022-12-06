#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#
library(tidyverse)
library(plotly)
library(shiny)


print(unique(att_total$fastest_speed_price))
#do some dplyr to find the relationship between the price of the fastest internet 
#and the percentage non-white or income below median to see if people are being 
#upcharged or if they don't have enough money to purchase these fast internet prices

#make a slider that will select the race percentage non white adn then you can see the 
#price of 
#somehow compare price fastest, perc non-white, and income below median


source("../source/B6.R")
source("../source/B5.R")


att <- read.csv("../data/speed_price_att.csv.gz")
att_other <- read.csv("../data/speed_price_att_other_cities.csv.gz")
att_total <- full_join(att, att_other) %>% 
  filter(median_household_income > 0)

fiber_in_state <- att_total %>% group_by(state) %>% 
  count(tolower(technology)) %>% 
  na.omit()
colnames(fiber_in_state) [2] <- "Internet_Type"

server <- function(input, output){
  
  output$pie_chart_state <- renderPlot({
    return(build_state_pie(fiber_in_state, input$state.choice))
  })
  output$pie_chart <- renderPlot({
    return(build_pie(fiber_in_state))
  })
  output$speed_chart <- renderPlotly({
    return(ISP_Speeds_plot)
  })
  output$race_scatter <- renderPlot({
    return(build_scatter(att_total, input$race_perc))
  })

}
