library(sqldf)

# Download sample dataset
if(!file.exists("./data")) dir.create("./data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv","./data/acs.csv")
acs <- read.csv("./data/acs.csv")

# inspect file (get some info)
str(acs)
names(acs)
head(acs)

# practice rSQL

# Quiz Question 2: Which of the following commands 
# will select only the data for the probability weights pwgtp1 with ages less than 50?

sqldf("select * from acs where AGEP < 50")
sqldf("select pwgtp1 from acs where AGEP < 50")
sqldf("select * from acs")
sqldf("select pwgtp1 from acs")

# answer: sqldf("select pwgtp1 from acs where AGEP < 50")

# Quiz question 3: Using the same data frame 
# you created in the previous problem, what is the equivalent function to 
unique(acs$AGEP)

# options
sqldf("select distinct pwgtp1 from acs")
sqldf("select unique * from acs")
sqldf("select AGEP where unique from acs")
sqldf("select distinct AGEP from acs")

# answer: sqldf("select distinct AGEP from acs")
