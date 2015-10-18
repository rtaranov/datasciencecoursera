install.packages("httr")
install.packages("httpuv")
--------------------------------------------
  
library(httr)
library(httpuv)
oauth_endpoints("github")

myapp <- oauth_app("github",
                   key = "471a6f3496a5097c3ca5",
                   secret = "b91cccebed7a3674d577a32a1cbfec008a521e92")

github_token <- oauth2.0_token(oauth_endpoints("github"), myapp, cache =FALSE)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/rate_limit", gtoken)
stop_for_status(req)
content(req)


req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
df <- content(req)
class(df)
length(df)
#grep("created", df[[1]])
#lapply(df, function(ch) grep("created", ch))
#xmlSApply(df, )

df[["df$name"]]
df[[3]][["name"]]

-------------------------------------------------------------------------------

install.packages("sqldf")

options(sqldf.driver = "SQLite")
options(gsubfn.engine = "R")
library(sqldf)
library(RMySQL)
setwd("C:/Work/Training/datasciencecoursera/Getting and Cleaning Data/week 1")
acs = read.csv("getdata_data_ss06pid.csv", header = TRUE)
sqldf("select * from acs where AGEP < 50 and pwgtp1")

sqldf("select pwgtp1 from acs")

sqldf("select * from acs where AGEP < 50")

sqldf("select pwgtp1 from acs where AGEP < 50")

unique(acs$AGEP)
sqldf("select distinct AGEP from acs") #!!!!

#--------------------------------------------------------------------------------------

install.packages("httr")
install.packages("RCurl")

library(httr)
library(XML)
library(RCurl)

url <- "http://biostat.jhsph.edu/~jleek/contact.html"
#webpage <- getURL(url)

html2 = GET(url)
htmlcode = readLines(url)

content2 = content(html2, as="text")
parsedHTML = htmlParse(content2, asText=TRUE)

class(htmlcode)
nchar(htmlcode[[10]])
nchar(htmlcode[[20]])
nchar(htmlcode[[30]])
nchar(htmlcode[[100]])


#--------------------------------------------------------------------------------

setwd("C:/Work/Training/datasciencecoursera/Getting and Cleaning Data/week 2")
dat = read.csv("getdata_wksst8110.csv", header = TRUE)
summary( dat)
sum(dat$Nino3.SST)
