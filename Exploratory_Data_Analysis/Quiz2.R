#q2
library(nlme)
library(lattice)
xyplot(weight ~ Time | Diet, BodyWeight)

# note - BodyWeight is dataset... hiden in nlme or lattice package?

#q4
library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

#q5
?trellis.par.set

#q7
library(ggplot2)
library(datasets)
data(airquality)

qplot(Wind, Ozone, data = airquality)

#this one
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

qplot(Wind, Ozone, data = airquality, facets = . ~ factor(Month))

qplot(Wind, Ozone, data = airquality, geom = "smooth")

#q9
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)

#q10
library(ggplot2)
qplot(votes, rating, data = movies)

#alternatives
qplot(votes, rating, data = movies) + geom_smooth()
#yes
qplot(votes, rating, data = movies, smooth = "loess")
#no
qplot(votes, rating, data = movies) + stats_smooth("loess")
#no
qplot(votes, rating, data = movies, panel = panel.loess)
#no

