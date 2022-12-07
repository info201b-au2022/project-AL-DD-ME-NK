# tab_panel_chart1

source("app_server.R")

library(shiny)

tab_panel_chart1 <-tabPanel(
    "Chart 1",
    hr(),
    hr(),
    h1("Subject Race in Incidents by Seattle Police Department"),
    input_year_chart1,
    plotlyOutput("chart1"),
    hr(),
    p("The pie chart shows the percent of incidents involving the use of force by subject race based on year from 2014-2020.
      Hovering over each section of the pie chart will show the race of the subject, the number of incidents that year, and
      the percetage of incidents that year involving subjects of that race. The purpose was to discover trends over many years
      to see whether certain groups are more likely to be subjects in incidents involving the use of force by law enforcement.
      In addition, we are able to analyze whether incidents against certain races are increasing or staying constant over time."),
    hr()
)

