



install.packages("leaflet", "tidycensus", "tidyverse", "plotly")
library(leaflet)
library(tidycensus)
library(tidyverse)
library(readxl)


#resource for this is https://rstudio.github.io/leaflet/map_widget.html
#resouce https://bookdown.org/nicohahn/making_maps_with_r5/docs/leaflet.html


# Set value for the minZoom and maxZoom settings.
leaflet(options = leafletOptions(minZoom = 0, maxZoom = 2))
#While the info on the above says you can use this option, I have not been
#able to make it work as it does in JavaScript.

map <- leaflet() %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  addMarkers(lng= -93.6347, lat=42.0019, popup="Professor Seeger's Office")
map  # Print the map


# I dislike having to zoom in all the time so I will set the vie center to 
map %>% setView(lng= -93.6347, lat=42.0019, zoom = 14)








