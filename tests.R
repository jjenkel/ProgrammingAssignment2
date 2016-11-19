# test cachesolve

source("cachematrix.R")

# create matrix
z1 <- matrix(c(4,2,7,6),nrow=2,ncol=2)
z11 <- makeCacheMatrix(z1)
cacheSolve(z11)

class(z11)
class(cacheSolve(z11))

tmp <- matrix(c(3,3.2,3.5,3.6),nrow=2,ncol=2)
z11$set(tmp)
z11$get()
z11$getinvs()


# check for identity matrix
z111 <- z1%*%cacheSolve(z11)
z111


# try function antoher way submitting regular matrix with makeCacheMatrix embedded 
# in the function call 
z2 <- z1
z22 <- cacheSolve(makeCacheMatrix(z2)) # this returns a plain, inverted matrix and stores it in z22
z22

# check for identity matrix
z222 <- z2%*%z22
z222

# what happens if we try to call cacheSolve again on z2?
cacheSolve(makeCacheMatrix(z2))
# oops, new calculation



# create a new matrix
z3 <- matrix(c(3,3.2,3.5,3.6),nrow=2,ncol=2)
z3             

# try function
z33 <- makeCacheMatrix(z3)

z333 <- cacheSolve(z33)

# check for identity matrix
z3333 <- z3%*%z333
z3333

# does it use the cached value?
cacheSolve(z33)
