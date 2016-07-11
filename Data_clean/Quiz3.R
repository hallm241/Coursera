library(dplyr)

# Question 1
if(!file.exists("./data")) dir.create("./data")
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv","./data/microdata.csv")
micro <- read.csv("./data/microdata.csv")
# see code book: https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FPUMSDataDict06.pdf

AG_logic <- (micro$ACR == 3 & micro$AGS == 6)
which(AG_logic)

# Question 2
library(jpeg)
if(!file.exists("./data")) dir.create("./data")
file_path = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"
download.file(file_path,"./data/jeff.jpg")

pic <- readJPEG("./data/jeff.jpg", native = TRUE)
quantile(pic, c(.3,.8))

## this didnt seem to work - so am guessing the answer!

# Question 3
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
combo[13,]

# Question 4
combo %>% group_by(Income.Group) %>%
        summarise(average_rank = mean(rank)) %>%
        print

# Question 5
Q5 <-
combo %>% mutate(group = cut(combo$GDP,quantile(combo$GDP,seq(0,1,length=6)))) %>%
        group_by(Income.Group,group) %>%
        summarise(count = n()) %>%
        spread(group,count)

View(Q5)


