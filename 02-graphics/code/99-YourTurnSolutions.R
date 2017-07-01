### Graphics Intro
#---------------------------------------------
## Your Turn 1 - qplot
	tips <- read.csv("http://heike.github.io/rwrks/02-r-graphics/data/tips.csv")
	
	# 1. Use qplot to buil a scatterplot of variables tips and total bill
	
	qplot(data = tips, x  = total_bill, y = tip)
	
	# 2. Use options within qplot to color points by smokers
	
	qplot(data = tips, x  = total_bill, y = tip, color = smoker)
	
	# 3. Clean up axis labels and add main plot title
	
	qplot(data = tips, x  = total_bill, y = tip, color = smoker,
	xlab = "Total Bill ($)", ylab = "Tip ($)", 
	main = "Tip left by patrons' total bill and smoking status")

## Your Turn 2 - histogram 
	
	# 1. Create a new variable in the tips data frame: rate = tip/total bill
	
	tips$rate <- tips$tip/tips$total_bill
	
	# 2. Use qplot to create a histogram of rate
	
	qplot(data = tips, x = rate)	
	
	# 3. Change the binwidth on that histogram to 0.05
	
	qplot(data = tips, x = rate, binwidth = 0.05)
	
	# 4. Facet this histogram by size of the group
	
	qplot(data = tips, x = rate, binwidth = 0.05, facets = ~ size)

## Your Turn 3 - boxplots

	# 1. Make side-by-side boxplots of tipping rate for males and females
	
	qplot(data = tips, x = sex, y = rate, geom = 'boxplot')
	
	# 2. Overlay jittered points for observed values onto this boxplot	
	
	qplot(data = tips, x = sex, y = rate, geom = c('boxplot', 'jitter'))

## Your Turn 4 - barplots

	# 1. Use the tips data to make a barplot for counts of smoking and 
	# non smoking customers
		
	qplot(data = tips, x = smoker)
	
	# 2. Facet using day of week and time of day to view how smoking status 
	# changes for different meal times
	
	qplot(data = tips, x = smoker, facets = day ~ time)
	
	
	
### Plot Maps
#---------------------------------------------

## Your turn 1 - health stats
	states.health.stats <- read.csv("https://heike.github.io/rwrks/02-r-graphics/data/states.health.stats.csv")
	
	# Use left_join to combine child healthcare data with maps information. 
	
	library(maps)
	library(dplyr)
	states <- map_data("state")
	states.health.map <- left_join(states, states.health.stats, 
							by = c("region" = "state.name"))
	
	
	# Use qplot to create a map of child healthcare undercoverage rate by state
	
	qplot(data = states.health.map, x = long, y = lat, geom = 'polygon',
			group = group, fill = no.coverage) + coord_map()

## Your turn 2 - cleaned up map

	qplot(data = states.health.map, x = long, y = lat, geom = 'polygon',
			group = group, fill = no.coverage) + coord_map() + 
	scale_fill_gradient2(limits = c(0, .2), low = 'white', high = 'red') + 
	ggtitle("Health Insurance in the U.S.\nWhich states have the highest rates of undercovered children?")	+ theme_minimal() + 
	theme(panel.grid = element_blank(), axis.text = element_blank(),
	axis.title = element_blank())	
	
### Layers
#--------------------------------------------

## Your turn 1 - Deepwater horizon 

	# recreate the map shown
	load("../../02-r-graphics/data/noaa.rdata")
	ls()
	head(floats)
	ggplot(data = floats, aes(x = Depth, y = Temperature)) + 
		geom_point(aes(color = callSign))

