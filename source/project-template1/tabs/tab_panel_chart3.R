# tab_panel_chart3

library(shiny)

tab_panel_chart3 <-tabPanel(
    "Chart 3",
    input_race_chart3,
    plotlyOutput("chart3")
)
