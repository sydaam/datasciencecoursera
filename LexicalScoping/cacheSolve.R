cacheSolve <- function(x, ...) {
    result <- x$getinverse()
    if(!is.null(result)) {
        message("getting cached data")
        return(result)
    }
    matrix <- x$get()
    result <- solve(matrix, ...)
    x$setinverse(result)
    result
}