## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setSolve <- function(solve) i <<- solve
  getSolve <- function() i
  list(set = set, get = get,
       setSolve = setSolve,
       getSolve = getSolve)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getSolve()
  if(!is.null(i)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setSolve(i)
  i
}


aMatrix <- makeCacheMatrix(matrix(c(10,5,1,0),ncol=2))
aMatrix$get()               # retrieve the value of x
aMatrix$getSolve()           # retrieve the value of i, which should be NULL
aMatrix$set(matrix(c(11,12,21,12),ncol=2))          # reset value with a new matrix
cacheSolve(aMatrix)          # notice mean calculated is mean of 30:50, not 1:10
aMatrix$getSolve()           # retrieve it directly, now that it has been cached