## Your turn 2 - animal

	# 1. Read in the animal.csv data
	
	animal <- read.csv("https://heike.github.io/rwrks/02-r-graphics/data/animal.csv")
	
	# 2. Plot the location of animal sightings on a map of the region
	
	ggplot() + 
		geom_path(data = states, aes(x = long, y = lat, group = group)) + 
		geom_point(data = animal, aes(x = Longitude, y = Latitude)) + 
		xlim(c(-91, -80)) + ylim(c(24,32)) + coord_map()
	
	# 3. On this plot, try to color points by class of animal and/or 
		# status of animal
		
	ggplot() + 
		geom_path(data = states, aes(x = long, y = lat, group = group)) + 
		geom_point(data = animal, aes(x = Longitude, y = Latitude, 	
					color = class)) + 
		xlim(c(-91, -80)) + ylim(c(24,32)) + coord_map()		
		
	ggplot() + 
		geom_path(data = states, aes(x = long, y = lat, group = group)) + 
		geom_point(data = animal, aes(x = Longitude, y = Latitude, 	
					color = Condition)) + 
		xlim(c(-91, -80)) + ylim(c(24,32)) + coord_map()			
		
	# 4. Advanced: Could we indicate time somehow?
		
	library(lubridate)
	animal$month <- month(as.Date(animal$Date_))
		
	ggplot() + 
		geom_path(data = states, aes(x = long, y = lat, group = group)) + 
		geom_point(data = animal, aes(x = Longitude, y = Latitude, 	
					color = Condition), alpha = .5) +
		xlim(c(-91, -80)) + ylim(c(24,32)) +
		facet_wrap(~month) + coord_map() 		
			
### Perception
#-------------------------------------------------

## Your turn 1 - interaction

	frame <- read.csv("http://heike.github.io/rwrks/02-r-graphics/data/frame.csv") 
	qplot(x, y, data = frame, shape = g1, colour = g2, size = I(4))
	
	# Make sure the "oddball" stands out while keeping the information on the groups
	frame$inter <- interaction(frame$g1, frame$g2)
	ggplot(frame, aes(x, y)) +  
	geom_point(aes(shape = g1, fill = g2, color = inter), size = I(4), stroke = I(2)) + 
	scale_shape_manual(values = c(21,22)) + 
	scale_colour_manual(values = c("red", "black", "green")) + 
	scale_fill_manual(values = c("red", "green")) + 
	theme(legend.position = 'none')
	
## Your turn 2 - View Many Variables at Once

	# In the diamonds data, clarity and cut are ordinal, while price and carat are continuous. Find a graphic that gives an overview of these four variables while respecting their types. Hint: start with the following code: 
	
	qplot(carat, price, shape = cut, colour = clarity, data = diamonds, 
	size = carat, alpha = price) # ?? 
	
## Your turn 3 - Movies 	

	# Explore the differences in length, rating, etc. in movie genres over time
	
	movies <- read.csv("http://heike.github.io/rwrks/02-r-graphics/data/MovieSummary.csv")

	ggplot(movies, aes(x = year, y = budget, group = genre, color = genre)) + 
	geom_point()
	
	ggplot(movies, aes(x = year, y = length, group = genre, color = genre)) +
	geom_smooth()	
	 
	ggplot(movies, aes(x = budget, y = rating, color = genre, group = genre)) + 
	geom_point() +
	geom_smooth()  + 
	facet_wrap(~mpaa)
	
	ggplot(movies, aes(x = log(budget+1), y = rating, color = genre, group = genre)) + 
	geom_point() +
	geom_smooth() 
	
	ggplot(movies, aes(x = genre, fill = mpaa)) + geom_bar() 
	
	 ggplot(movies, aes(x = rating, group = mpaa, fill = mpaa)) + 
	 geom_density(alpha = .4) + facet_wrap(~genre, nrow = 2)

### Polishing your plots
#------------------------------------------------------

## Your turn 1 - Saving files

	# 1. Save a PDF of a scatterplot of price vs carat
	
	qplot(price, carat, data = diamonds)
	
	ggsave("diamonds.pdf")
	
	# 2. Open up the pdf in Adobe Acrobat (or another PDF reader)
	# 3. Save a png of the same scatterplot 
	
	ggsave("diamonds.png")
	
	
	# 4. Embed the png into MS word or another editor.	 