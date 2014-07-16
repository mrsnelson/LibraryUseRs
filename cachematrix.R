## I really don't understand why I am writing these functions. I am simply
## parroting the instructor. At some level, I guess this could be interesting,
## but I have been given insufficient context to understand the motivation
## behind this exercise.

## The following function will make a cache matrix similar to the cache vector
## example. However, I really don't understand how this works, nor do I care
## at this point.

makeCacheMatrix <- function(x = matrix()) {
    i <- NULL
    set <- function(y){
        x <<- y
        i <<- NULL
    }
    get <- function() x
    setinv <- function(solve) i <<- solve
    getinv <- function() i
    list(set = set, get = get, setinv = setinv, getinv = getinv)
}

## This function will return the inverse of a matrix that has been passed to
## makeCacheMatrix.  Otherwise, ditto the comment above.

cacheSolve <- function(x, ...) {
   i <- x$getinv()
   if (!is.null(i)) {
       message("getting cached data")
       return(i)
   }
   data <- x$get()
   i <- solve(data, ...)
   x$setinv(i)
   i
}


