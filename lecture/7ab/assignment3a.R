# Assignment 3
# 
# February 28, 2023
# Chris Seeger



install.packages(c("tidycensus", "tidyverse"))
library(tidycensus)
library(tidyverse)

install.packages("RColorBrewer")  # Install RColorBrewer package
library("RColorBrewer")           # Load RColorBrewer


#working with American Community Survey (ACS) Data
# create a table of the ACS Variables
vars <- load_variables(2021, "acs5")
View(vars)

# Look at the households with no vehicle available
# I started by searching the vars table from above for vehicle
# found B08201. So I did a google search for B08201_001 ACS
#https://www.socialexplorer.com/data/ACS2015/metadata/?ds=ACS15&var=B08201001
#https://censusreporter.org/tables/B08201/
#census reporter was most helpful - I found that I could find out regardless of 
#household size the number without a vehicle.
#B08201_001 All households
#B08201_002 All households without a vehicle

noVehicle <- get_acs(
  geography = "county",
  state = "Iowa",
  variables = "B08201_002",
  year = 2021,
  summary_var = "B08201_001",
  geometry = TRUE
)
plot(noVehicle["estimate"]) #OK, but I want a percent

#I want a percent, so I will mutate noVehicle to add a column

noVehicle <- noVehicle %>%
  mutate(nv_percent = round(estimate/ summary_est, 3)*100)

#A simple plot named 
plot(noVehicle["nv_percent"]) 
#However, the result splits Alaska at the date line. Because this is not an
#area based map, I want to modify the look of this  and correct the title
#so I will use ggplot2 to help. I can do this because I included the geometry 
#from ACS

plot1 <- ggplot(data = noVehicle) +
 geom_sf(aes(fill = nv_percent)) + 
  scale_colour_brewer(palette = "Spectral") +
  coord_sf(crs = "+init=epsg:26915") +
  labs(title = "Percent households without a vehicle.", fill="Percent")
plot1

plot1 + theme(rect = element_blank(), axis.ticks = element_blank(), 
                axis.text.x = element_blank(), axis.text.y = element_blank())