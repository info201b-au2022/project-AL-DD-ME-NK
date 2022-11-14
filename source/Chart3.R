#Pie Chart of Factors (Dallas PD)

#install.packages("ggplot2")
library(ggplot2)
#install.packages("dplyr")
library(dplyr)
#install.packages("reshape2")
library(reshape2)
#install.packages("packcircles")
library(packcircles)
#install.packages("randomcoloR")
library(randomcoloR)

dallas <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Dallas.csv")

factors_df <- dallas %>%
  group_by(CIT_INFL_ASSMT) %>%
  summarize(total = n())

factors_df$CIT_INFL_ASSMT[2] <- "Alcohol"
factors_df$CIT_INFL_ASSMT[3] <- "Alcohol and unknown drugs"

cords <- circleProgressiveLayout(factors_df$total, sizetype = 'area')

newfactors <- cbind(factors_df, cords)

newfactorcord <- circleLayoutVertices(cords)

palette <- randomColor(13, hue = "red", luminosity = "light")

factors_graph <- ggplot() +
  geom_polygon(data = newfactorcord, aes(x, y, group = id, fill = as.factor(id), colour = "black", alpha = 0.6)) +
  geom_text(data = newfactors, aes(x, y, size = total, label = paste0(CIT_INFL_ASSMT, '\n', total))) +
  coord_equal() +
  theme(axis.line= element_blank()) +
  theme(axis.text = element_blank()) +
  theme(axis.ticks = element_blank()) +
  labs(x = NULL, y = NULL, fill = NULL) +
  labs(title = "Outside Factors Associated With Use of Force") +
  labs(subtitle = "Size by Factors") +
  scale_fill_manual(values = palette) +
  theme(legend.position = "none") +
  scale_size_continuous(range = c(2,5))



