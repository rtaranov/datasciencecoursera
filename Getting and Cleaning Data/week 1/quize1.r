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

doc = xmlInternalTreeParse("getdata_data_restaurants.xml")
getdata_data_restaurants.xml