## ---- echo=FALSE, message=FALSE------------------------------------------
library(ggplot2)

states <- map_data("state")

## ------------------------------------------------------------------------
load("noaa.rdata")

## ------------------------------------------------------------------------
head(floats, n = 2)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(Longitude, Latitude, colour = callSign, data = floats) + 
    coord_map()

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(Longitude, Latitude, colour = callSign, data = gliders) + 
    coord_map()

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(Longitude, Latitude, colour = callSign, data = boats) + 
    coord_map()

## ---- fig.height=3, fig.width=7, warning=FALSE---------------------------
ggplot() +
    geom_path(data = states, aes(x = long, y = lat, group = group)) + 
    geom_point(data = floats, aes(x = Longitude, y = Latitude, colour = callSign)) +   
    geom_point(aes(x, y), shape = "x", size = 5, data = rig) + 
    geom_text(aes(x, y), label = "BP Oil Rig", 
              size = 5, data = rig, hjust = -0.1) + 
    xlim(c(-91, -80)) + ylim(c(22,32)) + coord_map()

## ---- eval=FALSE---------------------------------------------------------
## qplot(Longitude, Latitude, colour = callSign, data = floats)

## ---- eval=FALSE---------------------------------------------------------
## ggplot(data = floats,
##        aes(x = Longitude, y = Latitude, colour = callSign)) +
##   geom_point() +
##   scale_x_continuous() +
##   scale_y_continuous() +
##   scale_colour_discrete()

## ---- fig.height=3, fig.width=7------------------------------------------
ggplot(data = floats, 
       aes(x = Longitude, y = Latitude, colour = callSign)) +
  geom_point()

## ---- fig.height=4, fig.width=7, echo=FALSE, warning=FALSE---------------
ggplot(aes(x = Depth, y = Temperature, colour = callSign), data = floats) + geom_point()

## ---- fig.height=3, fig.width=7, warning=FALSE---------------------------
ggplot() +
    geom_path(data = states, aes(x = long, y = lat, group = group)) + 
    geom_point(data = floats, aes(x = Longitude, y = Latitude, colour = callSign)) +   
    geom_point(aes(x, y), shape = "x", size = 5, data = rig) + 
    geom_text(aes(x, y), label = "BP Oil Rig", size = 5, data = rig, hjust = -0.1) + 
    xlim(c(-91, -80)) + 
    ylim(c(22, 32)) + coord_map()

## ------------------------------------------------------------------------
animal <- read.csv("https://raw.githubusercontent.com/heike/summerschool-2017/master/02-graphics/data/animal.csv")

## ------------------------------------------------------------------------
library(ggmap)
gmap <- get_map(location=c(rig$x, rig$y), zoom=6)

## ------------------------------------------------------------------------
ggmap(gmap, extent = 'normal') + 
  geom_point(aes(Longitude, Latitude), shape="+", size=5, colour="black", data=subset(animal, Condition=="Dead")) +
  ggtitle("Crosses indicate locations of sightings of dead bird")

