#Define a function in which I can calculate the inverse of a matrix
#If the inverse of a matrix is sotred in cache the result is shown from there
#If the inverse of a matrix is not stored then the function calls another oen
#to help calculate it's inverse

cacheSolve <- function(x, ...) {
    result <- x$getinverse()
    #Checking if the inverse is already in the cache
    if(!is.null(result)) {
        message("getting cached data")
        return(result)
    }
    #Calculating the inverse of a matrix for the first time
    matrix <- x$get()
    result <- solve(matrix, ...)
    x$setinverse(result)
    result
}