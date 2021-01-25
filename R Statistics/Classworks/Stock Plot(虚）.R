rm(list=ls())
library(quantmod)
getSymbols("JPM") #NYSE JP Morgan & Chase from yahoo
getSymbols("MSFT")
getSymbols("F")

head(JPM)
tail(JPM)
JPM$JPM.Close
head(JPM$JPM.Close)
class(JPM$JPM.Close)
class(JPM)
A <- as.matrix(JPM)
A[1,]

#select all of 2016 from JPM close prices
JPM_2016 <- JPM$JPM.Close["2016"]

#select january 1, 2016 to march 22, 2016
jan_march <- JPM$JPM.Close["20160101/20160322"]

#Verify that jan_march contains 82 rows
82 == length(jan_march)

data <- rnomr(5) #5 random numbers

#create dates as a Date class object starting from 2016 01 01
dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")

#Create bday ()

#Practice 1
#######################################################
JPM1_3 <- JPM$JPM.Close["20200101/20200304"]
MSFT1_3 <- JPM$JPM.Close["20200101/20200304"]
F1_3 <- JPM$JPM.Close["20200101/20200304"]

plot(JPM1_3)

#since data is index, coredata is the variable: price, etc
coredata(JPM1_3)

#daily return = log(p2/p1) = log(p2) - log(p1)
daily_return <- diff(log(coredata(JPM1_3)))

W<-index(JPM1_3)
length(W)
myReturn <- xts(x = daily_return, order.by = W[1:42])
plot(myReturn)