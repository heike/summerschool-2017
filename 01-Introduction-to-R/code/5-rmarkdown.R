## ---- eval = FALSE-------------------------------------------------------
## curl::curl_download(
##   "https://raw.githubusercontent.com/heike/rwrks/gh-pages/summerschool/01-Introduction-to-R/knitr/5-rmarkdown.Rmd",
##   "5-rmarkdown.Rmd"
## )
## file.edit("5-rmarkdown.Rmd")

## ----chunk1, verbatim = TRUE---------------------------------------------
1 + 1

## ----chunk2, engine = 'python', verbatim = TRUE--------------------------
print "a" + "b"

## ----setup, verbatim = TRUE----------------------------------------------
knitr::opts_chunk$set(message = FALSE, warning = FALSE)

## ------------------------------------------------------------------------
m <- lm(mpg ~ disp, data = mtcars)
summary(m) # output isn't very attractive

## ------------------------------------------------------------------------
library(pander)
pander(m)

## ------------------------------------------------------------------------
a <- anova(m)
a

## ------------------------------------------------------------------------
pander(a)

## ------------------------------------------------------------------------
methods(pander)

