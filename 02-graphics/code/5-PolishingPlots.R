## ---- echo=FALSE, message=FALSE------------------------------------------
library(ggplot2)

states <- map_data("state")

## ---- fig.height=2, fig.width=7------------------------------------------
p <- qplot(carat, price, data = diamonds, colour = clarity); p

## ---- fig.height=2, fig.width=7------------------------------------------
p + theme_bw()

## ---- fig.height=4, fig.width=7------------------------------------------
library(ggthemes)
p + theme_tufte()

## ---- fig.height=4, fig.width=7------------------------------------------
p + theme_economist() + scale_colour_economist() 

## ---- fig.height=4, fig.width=7------------------------------------------
p + theme_excel() + scale_colour_excel()

## ---- fig.height=4, fig.width=7------------------------------------------
p + theme_wsj()

## ---- eval=FALSE---------------------------------------------------------
## theme_set(theme_bw())

## ------------------------------------------------------------------------
theme_bw()

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(carat, price, data = diamonds) +
    ggtitle("Price vs Carat for Diamonds")

## ---- fig.height=4, fig.width=7------------------------------------------
p <- qplot(carat, price, data = diamonds) + 
    ggtitle("Price vs Carat for Diamonds")
p + theme(plot.title = element_text(colour = "red", angle = 45))

## ---- fig.height=3, fig.width=7------------------------------------------
p + theme(
    axis.text.x = element_blank(),
    axis.text.y = element_blank(),
    axis.title.x = element_blank(),
    axis.title.y = element_blank(),
    axis.ticks.length = unit(0, "cm")
)

## ---- eval=FALSE---------------------------------------------------------
## qplot(price, carat, data = diamonds)
## 
## ggsave("diamonds.png")
## ggsave("diamonds.pdf")
## ggsave("diamonds.png", width = 6, height = 6)

## ---- eval=FALSE---------------------------------------------------------
## dplot <- qplot(carat, price, data = diamonds)
## ggsave("diamonds.png", plot = dplot, dpi = 72)

