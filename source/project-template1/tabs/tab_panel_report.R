# tab_panel_report

library(shiny)
library("markdown")

tab_panel_report <-tabPanel(
  "Report",
  includeMarkdown("tabs/report.md")
)

