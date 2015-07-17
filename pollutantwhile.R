pollutantmean2 <- function(directory, pollutant, id = 1:332) {
    #Setting empty variables
    filename <- c()
    result <- c()
    count <- 1
    
    #Set working directory
    setwd(directory)
    
    #Determine how to call the files
    while (count <= length(id)) {
        if (count < 10) filename <- paste("00", count, ".csv", sep = "")
        if (10 <= count & count < 100) filename <- paste("0", count, ".csv", sep = "")
        if (count >= 100) filename <- paste(count, ".csv", sep = "")
        
        #Read the data and assign into datainfiles
        datainfiles <- read.csv(filename)
        
        #Check the name of the pollutant
        if (pollutant == "sulfate") subsetdata <- c(datainfiles[,2])
        if (pollutant == "nitrate") subsetdata <- c(datainfiles[,3])
        
        #Concatenate a list with the subset of data wanted for the result
        result <- c(result, subsetdata)
        count <- count + 1
    }
        
    #Calculate the mean of the subset of data selected
    resultmean <- mean(result, na.rm = TRUE)
    resultmean
}