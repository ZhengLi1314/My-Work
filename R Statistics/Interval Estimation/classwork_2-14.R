rm(list=ls())
myFactRec <- function(k){
  if (k > 1){
  return(myFactRec(k-1)*k)}
  else{
    return(1)
  }
}
print(myFactRec(7))

rm(list=ls())
nums<-c(3,5,8,4,1,9,-2)
swipe <- function(vector, x){
  minIndex <- x
  for(i in (x:length(vector)){
    if (vector[i] < vector[x]){
      minIndex <- i
    }
  }
  tempt <- vector[x]
  vector[x]<-vector[minIndex]
  vector[min]<-tempt
  return(vector)
}
swipe(nums, 2)

