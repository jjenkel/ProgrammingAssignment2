## Put comments here that give an overall description of what your
## functions do

## comments inline

makeCacheMatrix <- function(x = matrix()) {
    # initialize object for inverse of matrix and set to NULL
    invs <- NULL
    set <- function(y) {
        # set x in the parent environment to y
        x <<- y
        # set inv to NULL if x in parent is reset
        invs <<- NULL
    }
    get <- function() x
    setinvs <- function(solve) invs <<- solve(x)
    getinvs <- function() invs
    list(set = set,
         get = get,
         setinvs = setinvs,
         getinvs = getinvs)

}


## comments inline

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
    invs <- x$getinvs()
    if(!is.null(invs)) {
        message("getting cached inverse")
        return(invs)
    }
    message("getting new inverse")
    mtx <- x$get()
    invs <- solve(mtx,...)
    x$setinvs(invs)
    invs
}
