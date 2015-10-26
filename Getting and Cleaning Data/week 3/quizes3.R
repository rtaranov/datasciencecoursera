download.file(url="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = 'comsurvdata.csv')

# --------------------First Quize -------------------------
library(dplyr)
dat <- read.csv('comsurvdata.csv')
which(dat$ACR >=3 & dat$AGS >=6)

# --------------------Second Quize -------------------------
#download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "instr.jpg")
#install.packages("jpeg")

library(jpeg)
dat <- readJPEG("instr.jpg", native = TRUE)
quantile(dat, probs = seq(0.3, 0.8, 0.1))

# --------------------Third Quize -------------------------
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile = "grodompro.csv")
download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile = "train.csv")

grodompro <- read.csv("grodompro.csv")
grodompro_countries <- grodompro[1]
grodompro_countries
grodompro_countries[[1]]
complete.cases(grodompro)
complete.cases(grodompro_countries[[1]])

train <- read.csv("train.csv")
train_countries <- train[1]
train_countries

match()
#select(grodompro, )