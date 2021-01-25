rm(list=ls())
n <- seq(2,10,0.1)
lowestCost <- 0
numBumper <- 0
for (index in (1:length(n))){
  i <- n[index]
  cost <- (i*i*i)-(7*i*i)+432
  if (index == 1){
    lowestCost <- cost
    numBumper <- i
  }
  else if(cost < lowestCost){
    lowestCost <- cost
    numBumper <- i
  }
}
print(paste("The minimum cost is for", numBumper, "number of units."))

