seattle <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Seattle.csv")
dallas <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Dallas.csv")
new_orlean <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/NewOrleans.csv", sep = ";")

seattle_gender <- seattle %>%
  group_by(Subject_Gender) %>%
  summarize(total_by_gender_seattle = n())
seattle_gender <- seattle_gender[-1,]
# dallas_race <- dallas %>%
#   group_by(CitRace) %>%
#   summarize(total_by_race_dallas = n())
# 
# new_orlean <- separate_rows(new_orlean, Subject.Ethnicity, sep=" | ")
# new_orlean <- new_orlean %>%
#   group_by(Subject.Ethnicity) %>%
#   summarize(total = n()) 
# new_orlean <- new_orlean[-1:-2,]
# new_orlean <- new_orlean[-7,]
