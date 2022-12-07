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
library(maps)
library(scales)

source("source/B6.R", local = TRUE)
source("source/B5.R", local = TRUE)
source("source/B4.R", local = TRUE)
source("source/B3.R", local = TRUE)
source("source/B2.R", local = TRUE)

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
  
  output$lrg <- renderTable({
    return(locations_with_lowest_Redling_Grade_ATT)
  })
  
  output$lsn <- renderTable({
    return(lowest_speed_in_non_white_location_ATT)
  })
  
  output$md <- renderTable({
    return(data_in_nation)
  })
  
  output$fam <- renderText({
    return(count)
  })

  }
