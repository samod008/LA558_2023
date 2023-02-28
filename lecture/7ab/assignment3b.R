# Assignment 3b Speak only English
# 
# February 15, 2023
# Chris Seeger



install.packages(c("tidycensus", "tidyverse"))
library(tidycensus)
library(tidyverse)


#working with American Community Survey (ACS) Data
# create a table of the ACS Variables
vars <- load_variables(2021, "acs5")
View(vars)

#Population that speaks only English B16001_002
speakOnlyEnglish <- get_acs(
  geography = "state",
  variables = "B16001_002",
  summary_var = "B16001_001",
  year = 2021
  #geometry = TRUE.  #not needed because we are making a chart
)

speakOnlyEnglish <- speakOnlyEnglish %>%
  mutate(onlyEng_percent = round(estimate/ summary_est, 3)*100)

plot2 <-ggplot(data=speakOnlyEnglish, aes(x=NAME, y=onlyEng_percent)) +
  geom_bar(stat="identity") +
  labs(title = "Percent of population speaking only English", x = "", y = "percent") +
  theme(axis.text.x = element_text(angle = 60, hjust = 1))
plot2

geom_bar(stat="identity") +
  theme_minimal()

