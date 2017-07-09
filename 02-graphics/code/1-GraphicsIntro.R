## ---- echo=FALSE---------------------------------------------------------
library(ggplot2)

## ---- eval = FALSE-------------------------------------------------------
## curl::curl_download(
##   "https://raw.githubusercontent.com/heike/summerschool-2017/master/02-graphics/code/0-Setup.R",
##   "0-Setup.R"
## )
## file.edit("0-Setup.R")

## ---- echo=FALSE---------------------------------------------------------
library("dlstats")

dframe <- cran_stats("ggplot2")
ggplot(data = dframe[-nrow(dframe),], aes(x = end, y = downloads)) + geom_point() + geom_line() +
  ylab("Number of monthly downloads") + xlab("Date") +
  ggtitle("Number of monthly downloads of ggplot2")

## ------------------------------------------------------------------------
head(diamonds)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(carat, price, geom = "point", data = diamonds)

## ---- fig.height=3, fig.width=7------------------------------------------
qplot(carat, log(price), geom = "point", data = diamonds, 
	alpha = I(0.2), colour = color, 
	main = "Log price by carat weight, grouped by color") + 
    xlab("Carat Weight") + ylab("Log Price")

## ------------------------------------------------------------------------
tips <- read.csv("https://raw.githubusercontent.com/heike/summerschool-2017/master/02-graphics/data/tips.csv")

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(price, geom = "histogram", data = diamonds)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(price, geom = "histogram",  binwidth = 50, data = diamonds)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(price, geom = "histogram", data = diamonds, binwidth = 100, facets = .~clarity)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(clarity, log(price), geom = "boxplot", data = diamonds)

## ---- fig.height=3, fig.width=7------------------------------------------
qplot(clarity, log(price), geom = "boxplot", data = diamonds, 
	main = "Boxplots of log Diamond Prices Grouped by Clarity") +
	geom_jitter(alpha = I(.025))

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(clarity, log(price)/carat, geom = "boxplot", data = diamonds)

## ------------------------------------------------------------------------
titanic <- as.data.frame(Titanic)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(Survived, geom = "bar", data = titanic, weight = Freq)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(Survived, geom = "bar", data = titanic, weight = Freq, 
      facets = Sex~Class)

