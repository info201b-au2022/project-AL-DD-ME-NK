# tab_panel_chart2

library(shiny)

tab_panel_chart2 <-tabPanel(
    "Chart 2",
    hr(),
    hr(),
    h1("Use of Force Incidents by Years of Service"),
    input_date_chart2,
    plotlyOutput("chart2"),
    hr(),
    p("This bar chart shows total use of force compared to total years in service by officers, being able to choose years
      between 2016-2022. Hovering over the bars shows you the years of service and total amount of use of force incidents.
      Our goal in making this visualization was to find trends that might let us know if officers with more experience have
      less incidents.")
)
