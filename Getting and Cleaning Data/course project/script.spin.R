# to_dat <- read.table("to_test.txt")
# class(to_dat)
# from_dat <- read.table("from_train.txt")
# 
# common <- rbind(to_dat, from_dat)
# common

## Loading data from two files: 
## From Training data set
to_dat <- read.table("getdata_projectfiles_UCI HAR Dataset/train/X_train.txt")

## From Test data set
from_dat <- read.table("getdata_projectfiles_UCI HAR Dataset/test/X_test.txt")

## Creating a new data set, where two previously loaded data sets are merged
common_data <- rbind(to_dat, from_dat)

##Colums of merged dataset are not set. 
##Names for colums are stored in features.txt file. 
##Here we read from that file a new data set containg column names.
features <- read.table("getdata_projectfiles_UCI HAR Dataset/features.txt")

##Next performing column names change from unnamed ones to ones listed in specific column.
names(common_data) <- features$V2

##Now we can store merged and named correctly data set to file
write.table(common_data, file="common_data.txt", col.names = TRUE, row.names = FALSE)

##Loading gdata library to perform matchcols calculations
library(gdata)

##Creating new data frame, that has only mean and std type of columns
new_common <- common_data[, matchcols(common_data, with=c("mean"))]
new_common <- cbind(new_common, common_data[, matchcols(common_data, with=c("std"))])

##Saving column names because later we might loose proper naming
save_names <- names(new_common)

##Calculating mean value for each column with data.
##Later converting from list back to data frame and restoring right naming of columns.
d <- lapply(new_common, mean)
d <- as.data.frame(d)
names(d) <- save_names

##Finally storing all data into mean_data.txt file
write.table(d, file = "mean_data.txt", row.names = FALSE)

