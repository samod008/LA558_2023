install.packages(c("tidycensus", "tidyverse", "sf" ))
library(tidycensus)
library(tidyverse)
library(sf)

langList1 = c(
  "Total" = "C16001_001",
  "Spanish" = "C16001_003"
)

langList2 = c(
  "Total" = "C16001_001",
  "Chinese" = "C16001_021"
)

langList3 = c(
  "Total" = "C16001_001",
  "Arabic" = "C16001_033"
)


Spanish <- get_acs(
  geography = "county",
  variables = langList1,
  state = "IA",
  output = "wide",
  geometry = FALSE
)

Chinese <- get_acs(
  geography = "county",
  variables = langList2,
  state = "IA",
  output = "wide",
  geometry = FALSE
)

Arabic <- get_acs(
  geography = "county",
  variables = langList3,
  state = "IA",
  output = "wide",
  geometry = FALSE
)

write.csv(Spanish,file='Spanish.csv', row.names=TRUE)
write.csv(Chinese,file='Chinese.csv', row.names=TRUE)
write.csv(Arabic,file='Arabic.csv', row.names=TRUE)