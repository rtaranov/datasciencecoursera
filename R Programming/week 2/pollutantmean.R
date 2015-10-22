pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  ## NOTE: Do not round the result!

  #print(directory)
  #setwd(directory)
  finaldat <- c()
  #print(id)
  for(i in 1:length(id)){
    filename <- paste(formatC(id[i], width=3, flag="0"), ".csv", collapse = " ")
    filename <- gsub("[[:space:]]", "", filename)
    
    #print(filename)
    
    fullfilename = sprintf("%s//%s", directory, filename)
    #print(fullfilename)
    
    dat = read.csv(fullfilename, header = TRUE)[ ,c(pollutant)]
    dat <- dat[!is.na(dat)]    
    finaldat <- c(finaldat, dat)
    #print(finaldat)
  }
  print(mean(finaldat))
}
  
#pollutantmean("C:/Work/Training/datasciencecoursera/R Programming/week 2/specdata/", "sulfate", 1:10)

