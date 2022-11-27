# tab_panel_chart1

source("app_server.R")

library(shiny)

tab_panel_chart1 <-tabPanel(
    "Chart 1",
    h1("Subject Race in Incidents by Seattle Police Department"),
    input_year_chart1,
    plotlyOutput("chart1")
)

