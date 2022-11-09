seattle <- read.csv("/Users/anthonylee/Documents/info201/Project/project-AL-DD-ME-NK/data/Seattle.csv")
dallas <- read.csv("/Users/anthonylee/Documents/info201/Project/project-AL-DD-ME-NK/data/Dallas.csv")
new_orlean <- read.csv("/Users/anthonylee/Documents/info201/Project/project-AL-DD-ME-NK/data/NewOrleans.csv", sep = ";")

summary_info <- list()
summary_info$number_race_seattle <- unique(seattle$Subject_Race)
summary_info$number_race_dallas <- unique(dallas$CitRace)
summary_info$males_seattle <- sum(str_detect(seattle$Subject_Gender, "Male"))
summary_info$female_seattle <- sum(str_detect(seattle$Subject_Gender, "Female"))
summary_info$males_dallas <- sum(str_detect(dallas$CitSex, "Male"))
summary_info$female_dallas <- sum(str_detect(dallas$CitSex, "Female"))
summary_info$factors <- unique(dallas$CIT_INFL_ASSMT)
summary_info$dallas_injured <- dallas %>%
  filter(CIT_INJURED == "Yes") %>%
  summarize(total_injured = length(CIT_INJURED))
summary_info$new_orleans_unjustified <- new_orlean %>%
  filter(Disposition == "UOF Not Justified") %>%
  summarize(total_unjustified = length(Disposition))
summary_info$new_orleans_unjustified_prop <- summary_info$new_orleans_unjustified / length(new_orlean$Disposition)




#For Chart 2
new_orleans <- separate_rows(new_orlean, Officer.Years.of.Service, sep=' | ')
df <- new_orleans %>%
  group_by(Officer.Years.of.Service) %>%
  summarize(total = n()) 
  filter(total == max(total))

df <- df[-1 : -2,]


