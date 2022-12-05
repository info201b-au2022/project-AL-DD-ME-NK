#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#install.packages("tidyr")
library(tidyr)
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
dallas <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Dallas.csv")
new_orleans <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/NewOrleans.csv", sep = ";")


input_year_chart1 <- selectInput(
  inputId = "year_input",
  label = "Select Year",
  choices = c(2014, 2015, 2016, 2017, 2018, 2019, 2020),
  selected = 2014)

seattle$Occured_date_time <- as.Date(mdy_hms(seattle$Occured_date_time))
seattle$Occured_date_time <- format(seattle$Occured_date_time, format = "%Y")

input_race_chart3 <- selectInput(
  inputId = "factor_input",
  label = "Select Factor",
  choices = c("Mentally unstable", "Agitated", "None detected", "Alcohol", "Unknown Drugs", "Incoherent", "Alcohol and unkown drugs", "Unknown",
              "Poor hygiene", "Marijuana", "NULL", "Talking to themselves", "Animal"),
  selected = "Mentall unstable")

dallas$CIT_INFL_ASSMT[dallas$CIT_INFL_ASSMT == "Alchohol"] <- "Alcohol"
dallas$CIT_INFL_ASSMT[dallas$CIT_INFL_ASSMT == "Alchohol and unknown drugs"] <- "Alcohol and unkown drugs"

new_orleans$Date.Occurred <- as.Date(new_orleans$Date.Occurred, "%m/%d/%Y")
new_orleans$Date.Occurred <- format(new_orleans$Date.Occurred, format = "%Y")

input_date_chart2 <- selectInput(
  "date_input",
  label = "Select Year",
  choices = c(2016, 2017, 2018, 2019, 2020, 2021, 2022),
  selected = 2016
)

server <- function(input, output) {
  output$chart1 <- renderPlotly({
    racedf <- seattle %>%
      filter(Occured_date_time == input$year_input) %>%
      group_by(Subject_Race) %>%
      summarize(total_by_race = n()) %>%
      mutate(letterID = LETTERS[row_number()]) %>%
      mutate(percent = round(total_by_race / sum(total_by_race) * 100))
    
    chart1 <- plot_ly(racedf, labels=~Subject_Race, values = ~total_by_race, type = 'pie') %>%
      add_annotations(
        y = 1.08, 
        x = 0.5, 
        text =" Subject Race by Year", 
        showarrow = F,
        font = list(size = 14)
      )
    
    chart1
  })
  
  output$chart3 <-renderPlotly({
    
    factors_df <- dallas %>%
      filter(CIT_INFL_ASSMT == input$factor_input) %>%
      group_by(CitRace) %>%
      summarize(total = n())
    
    factors_df <- factors_df %>%
      rename("race" = "CitRace")
    
    factor <- input$factor_input
    
    chart3 <- ggplotly(ggplot(factors_df, aes(x = race, y = factor)) + 
      geom_dotplot(binaxis = "y", stackdir = "center", binpositions = "all", binwidth = 0.1) + 
      geom_point(aes(size = total)) +
      labs(title = "Factors by Race",
           x = "Subject Race",
           y = "Factor") + 
      theme(plot.title = element_text(hjust = 0.5)))
    
    chart3
  })
  output$chart2 <- renderPlotly({
    
    new_orleans <- separate_rows(new_orleans, Officer.Years.of.Service, sep = " | ")
    service_count <- new_orleans %>% 
      group_by(Officer.Years.of.Service, Date.Occurred) %>%
      filter(Date.Occurred == input$date_input) %>%
      summarise(total = n())
    
    service_count <- service_count[-1 : -2,]
    service_count$Officer.Years.of.Service <- as.numeric(as.character(service_count$Officer.Years.of.Service))
    
    date_service <- service_count %>%
      arrange(Officer.Years.of.Service) 
    
    chart2 <- ggplot(date_service, aes(Officer.Years.of.Service , total)) +
      geom_bar(stat = "identity", width = 0.75, fill="steelblue") +
      labs(title = "Total Amount of Use of Force by Years of Service", x = "Officers Years of Service", y = "Total Use of Force")
      
    chart2
  })
}


