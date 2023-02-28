# Tools you can use to work with data from other countries
#
# February 23, 2023
# Chris Seeger


install.packages(c("tidycensus", "tidyverse", "idbr"))
library(tidycensus)
library(tidyverse)
library(idbr)


#returns a data frame with all variables available in the IDB, along with an 
#informative label;
vars = idb_variables()
view(vars)


#This example retrieves the Rate of natural increase (percent) for all 
#countries in 2015
demo <- get_idb(
  country = "all",
  variables = "RNI",
  year = 2015
)
head(demo)

#A vector can be created to get a group of countries or years as follows
#note the result is in long format - not great for GIS, but good for Tableau!

countries = c("Argentina", "Uruguay", "Chile", "Paraguay", "Bolivia")
years = c("2010", "2015", "2020")

demo2 <- get_idb(
  country = countries,
  variables = "RNI",
  year = years
)
head(demo2)


#Geometry is also provided by the idbr
# for example Sex ratio at birth (males per female) for the selected countries

year = 2014
myTitle =  paste("Sex ratio at birth (males per female) (", year, ")")


sex_ratio_birth <- get_idb(
  country = countries,
  year = year,
  variables = "srb",
  geometry = TRUE,
)

ggplot(sex_ratio_birth, aes(fill = srb)) + 
  theme_bw() + 
  geom_sf() + 
  coord_sf(crs = 'ESRI:54030') + #Chris needs a better coord
  scale_fill_viridis_c() + 
  labs(fill = "Ratio M:F", title = myTitle,
    subtitle = "Selected South America countries", )



#the idb_concepts() function prints out a list of concepts that can be supplied 
#to the concept parameter and will return a group of variables that belong to 
#the same concept (e.g. mortality rates, components of population growth).
concepts = idb_concepts()
view(concepts)

countries = c("France", "Germany", "Spain", "Italy", "Ukraine")

demo3 <- get_idb(
  country = countries,
  #variables = "",
  concept = "Fertility rates",
  year = 2013
)
head(demo3)

ggplot(demo3, aes(x=name, y=grr)) + 
  geom_bar(stat = "identity")

#Or flip the coordinates and add titles
ggplot(demo3, aes(x=name, y=grr)) + 
  geom_bar(stat = "identity", width=0.7) +
  labs(title = "The Title", subtitle = "the Sub Title") +
  coord_flip()





