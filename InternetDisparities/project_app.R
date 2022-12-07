library(shiny)
library(shinythemes)
library(ggplot2)
library(plotly)
library(maps)
library(scales)
library(plotly)
library(tidyverse)
library(ggplot2)
library(rsconnect)
# Use source() to execute the `app_ui.R` and `app_server.R` files. These will
# define the UI value and server function respectively.


source("project_ui.R")
source("project_server.R")

# You will need to fill in the `app_ui.R` file to create the layout.
# Run the app through this file.

# Create a new `shinyApp()` using the loaded `ui` and `server` variables

shinyApp(ui = ui, server = server)

