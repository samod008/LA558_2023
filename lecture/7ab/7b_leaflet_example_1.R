



install.packages("leaflet", "tidycensus", "tidyverse", "plotly")
library("leaflet")
library("tidycensus")
library("tidyverse")
library("readxl")


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
map %>% setView(lng= -93.6347, lat=42.0019, zoom = 16)














#But now I find myself wanted to have a few options for the map's background





# add some circles to a map
df = data.frame(Lat = 1:10, Long = rnorm(10))
map <- leaflet(df) %>% 
  addCircles()
map <- addTiles() # Add default OpenStreetMap map tiles
map


leaflet() %>%
  setView(lng = 144, lat = -37, zoom = 09) %>%
  addProviderTiles("Stamen.TonerLite",
                   group = "Toner", 
                   options = providerTileOptions(minZoom = 8, maxZoom = 10)) %>%
  addTiles(group = "OSM",
           options = providerTileOptions(minZoom = 8, maxZoom = 10)) %>%
  addProviderTiles("Esri.WorldTopoMap",    
                   group = "Topo") %>%
  addProviderTiles("OpenStreetMap.Mapnik", group = "Mapnik") %>%
  addProviderTiles("CartoDB.Positron",     group = "CartoDB") %>%
  addLayersControl(baseGroups = c("Toner", "OSM", "Topo", "Mapnik", "CartoDB"),
                   options = layersControlOptions(collapsed = TRUE))