install.packages(c("tidycensus", "tidyverse", "sf" ))
library(tidycensus)
library(tidyverse)
library(sf)

langList = c(
  "Only English" = "C16001_002",
  "Spanish" = "C16001_003", 
  "Chinese" = "C16001_021",
  "Arabic" = "C16001_033"
)

county = c(
  "Boone","Story","Polk"
)

iowa_558Lang <- get_acs(
  geography = "county",
  variables = langList,
  state = "IA",
  county = county,
  output = "wide",
  geometry = TRUE
)

st_write(iowa_558Lang, "iowa_558Lang2.shp")
