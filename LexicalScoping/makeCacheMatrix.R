makeCacheMatrix <- function(x = matrix()) {
    matrix <- NULL
    set <- function(y) {
        x <<- y
        matrix <<- NULL
    }
    get <- function() x
    setinverse <- function(inv) matrix <<- inv
    getinverse <- function() matrix
    list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}