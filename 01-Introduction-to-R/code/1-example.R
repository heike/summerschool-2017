## ---- eval = FALSE-------------------------------------------------------
## curl::curl_download(
##   "https://raw.githubusercontent.com/hofmann/rwrks/gh-pages/01-Introduction-to-R/code/1-example.R",
##   "1-example.R"
## )
## file.edit("1-example.R")

## ------------------------------------------------------------------------
#tips <- read.csv("http://heike.github.io/rwrks/summerschool/data/tips.csv")
tips <- read.csv("../../data/tips.csv")

## ------------------------------------------------------------------------
head(tips)

## ------------------------------------------------------------------------
str(tips)

## ------------------------------------------------------------------------
summary(tips)

## ---- eval=FALSE---------------------------------------------------------
## install.packages("ggplot2")
## library(ggplot2)

## ---- echo=FALSE---------------------------------------------------------
library(ggplot2)

## ---- fig.height=3, fig.width=7------------------------------------------
qplot(x = total_bill, y = tip, geom = "point", data = tips)

## ---- fig.height=3, fig.width=7, echo = FALSE----------------------------
qplot(x = total_bill, y = tip, geom = "point", data = tips)

## ------------------------------------------------------------------------
cor(tips$total_bill, tips$tip)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(total_bill, tip, geom = "point", data = tips) + 
    geom_smooth(method = "lm")

## ---- fig.height=5, fig.width=5, echo = FALSE----------------------------
qplot(x = total_bill, y = tip, geom = "point", data = tips)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(total_bill, tip, geom = "point", data = tips, colour = time)

## ------------------------------------------------------------------------
tips$rate <- tips$tip / tips$total_bill

summary(tips$rate)

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(rate, data = tips, binwidth = .01)

## ------------------------------------------------------------------------
tips[which.max(tips$rate),]

## ---- fig.height=4, fig.width=7------------------------------------------
qplot(total_bill, tip, geom = "point", data = tips, colour = sex)

## ------------------------------------------------------------------------
mean(tips$rate[tips$sex == "Male"])
mean(tips$rate[tips$sex == "Female"])

## ------------------------------------------------------------------------
t.test(rate ~ sex, data = tips)

## ---- fig.height=4, fig.width=4------------------------------------------
qplot(total_bill, tip, geom = "point", data = tips, facets=smoker~sex) 

