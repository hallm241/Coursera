# How many characters are in the 10th, 20th, 30th and 100th lines of HTML from this page:
#        http://biostat.jhsph.edu/~jleek/contact.html
# (Hint: the nchar() function in R may be helpful)

url_path <- "http://biostat.jhsph.edu/~jleek/contact.html"
con = url(url_path)
htmlCode = readLines(con)
close(con)

Row_character <- sapply(as.list(htmlCode), nchar)
position <- c(10,20,30,100)
Row_character[position]

# Experiment a bit more

library(XML)
html <- htmlTreeParse(url_path, useInternalNodes = T)

xpathSApply(html, "//title", xmlValue)

library(httr)
html2 = GET(url_path)
content2 = content(html2,as="text")
parsedHtml = htmlParse(content2,asText = TRUE)
xpathSApply(parsedHtml, "//title", xmlValue)

#using handles
google = handle("http://google.com")
pg1 = GET(handle = google,path="/")
pg2 = GET(handle = google,path="search")

#check out http://www.r-bloggers.com/?s=Web+scraping
