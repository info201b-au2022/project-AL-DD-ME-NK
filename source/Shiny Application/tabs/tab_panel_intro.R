# tab_panel_intro

library(shiny)
tab_panel_intro <-tabPanel(
    "Introduction",
    hr(),
    hr(),
    h1("Introduction"),
    img(src = "systemic_racism.jpeg"),
    hr(),
    h2("Overview"),
    p("This project investigates systemic racism in the US through police departments. We are investigating the
      incidents that involve the use of force by law enforcement. Some factors we are analyzing are the subjects
      race, officers level of experience, and outside factors that may have led officers to use force. Through this
      we hope to identify possible trends and factors that may lead to certain groups being more likely to become
      victims in incidents involving the use of force."),
    hr(),
    h2("Questions"),
    strong("Do certain groups have higher rates of being victims of the use of force by police?"),
    p("This is important as it increases the divide between groups in society. Research has consistently shown
    that minorities feel that they are more likely to be singled out by police and have higher rates of distrust
    towards law enforcement."),
    strong("Does officer experience and training correlate with the frequency of force being used?"),
    p("Investigating whether law enforcement is properly trained is important in understanding whether training is
      playing a significant role in the rates of incidents involving the use of force. The question arises whether
      officers that lack experience may be more likely to resort to force to handle a situation."),
    strong("What outside factors increase the chances of force being used?"),
    p("Exploring factors that may increase the risk of force being used can help address the situation by finding
      solutions to fix the causes. The federal government can fund the establishment of institutions that state
      governments may not be able to afford."),
    hr(),
    h2("Data"),
    a(href = "https://data.seattle.gov/Public-Safety/Use-Of-Force/ppi5-g2bj", "Seattle Police Department"),
    p("The Seattle Police Department has been collecting data since June of 2014. It collects information on the
      subject and also the date of the incident. From the dataset, we are able to analyze whether certain races
      account for a higher percentage of incidents and whether those trends can be seen through many years."),
    a(href = "https://data.nola.gov/Public-Safety-and-Preparedness/NOPD-Use-of-Force-Incidents/9mnw-mbde", "New Orleans Police Department"),
    p("The data for the New Orleans Police Department data is collected daily since October of 2016. The data collected
      include the date, subject information, and also information on the officers involved. It provides information on the
      years of experience the officers involved have allowing us to answer the question of whether training correlates
      with the frequence of force being used."),
    a(href = "https://www.dallasopendata.com/Public-Safety/Police-Response-to-Resistance-2020/nufk-2iqn", "Dallas Police Department"),
    p("The data for the Dallas Police Department only contains data from 2020. Information that is collected include
      information on the subject, date, officers, and also outside factors that were involved in the incident. Outside
      factors include drugs, alcohol, mental illness, ect. This data will allow us to explore whether these factors
      may increase the chances of force being used and if so, which factors are the most impactful."),
    hr()
)
