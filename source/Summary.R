seattle <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Seattle.csv")
dallas <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/Dallas.csv")
new_orlean <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-AL-DD-ME-NK/main/data/NewOrleans.csv", sep = ";")

summary_info <- list()

number_race_seattle <- function() {
  return(unique(seattle$Subject_Race))
}
summary_info$number_race_seattle <- number_race_seattle()

number_race_dallas <- function() {
  return(unique(dallas$CitRace))
}
summary_info$number_race_dallas <- number_race_dallas()

males_seattle <- function() {
  return((sum(str_detect(seattle$Subject_Gender, "Male"))))
}
summary_info$males_seattle <- males_seattle()

female_seattle <- function() {
  return((sum(str_detect(seattle$Subject_Gender, "Female"))))
}
summary_info$female_seattle  <- female_seattle()

males_dallas <- function() {
  return((sum(str_detect(dallas$CitSex, "Male"))))
}
summary_info$males_dallas <- males_dallas()

female_dallas <- function() {
  return((sum(str_detect(dallas$CitSex, "Female"))))
}
summary_info$female_dallas <- female_dallas()

factors <- function() {
  return(unique(dallas$CIT_INFL_ASSMT))
}
summary_info$factors <- factors()

dallas_injured <- function() {
  num_injured <- dallas %>%
  filter(CIT_INJURED == "Yes") %>%
  summarize(total_injured = length(CIT_INJURED))
  return(num_injured)
}
summary_info$dallas_injured <- dallas_injured()

new_orleans_unjustified <- function() {
  total_unjustified <- new_orlean %>%
  filter(Disposition == "UOF Not Justified") %>%
  summarize(total_unjustified = length(Disposition))
  return(total_unjustified)
}
summary_info$new_orleans_unjustified <- new_orleans_unjustified()

new_orleans_unjustified_prop <- function() {
  prop = summary_info$new_orleans_unjustified / length(new_orlean$Disposition)
  return(prop)
}
summary_info$new_orleans_unjustified_prop <- new_orleans_unjustified_prop()



  


