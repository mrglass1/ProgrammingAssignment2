## R Programming - Programming Assignment 2 - Inversed Cached Matrix Functions
## These functions will cache the result of a matrix and solve the inverse of the said matrix.

## This function will accept a matrix object and cache the inverse of it for future use

makeCacheMatrix <- function(input_matrix = matrix()) {
  # define sub functions
  m <- NULL
  setmatrix <- function(set_matrix_value) {
    input_matrix <<- set_matrix_value #store in cache
    m <<- NULL                        #store in cache
  }
  
  getmatrix <- function() input_matrix
    
  setinverse <- function(inverse) m <<- inverse #store in cache
  getinverse <- function() m
    
  #define the parameters of the list
  list(set = setmatrix,
       get = getmatrix,
       setinverse = setinverse,
       getinverse = getinverse)
}

## This function will compute the inverse of a given matrix returned by "makecacheMatrix" above.
## If the inverse has not been solved then it stores it in a cache for future and faster retrieval

cacheSolve <- function(cachesolve_input, ...) {
  temp <- cachesolve_input$getinverse()
    
  #check if the cache exist
  if(!is.null(temp)) {
    message("retrieving the cached matrix...")
        
    return(temp)}
  
  #solve the inverse using the solve() function
  data <- cachesolve_input$get()
  temp <- solve(data, ...) # use function solve() as recommended in notes
  cachesolve_input$setinverse(temp)
    
  #return the final value of the inversed matrix, cached or non-cached
  temp
}
