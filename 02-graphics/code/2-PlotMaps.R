## ---- echo=FALSE, message=FALSE------------------------------------------
library(knitr)
opts_knit$set(progress = TRUE, verbose = TRUE, width = 50)

library(ggplot2)
library(dplyr)

## ---- message = FALSE----------------------------------------------------
states <- map_data("state")

head(states)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(long, lat, geom = "point", data = states)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(long, lat, geom = "path", data = states, group = group) + 
    coord_map()

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(long, lat, geom = "polygon", data = states, group = group) + 
    coord_map()

## ---- tidy= FALSE--------------------------------------------------------
statereg <- read.csv("https://raw.githubusercontent.com/heike/summerschool-2017/master/02-graphics/data/statereg.csv", stringsAsFactors = FALSE)

head(statereg)

## ------------------------------------------------------------------------
states.class.map <- left_join(states, statereg, by = c("region" = "State"))
head(states.class.map)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(long, lat, geom = "polygon", data = states.class.map, 
      group = group, fill = StateGroups, colour = I("black")) + 
    coord_map() 

## ------------------------------------------------------------------------
states.stats <- read.csv("http://heike.github.io/rwrks/summerschool/data/states.stats.csv", stringsAsFactors = FALSE)
head(states.stats)

## ------------------------------------------------------------------------
states.map <- left_join(states, states.stats, by = c("region" = "state.name"))
head(states.map)

## ---- fig.height=4, fig.width=9.5----------------------------------------
qplot(long, lat, geom = "polygon", data = states.map, 
      group = group, fill = avg.qlrest2) + coord_map()

## ------------------------------------------------------------------------
states.sex.stats <- read.csv("http://heike.github.io/rwrks/02-r-graphics/data/states.sex.stats.csv", stringsAsFactors = FALSE)
head(states.sex.stats)

## ------------------------------------------------------------------------
states.sex.map <- left_join(states, states.sex.stats, by = c("region" = "state.name"))
head(states.sex.map)

## ---- fig.height=4, fig.width=9.5----------------------------------------
qplot(long, lat, geom = "polygon", data = states.sex.map, 
      group = group, fill = avg.drnk) + coord_map() + 
    facet_grid(. ~ sex)

## ------------------------------------------------------------------------
states.health.stats <- read.csv("https://raw.githubusercontent.com/heike/summerschool-2017/master/02-graphics/data/states.health.stats.csv")

## ---- fig.height=3, fig.width=7------------------------------------------
library(ggthemes)
qplot(long, lat, geom="polygon", data = states.map, group = group, fill = avg.drnk) + 
  coord_map() +  
  scale_fill_gradient2(limits = c(1.5, 3),low = "lightgray", high = "red") + 
  theme_map()  +
  ggtitle("Map of Average Number of Alcoholic Beverages Consumed Per Day by State") +
  theme(legend.position="right")

