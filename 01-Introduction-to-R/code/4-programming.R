## ------------------------------------------------------------------------
foo <- function(arg1, arg2, ...) {
    # Code goes here
    return(output)
}

## ------------------------------------------------------------------------
mymean <- function(data) {
    ans <- sum(data) / length(data)
    return(ans)
}

## ---- eval=FALSE---------------------------------------------------------
## if (condition) {
##     # Some code that runs if condition is TRUE
## } else {
##     # Some code that runs if condition is FALSE
## }

## ------------------------------------------------------------------------
mymean <- function(data) {
    if (!is.numeric(data)) {
        stop("Numeric input is required")
    } else {
        ans <- sum(data) / length(data)
        return(ans)
    }
}

## ------------------------------------------------------------------------
for (i in 1:3) {
    print(i)
}

## ------------------------------------------------------------------------
tips <- read.csv("https://raw.githubusercontent.com/heike/summerschool-2017/master/01-Introduction-to-R/data/tips.csv")

id <- c("total_bill", "tip", "size")
for (colname in id) {
    print(colname)
}

for(colname in id) {
    print(paste(colname, mymean(tips[, colname])))
}

## ------------------------------------------------------------------------
i <- 1
while (i <= 5) {
    print(i)
    i <- i + 1
}

