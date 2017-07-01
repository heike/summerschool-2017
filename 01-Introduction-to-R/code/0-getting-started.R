## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  message = FALSE,
  cache = FALSE,
  fig.height = 2,
  fig.width = 5,
  collapse = TRUE,
  comment = "#>"
)

## ---- eval = FALSE, echo = FALSE-----------------------------------------
## # devtools::install_github("metacran/crandb")
## # pkgs <- crandb::list_packages(limit = 999999)
## # length(pkgs)
## # [1] 7330

## ---- eval = FALSE-------------------------------------------------------
## curl::curl_download(
##   "https://raw.githubusercontent.com/heike/rwrks/gh-pages/summerschool/01-Introduction-to-R/knitr/0-getting-started.Rmd",
##   "0-getting-started.Rmd"
## )
## file.edit("0-getting-started.Rmd")

## ---- eval = FALSE-------------------------------------------------------
## curl::curl_download(
##   "https://raw.githubusercontent.com/heike/rwrks/gh-pages/summerschool/01-Introduction-to-R/code/0-getting-started.R",
##   "0-getting-started.R"
## )
## file.edit("0-getting-started.R")

