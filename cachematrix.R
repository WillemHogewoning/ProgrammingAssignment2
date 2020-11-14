## 1): Fork the GitHub repository containing the stub R files at https://github.com/rdpeng/ProgrammingAssignment2
## 2): Clone your forked GitHub repository to your computer so that you can edit the files locally on your own machine.
## 3): Edit the R file contained in the git repository and place your solution in that file (please do not rename the file)
## 4): Commit your completed R file into YOUR git repository and push your git branch to the GitHub repository under your account.

## Started witht the Fork, Clone, and Test commit.


## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


## cacheSolve & makeCacheMatrix, is a combination of creating an inverse of a matrix and store the result in a cache for 
## future **IDENDICAL** calculations. 
## Future operation first check if computation is available in cache, if so, it uses the cached value,
## if not it will be computated.

makeCacheMatrix <- function(x = matrix()) {

  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInverse <- function(inverse) inv <<- inverse
  getInverse <- function() inv
  list(set = set,
       get = get,
       setInverse = setInverse,
       getInverse = getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if (!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat, ...)
  x$setInverse(inv)
  inv
}

### Test run on the operation:

### Load script
##RUN: source("cachematrix.R")

### set test matrix
##RUN: testmatrix <- matrix(1:4, nrow=2)

### run the matrix through makeCacheMatrix
##RUN:  matrix1 <- makeCacheMatrix(testmatrix)
### Show matrix (oringnal)
##RUN: matrix1$get()
### get cached data from matrix inverse
##RUN: matrix1$getInverse()
### - no data present so shows a NULL

### computate the inverse of the matrix
##RUN: cacheSolve(matrix1)

### now re-run the identical computation
##RUN: cacheSolve(matrix1)
### show show the data from the cache.
### show the inverse data:
##RUN: matrix1$getInverse()
