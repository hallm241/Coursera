# quiz 4

# q1
if(!file.exists("./data")) dir.create("./data")
durl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(durl,"./data/housing_idaho.csv")
housing <- read.csv("./data/housing_idaho.csv")
# see code book: 
# https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

strsplit(names(housing),"wgtp")
## the 123rd element of the list is: "" "15"

# q2
library(dplyr)
if(!file.exists("./data")) dir.create("./data")
durl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(durl,"./data/GDP.csv")
# see original data sources: 
# http://data.worldbank.org/data-catalog/GDP-ranking-table

GDP <- read.csv("./data/GDP.csv", skip = 5, header = FALSE, nrows = 190)
GDP <- select(GDP,V1,V2,V4,V5)
names(GDP) <- c("CountryCode","rank","LongName","GDP")

GDP <- tbl_df(GDP)
GDP$GDP <- as.numeric(gsub(",","",as.character(GDP$GDP)))

mean(GDP$GDP)
# answer 377652.4

# q3 (following on from Q2 data set)
GDP
GDP <- rename(GDP, countryNames = LongName)
countryNames <- GDP$countryNames

grep("^United",countryNames) 
#, 3
countryNames[grep("^United",countryNames)]
## correct answer as the ^ is for starts with

# q4 reusing datasets from prior quizes and questions
library(dplyr)
if(!file.exists("./data")) dir.create("./data")
file_path1 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
file_path2 = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(file_path1,"./data/GDP.csv")
download.file(file_path2,"./data/FedStats.csv")

FED <- read.csv("./data/FedStats.csv")
FED <- tbl_df(FED)

GDP <- read.csv("./data/GDP.csv", skip = 5, header = FALSE, nrows = 190)
GDP <- select(GDP,V1,V2,V4,V5)
names(GDP) <- c("CountryCode","rank","LongName","GDP")
GDP <- tbl_df(GDP)
GDP$GDP <- as.numeric(gsub(",","",as.character(GDP$GDP)))

combo <- merge(GDP,FED,by.x="CountryCode",by.y="CountryCode")
combo <- tbl_df(arrange(combo,desc(rank)))

ref <- grep("[Ff]iscal year end: June",combo$Special.Notes)
combo$Special.Notes[ref]
length(ref)
# answer is 13

# q5
library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)

class(sampleTimes)
# how many values were collected in 2012?
library(lubridate)
?lubridate
sum(year(sampleTimes)==2012)
sum(year(sampleTimes)==2012 & weekdays(sampleTimes)=="Monday")
# 250 and 47