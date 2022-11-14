seattle <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Seattle.csv")
dallas <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Dallas.csv")
new_orlean <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/NewOrleans.csv", sep = ";")

seattle_race <- seattle %>%
  group_by(Subject_Race) %>%
  summarize(total_by_race_seattle = n()) %>%
  mutate(ID = row_number())
colnames(seattle_race)[1] ="Race"

dallas_race <- dallas %>%
  group_by(CitRace) %>%
  summarize(total_by_race_dallas = n()) %>%
  mutate(ID = row_number())
colnames(dallas_race)[1] ="Race"

new_orlean <- separate_rows(new_orlean, Subject.Ethnicity, sep = " | ")
new_orlean_race <- new_orlean %>%
  group_by(Subject.Ethnicity) %>%
  summarize(total_by_race_new_orleans = n())
new_orlean_race <- new_orlean_race[-1 : -2,]
new_orlean_race <- new_orlean_race[-7,]
new_orlean_race <- new_orlean_race[-2,]
new_orlean_race[nrow(new_orlean_race) + 1, ] <- NA
new_orlean_race[nrow(new_orlean_race) + 1, ] <- NA
new_orlean_race <- new_orlean_race %>%
  mutate(ID = row_number())


df <- left_join(seattle_race, dallas_race, by = 'ID')
df <- left_join(df, new_orlean_race, by = 'ID')
df <- df %>%
  select(c(1,2,4,5,6,7))
