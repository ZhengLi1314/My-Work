rm(list=ls())

#Run this line first, then run the bottom methods############

k <- as.integer(readline(prompt = "Please enter k: "))


#Using Loops Method##########################################

numList <- c(1, 1)
for (i in (3:k)){
  numList[i] <- numList[i-2] + numList[i-1]
}
print(numList)


#Using Recursive Method#####################################

fibonacciNum <- function(k, numList = NULL){
  if(is.null(numList)){
    numList <- c(1,1)
  }
  else{
    index = length(numList) + 1
    if(index > k){
      return(numList)
    }
    numList[index] <- numList[index-2] + numList[index-1]
  }
  fibonacciNum(k, numList)
}
print(fibonacciNum(k))





