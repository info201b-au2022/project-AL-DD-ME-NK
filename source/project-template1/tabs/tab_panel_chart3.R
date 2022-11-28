# tab_panel_chart3

library(shiny)

tab_panel_chart3 <-tabPanel(
    "Chart 3",
    hr(),
    hr(),
    input_race_chart3,
    plotlyOutput("chart3"),
    hr(),
    p("The area encoding chart shows the number of incidents involving the use of force by subject race influenced by outside factors.
      Hovering over each dot on the area encoding chart will show the race of the subject, the number of incidents that year, and
      the outside factor influincing the situation. The purpose was to discover trends to see whether certain factors are more likely
      to affect subjects of certain races in incidents involving the use of force by law enforcement."),
    hr()
)
