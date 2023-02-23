# Find the Percent language spoken in each of the counties in the H2 regions.
# 
# February 15, 2023
# Chris Seeger

vars = idb_variables()
view(vars)


install.packages(c("tidycensus", "tidyverse", "idbr"))
library(tidycensus)
library(tidyverse)
library(idbr)

demo <- get_idb(
  country = "all",
  variables = "RNI",
  year = 2015
)
head(demo)


#write to CSV
write_csv(demo,"countries.csv")
