complete <- function(directory, threshold, id = 1:332) {
#complete <- function(directory, id = 1:332) {
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

  #finaldat <- c()
  df <- data.frame()
  cr <- c()
  
  for(i in 1:length(id)){
    filename <- paste(formatC(id[i], width=3, flag="0"), ".csv", collapse = " ")
    filename <- gsub("[[:space:]]", "", filename)
    
    #print(filename)
    
    fullfilename = sprintf("%s//%s", directory, filename)
    #print(fullfilename)
    
    current_file = read.csv(fullfilename, header = TRUE)
    current_file <- subset(current_file, !is.na(sulfate) & !is.na(nitrate))
    #print(nrow(current_file))
    #current_file <- subset(current_file, sulfate > threshold & nitrate > threshold)
    #a = sprintf("In %s we have %i rows", filename, nrow(current_file))
    #print(a)
    if(nrow(current_file) > threshold)
    {
      #print(filename)
      #current_file[current_file$sulfate]
      #print(current_file[, "sulfate"])
      #print(cor(current_file[, "sulfate"], current_file[, "nitrate"]))
      cr <- c(cr, cor(current_file[, "sulfate"], current_file[, "nitrate"]))
      #break
    }
    
    
#     dat_sulfate = read.csv(fullfilename, header = TRUE)[ ,c('sulfate')]
#     dat_nitrate = read.csv(fullfilename, header = TRUE)[ ,c('nitrate')]
#     id_ = read.csv(fullfilename, header = TRUE)[ ,c('ID')]
#     
#     dat_sulfate <- dat_sulfate[!is.na(dat_sulfate)]
#     sulfate_obs <- length(dat_sulfate)
#     #dat_sulfate_thresh <- dat_sulfate[dat_sulfate>threshold]
#     #print(sulfate_obs)
# 
#     dat_nitrate <- dat_nitrate[!is.na(dat_sulfate)]
#     nitrate_obs <- length(dat_nitrate)
#     #print(nitrate_obs)  
#     
#     id_df <- mean(id_)
#     #print(id_df)    
#     
#     minimal_val <- sort(c(sulfate_obs, nitrate_obs))[1]
    
    #df <- rbind(df, data.frame(id = id_df, nobs = minimal_val) )

    #finaldat <- c(finaldat, dat)
    #print(finaldat)
  }
  print(cr)
  #print(df)
  #print(mean(finaldat))
}
  
#pollutantmean("C:/Work/Training/datasciencecoursera/R Programming/week 2/specdata/", "sulfate", 1:10)

#complete("C:/Work/Training/datasciencecoursera/R Programming/week 2/specdata/", c(6,10,20,34,100,200,310))
#complete("C:/Work/Training/datasciencecoursera/R Programming/week 2/specdata/", 150)