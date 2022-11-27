#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
#install.packages("ggplot2")
library(ggplot2)
#install.packages("plotly")
library(plotly)
#install.packages("dplyr")
library(dplyr)
#install.packages("stringr")
library(stringr)
#install.packages("lubridate")
library(lubridate)

seattle <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Seattle.csv")

input_year_chart1 <- selectInput(
  inputId = "year_input",
  label = "Select Year",
  choices = c(2014, 2015, 2016, 2017, 2018, 2019, 2020),
  selected = 2014)

seattle$Occured_date_time <- as.Date(mdy_hms(seattle$Occured_date_time))
seattle$Occured_date_time <- format(seattle$Occured_date_time, format = "%Y")

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    racedf <- seattle %>%
      filter(Occured_date_time == input$year_input) %>%
      group_by(Subject_Race) %>%
      summarize(total_by_race = n()) %>%
      mutate(letterID = LETTERS[row_number()]) %>%
      mutate(percent = round(total_by_race / sum(total_by_race) * 100))
    
    chart <- plot_ly(racedf, labels=~Subject_Race, values = ~total_by_race, type = 'pie')
    chart
  })
}


