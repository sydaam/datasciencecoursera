corr <- function(directory, threshold = 0) {
    #Fill the dataset with the data from the function defined earlier "complete"
    dataset <- complete(directory)
    
    #Assign subsetdata with the values of dataset corresponding only to nobs
    subsetdata <- subset(dataset, dataset$nobs > threshold)
    dataset.id <- c(subsetdata[,1])
    
    #Defining a verctor result with a length of 0
    result <- vector("numeric", length = 0)
    
    #Determine how to call the files
    for (i in dataset.id) {
        if (i < 10) filename <- paste("00", i, ".csv", sep = "")
        if (10 <= i & i < 100) filename <- paste("0", i, ".csv", sep = "")
        if (i >= 100) filename <- paste(i, ".csv", sep = "")
        
        #Reading the original files
        datainfiles <- read.csv(filename)
        
        #Removing NA from datainfiles
        notna <- na.omit(datainfiles)
        
        #Establishing the correlation between sulfate and nitrate
        correlation <- cor(notna$sulfate, notna$nitrate)
        result <- append(result, correlation, after= length(result))
    }
    c(result)
    setwd("C:/Users/David/datasciencecoursera")
    result
}