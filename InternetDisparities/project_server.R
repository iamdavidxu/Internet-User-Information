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
library(ggplot2)
library(shiny)
<<<<<<< HEAD
library(maps)
=======
library(scales)
>>>>>>> 80f057df2e59d547e7655960588a32f984e28fbc


source("../source/B6.R")
source("../source/B5.R")
source("../source/B4.R")


att <- read.csv("../data/speed_price_att.csv.gz")
att_other <- read.csv("../data/speed_price_att_other_cities.csv.gz")
att_total <- full_join(att, att_other) %>% 
  filter(median_household_income > 0)

fiber_in_state <- att_total %>% group_by(state) %>% 
  count(tolower(technology)) %>% 
  na.omit()
colnames(fiber_in_state) [2] <- "Internet_Type"


#adding column of non-NA state party affiliations
party_affiliation <- c("Republican", "Republican", "Republican", "Democratic", "Democratic", "Democratic", "Swing", "Republican", "Democratic", "Republican", "Republican", "Democratic", "Democratic", "Democratic", "Democratic", "Democratic", "Democratic", "Democratic", "Republican", "Democratic", "Republican", "Republican", "Democratic", "Democratic", "Democratic", "Democratic", "Democratic", "Republican", "Republican", "Republican", "Democratic", "Democratic", "Democratic", "Republican", "Republican", "Republican", "Democratic", "Republican", "Democratic", "Democratic", "Swing", "Republican", "NA")

redlining_speed <- redlining_speed %>%
  mutate(
    redlining_speed, "Party Affiliation" = party_affiliation
    
  )



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
  
  output$redlining_map <- renderPlotly({
    return(plot_choropleth)
    })

  }
