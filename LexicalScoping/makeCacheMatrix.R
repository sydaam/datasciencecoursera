#Define a function to calculate the inverse of a matrix

makeCacheMatrix <- function(x = matrix()) {
    matrix <- NULL
    #Defining the set function
    set <- function(y) {
        x <<- y
        matrix <<- NULL
    }
    
    #Defining the get function
    get <- function() x
    
    #Defining the getinverse and setinverse to calculate the inverse of a matrix
    setinverse <- function(inv) matrix <<- inv
    getinverse <- function() matrix
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}