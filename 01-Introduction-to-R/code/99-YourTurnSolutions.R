### Motivating Example
---------------------------------------------
head(tips)

# summary of total bills
summary(tips$total_bill)

#boxplots of rate by day of week
qplot(day, rate, geom="boxplot",data=tips)

#average tip size for smokers
mean(tips$tip[tips$smoker=="Yes"])

### Basics
---------------------------------------------

## Your turn 1
 # Find out how many rows and columns the `iris' data set has.
 # Figure out at least 2 ways to do this.
  
  data(iris)
  
  # first way: 
  nrow(iris)
  ncol(iris)
  
  # second way: 
  dim(iris)

 # Use rep to construct the following vector: 1 1 2 2 3 3 4 4 5 5

  rep(c(1:5), each=2)

 # Use rep to construct this vector: 1 2 3 4 5 1 2 3 4 5 1 2 3 4 5
  
  rep(c(1:5), times=3)
  
## Your Turn 2 - Indexing with Logicals
	# Find out how many people tipped over 20%
	
	sum(tips$rate > .2)

	# Calculate the sum of the total bills of anyone who tipped over 20%
	
	sum(tips$total_bill[tips$rate > .2])  

## Your Turn 3 - Diamonds data
  	library(ggplot2)
  	data(diamonds)

 	# Read up on the dataset (?diamonds)
  	?diamonds
  
 	# Plot price by carat (use qplot - go back to the motivating 
 	# example for help with the syntax)

	qplot(x = carat, y = price, data=diamonds)

 	# Create a variable ppc for price/carat. Store this variable as a column
 	# in the diamonds data
  	
  	diamonds$ppc <- diamonds$price/diamonds$carat
  
 	# Make a histogram of all ppc values that exceed $10000 per carat
 
	 qplot(data = diamonds[diamonds$ppc > 10000,], x = ppc)
  
 	# Explore any other interesting relationships you find:

	# price by depth
	
	qplot(x = depth, y = price, data = diamonds)
	
	# ppc histogram colored by cut
	
	qplot(x = ppc, data = diamonds, fill = cut)

	# Compare the price of "Fair" diamonds and "Ideal" diamonds
 	# using summary. If you want to try to do a t-test to test for a
 	# difference in the mean of the prices.

 	fair.diamond.price <- diamonds$price[diamonds$cut=="Fair"]
 	ideal.diamond.price <- diamonds$price[diamonds$cut=="Ideal"]

	summary(fair.diamond.price)
 	summary(ideal.diamond.price)

 	t.test(fair.diamond.price, ideal.diamond.price)
 	# Conclusion: the price of a fair diamond is between $719.91 and $1082.53
 	# greater, on average, than the price of an ideal diamond.




### Data Structures
---------------------------------------------
## Your Turn 1 - Data Frames
  # Make a data frame with column 1: 1,2,3,4,5,6 and column 2:a,b,a,b,a,b
    
    newdf <- data.frame(nums=1:6, lets=rep(letters[1:2],3))
    newdf

  # Select only rows with value "a" in column 2 using logical vectors

    newdf[which(newdf$lets=="a"), ]  

  # mtcars is a built in data set like iris: read the values from row 4 by indexing

   head(mtcars)
    #4th row
    mtcars[4,]


## Your Turn 2 - Lists
  # Create a list containing a vector and a 2x3 data frame

    mylist <- list(1:5, newdf2 = data.frame(nums=1:2, lets=letters[1:2], LETS = LETTERS[1:2]))
    mylist

  # Use indexing to select the data frame from your list

    mylist[[2]]

  # Use further indexing to select the first row from the data frame in your list

    mylist[[2]][1,]


## Your Turn 3 - Examining Objects

  # View the top 8 rows of mtcars data

    head(mtcars, 8)

  # What type of object is the mtcars data set?

    str(mtcars)

  # How many rows are in iris data set? (try finding this using dim or indexing + length)
  
    dim(iris)
    # -or-
    length(iris[,1])

  # Summarize the values in each column in iris data set

    summary(iris)

## Your Turn 4 - Reading in a text file
  yourturndata <- read.table("yourturndata.txt",header=T)
  yourturndata
  
# -------------- Below your turn removed in this version ------------ #
## Your Turn 4 - Saving output as an object

  # Pull the p-value from the t-test of a difference between Sepal Lengths 
  # of setosa and versicolor species from the Iris data

  t.test(Sepal.Length ~ Species, data=iris[iris$Species!="virginica",])

  # save the output of the t-test to an object

  tout2 <- t.test(Sepal.Length ~ Species, data=iris[iris$Species!="virginica",])

  # can use the str() function to examine the output type

  str(tout2)

  # pull off the pvalue

  tout2$p.value
# -------------------------------------------------------------------- #

 


### Programming and Packages
---------------------------------------------
  
# Create a function that takes numeric input and provides the mean
# and a 95% confidence interval for the mean for the data (the t.test
# function could be useful)
  
mean.ci <- function(x){
  tt <- t.test(x)
  data.frame(lower.bound=tt$conf.int[1], mean=tt$estimate, upper.bound=tt$conf.int[2])
}

# Add checks to your function to make sure the data is either numeric
# or logical. If it is logical convert it to numeric.

mean.ci <- function(x){
  if(is.numeric(x) | is.logical(x)){
    if(is.logical(x)){
      x <- as.numeric(x)
    }
    tt <- t.test(x)
    data.frame(lower.bound=tt$conf.int[1], mean=tt$estimate, upper.bound=tt$conf.int[2])
  } else{
    warning("Error: Logical or Numeric Input Required")
  }
  
}

# try it out:
mean.ci(rnorm(100))
mean.ci(rnorm(100)>0)
mean.ci(as.character(rnorm(100)))

# Loop over the columns of the diamonds data set and apply your
# function to all of the numeric columns.


for(column.index in 1:ncol(diamonds)){
  print(names(diamonds)[column.index]) # print the name
  print(mode(diamonds[,column.index])) # print the data type
  print(mean.ci(diamonds[,column.index])) # print the function output
}
