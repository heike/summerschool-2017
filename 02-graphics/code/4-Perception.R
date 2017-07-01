frame <- read.csv("http://heike.github.io/rwrks/02-r-graphics/data/frame.csv")
qplot(x, y, data = frame, shape = g1, colour = g2, size = I(4))

display.brewer.all()

qplot(carat, price, shape = cut, colour = clarity, data = diamonds)

qplot(price, carat, data = diamonds, color = color, facets = . ~ clarity)

movies <- read.csv("http://heike.github.io/rwrks/02-r-graphics/data/MovieSummary.csv")
