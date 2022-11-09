seattle <- read.csv("/Users/anthonylee/Documents/info201/Project/project-AL-DD-ME-NK/data/Seattle.csv")
dallas <- read.csv("/Users/anthonylee/Documents/info201/Project/project-AL-DD-ME-NK/data/Dallas.csv")
new_orlean <- read.csv("/Users/anthonylee/Documents/info201/Project/project-AL-DD-ME-NK/data/NewOrleans.csv", sep = ";")

seattle_race <- seattle %>%
  group_by(Subject_Race) %>%
  summarize(total_by_race_seattle = n())

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
