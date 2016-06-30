# Read this data set into R and report the sum of the numbers in the fourth of the nine columns.

widths <- c(12,7,4,9,4,9,4,9,4)
file = url("https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for")
cpc <- read.fwf(file = file, skip = 4, widths = widths)
sum(colSums(cpc[,c(4,9)]))
