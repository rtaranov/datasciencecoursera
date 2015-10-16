library(data.table)

setwd("C:/Work/Training/datasciencecoursera/Getting and Cleaning Data/week 1")
dat = read.csv("getdata_data_ss06hid.csv", header = TRUE)

#-------------First task------------------------
datatable <- data.table(dat)
data_sub <- datatable[VAL == 24]

nrow(data_sub)

#-----------------------------------------------


#-------------3rd task------------------------
library(xlsx)
dat <- read.xlsx("getdata_data_DATA.gov_NGAP.xlsx", sheetIndex = 1, rowIndex = 18:23, colIndex = 7:15)
sum(dat$Zip*dat$Ext,na.rm=T) 

#-----------------------------------------------

#-------------4th task------------------------
install.packages("plyr")
install.packages("XML")
require("XML")
doc = xmlTreeParse("getdata_data_restaurants.xml", useInternal=TRUE)
class(doc)
rootNode = xmlRoot(doc) #gives content of root
xmlName(rootNode)
#names(rootNode[[1]][[1]])
xmlSApply(rootNode, xmlValue)

zips = xpathSApply(rootNode, "//zipcode", xmlValue)

a <- table(zips)
a
a[names(a)==21231]

#-----------------------------------------------


#-------------5th task------------------------

DT = fread("getdata_data_ss06pid.csv")
ptm <- proc.time()
tapply(DT$pwgtp15,DT$SEX,mean)
proc.time() - ptm

ptm <- proc.time()
sapply(split(DT$pwgtp15,DT$SEX),mean)
proc.time() - ptm

ptm <- proc.time()
mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)
proc.time() - ptm

ptm <- proc.time()
mean(DT$pwgtp15,by=DT$SEX)
proc.time() - ptm

ptm <- proc.time()
rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]
proc.time() - ptm

ptm <- proc.time()
DT[,mean(pwgtp15),by=SEX]
proc.time() - ptm

#-----------------------------------------------

