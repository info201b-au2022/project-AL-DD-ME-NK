#Pie Chart of Race of Subject (Seattle PD)

#install.packages("tidyverse")
library(tidyverse)
#install.packages("dplyr")
library(dplyr)
#install.packages("reshape2")
library(reshape2)

#Import csv file for Seattle Police Department
seattle <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Seattle.csv")

#Summarize total number of incidents involving use of force by subject race
racedf <- seattle %>%
  group_by(Subject_Race) %>%
  summarize(total_by_race = n()) %>%
  mutate(letterID = LETTERS[row_number()]) %>%
  mutate(percent = round(total_by_race / sum(total_by_race) * 100))

colors <- c("#9400D3", "#964B00", "#0000FF", "#00FF00", "#FFFF00", "#FF7F00", "#FF0000", "#FF69B4")
#Create Visualization
chart <- ggplot(data = racedf, aes(x = '', y = total_by_race, fill = paste0(letterID, ": ", Subject_Race, " (", percent, "%)"))) +
  geom_col(color = "black") +
  geom_bar(width = 1, stat = "identity") +
  geom_text(aes(x = 1.4, label = letterID), position = position_stack(vjust = 0.5)) +
  theme_classic() +
  theme(legend.position = "right") +
  coord_polar("y", start = 0) +
  labs(x = NULL, y = NULL, fill = NULL) +
  labs(title = "Use of Force Incidents by Subject's Race") +
  labs(subtitle = "Percentage by Race") +
  theme(axis.line= element_blank()) +
  theme(axis.text = element_blank()) +
  theme(axis.ticks = element_blank()) 
  

