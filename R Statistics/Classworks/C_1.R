#1. Write a function
rm(list=ls()) # remove all data from the Global Enironment

myVec <- c(4,0,-1,23,13)

findMax <- function(numVec){
  largestNumber <- numVec[1]
  for(i in numVec) {
    if (i > largestNumber) {
      largestNumber <- i
    }
  }
  return(largestNumber)
}

findMax(myVec)
