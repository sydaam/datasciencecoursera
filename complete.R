complete <- function(directory, id = 1:332){
    #Setting variables
    count <- 0
    
    #Set working directory
    setwd(directory)
    
    #Assign to dataset an empty data frame with the size of observation in id
    dataset <- data.frame(id = rep(NA, length(id)), nobs = rep(NA, length(id)))
    
    #Determine how to call the files
    for (i in id) {
        if (i < 10) filename <- paste("00", i, ".csv", sep = "")
        if (10 <= i & i < 100) filename <- paste("0", i, ".csv", sep = "")
        if (i >= 100) filename <- paste(i, ".csv", sep = "")
        
        #Increase the counter in 1 each time the for runs
        count <- count +1
        
        #Assign the content of the files in datainfiles
        datainfiles <- read.csv(filename)
        
        #Assign to completedata the rows with values in all columns
        completedata <- complete.cases(datainfiles)
        nobs <- nrow(datainfiles[completedata,])
        dataset[count,] <- c(i,nobs)
    }
    dataset
}
