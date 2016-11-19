# usage of example functions

source("cachemean.R")

x <- rnorm(1:50,10,2)
y <- rnorm(1:50,15,3)

v <- makeVector(x)
# get a look at the vector
v$get()

# could set v to new value with v$set(), but we won't

# we could interact with set mean ourselves by supplying 
# the right kind of object for example - create and store 
# the mean value for v minus the last element (so the 
# mean changes in the output)
v$setmean(mean(x))

# now view it
v$getmean()

# but we have cachmean ... let's use y for this one
# start by getting a makeVector object of 'y'
w <- makeVector(y)
cachemean(w)
# second call, accessed from the 'w' object - uses cached data
cachemean(w)

# if w changes what happens?
y <- rnorm(1:25,15,2)
cachemean(w)
# nothing the object w was calculated and stored.
# we would have to reinitialize w to see changes
# by making a new makeVector object
w <- makeVector(y)
cachemean(w)

# we could set directly ...
w$set(rnorm(1:40,20,5))
cachemean(w)


