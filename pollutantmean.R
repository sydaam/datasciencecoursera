pollutantmean <- function(directory, pollutant, id = 1:332) {
    #Setting empty variables
    filename <- c()
    result <- c()
    
    #Set working directory
    setwd(directory)
    
    #Determine how to call the file
    for (i in id) {
        if (i < 10) filename <- paste("00", i, ".csv", sep = "")
        if (10 <= i & i < 100) filename <- paste("0", i, ".csv", sep = "")
        if (i > 100) filename <- paste(i, ".csv", sep = "")
    
        #Read the data and assign into datainfiles
        datainfiles <- read.csv(filename)
        
        #Check the name of the pollutant
        if (pollutant == "sulfate") subsetdata <- c(datainfiles[,2])
        if (pollutant == "nitrate") subsetdata <- c(datainfiles[,3])
        
        #Concatenate a list with the subset of data wanted for the result
        result <- c(result, subsetdata)
    }
    
    #Calculate the mean of the subset of data selected
    resultmean <- mean(result, na.rm = TRUE)
    resultmean
}