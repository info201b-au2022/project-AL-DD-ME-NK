library(tidyverse)
new_orlean <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/NewOrleans.csv", sep = ";")
# make a bar chart based off officer experience

new_orleans <- separate_rows(new_orlean, Officer.Years.of.Service, sep = " | ")
service_count <- new_orleans %>% 
group_by(Officer.Years.of.Service) %>%
summarise(total = n())


service_count <- service_count[-1 : -2,]
service_count$Officer.Years.of.Service <- as.numeric(as.character(service_count$Officer.Years.of.Service))
 service_count <- service_count %>%
   arrange(Officer.Years.of.Service)

barplot <- ggplot(service_count, aes(Officer.Years.of.Service , total)) +
  geom_bar(stat = "identity", width = 0.75, fill="steelblue") +
  labs(title = "Total Amount of Use of Force by Years of Service", x = "Officers Years of Service", y = "Total Use of Force")
