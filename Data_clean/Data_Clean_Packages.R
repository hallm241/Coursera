install.packages("XML")
install.packages("sqldf")       # for reading SQL into R data frames
install.packages("httr")        # GET/POST commands etc.
install.packages("httpuv")      # required in combo with httr to help authenticate github
install.packages("jsonlite")    # reading and converting json files
install.packages("plyr")
install.packages("dplyr")       # helps you work with dataframes
install.packages("tidyr")       # helps tidy your data
                                # Read - http://vita.had.co.nz/papers/tidy-data.pdf

install.packages("jpeg")        # read a jpeg image

source("http://bioconductor.org/biocLite.R") # for getting the HDF5 package
biocLite("rhdf5")

