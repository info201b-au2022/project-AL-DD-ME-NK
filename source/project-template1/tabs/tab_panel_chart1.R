# tab_panel_chart1

source("app_server.R")

library(shiny)

tab_panel_chart1 <-tabPanel(
    "Chart 1",
    input_year_chart1,
    plotlyOutput("chart1")
)

