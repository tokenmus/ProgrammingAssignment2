## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

## makeCacheMatrix function creates a special "matrix", which is really a list containing a function to

## 1 set the value of the matrix
## 2 get the value of the matrix
## 3 set the inverse matrix
## 4 get the inverse matrix

makeCacheMatrix <- function(x = matrix()) {

        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setmean <- function(mean) m <<- mean
        getmean <- function() m
        list(set = set, get = get,
             setmean = setmean,
             getmean = getmean)


}


## Write a short comment describing this function
## The following function calculates the inverse matrix of the special "matrix" created with the above function. 
## However, it first checks to see if the inverse has already been calculated. If so, it gets the inverse from the 
## cache and skips the computation. Otherwise, it calculates the inverse of the matrix and sets the inverse in the cache 
## via the setinverse function.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

        m <- x$getmean()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
