# tab_panel_summary

library(shiny)

tab_panel_summary <-tabPanel(
    "Summary",

    hr(), 
    hr(), 
    ## Summary
    p("The interactive graphs presented show viewers various trends in use of force incidents in America over time. As policing has become an increasingly prominent and controversial issue, it is imperative to collect, aggregate, analyze, and interpret this data to draw reasonable conclusions. We aggregated the data to make a data visualization showing the use of force incidents by race, then a visualization that shows use of force by years of service, and lastly by factors that prompted use of force. From the first graph, it can be seen that 32.8% of use of force reports in Seattle affected Black people, yet the Black population only accounts for less than 7.1% of the population in Seattle. This shows a disproportionate rate of impact towards Black indivuals in use of force cases versus White individuals. This may point to a systemic problem because historically Black individuals have been profiled and targetted by police in criminal cases, and as a result are more likely to encounter use of force events at a higher rate than White individuals. In the second chart, the highest spike is noted in officers with 6 years of experience or less, while the lowest spike is seen beyond 32 years of experience. The pattern of the trend shows a sharp decrease in use of force events in officers with more years of service. Based on this chart, it can be reasonably concluded that there is a significantly higher likelihood of use of force by officers with less experience, which may be caused by a lack of experience, training, and time of the job. The last graph shows whether different factors in reasons for use of force affect which races are more impacted by police use of force. The factors include alcohol, unknown drugs, talking to oneself, agitated, mentally unstable, and so on. Yet in each of these charts it can be seen that Black indivuals have the highest concentration of incidents, which points towards a systemic issue in policing. The various reasons for use of force did not impact the race that was most highly affected, which shows that Black individuals are more likely to be targetted in a use of force event regardless of the reason. With these graphs, we can essentially determine who is affected the most, what factors may or may not play a role, and how these trends increase or decrease over time. It provides data-driven conculsions about use of force in policing and can potentially help cuase change for the better in policing for the future.")
)


