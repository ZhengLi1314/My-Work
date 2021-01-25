
################### Write to a png/pdf
set.seed(1)
x <- 1:100
y <- 0.029*x + rnorm(100)

pdf("sample.pdf", 7, 5)
plot(x, y, pch=19, col=rgb(0.5, 0.5, 0.5, 0.5), cex=1.5)
abline(lm(y ~ x))
dev.off()
getwd()
setwd("/Users/alitaatian/Desktop/QF104_Spring2020")

png("sample1.png", 490, 350)
plot(x, y, pch=19, col=rgb(0.5, 0.5, 0.5, 0.5), cex=1.5)
abline(lm(y ~ x))
dev.off()

############
JPM_1
plot(JPM_1)
plot(JPM_2)
hist(JPM_1)
length(JPM_1)
CC_dailyReturn<-diff(log(coredata(JPM_1)))
CC_dailyReturn_1<-diff(log(JPM_1))

class(CC_dailyReturn_1)
#daily_return=log(p2/p1)=log(p2)-log(p1)
#daily_return=p2/p1 - 1
class(CC_dailyReturn)
length(CC_dailyReturn_1)
plot(CC_dailyReturn)
W<-index(JPM_1)
length(W)
W[2:43]
myReturn <- xts(x = CC_dailyReturn, order.by = W[1:42])
class(myReturn)
plot(myReturn)

plot(CC_dailyReturn_1)
hist(CC_dailyReturn_1)
hist(JPM_1)
########## Fitting a normal distribution to the histogram
m<-mean(coredata(CC_dailyReturn_1[2:43]))
std<-sqrt(var(CC_dailyReturn_1[2:43]))
hist(CC_dailyReturn_1, density=20, breaks=20, prob=TRUE, 
     xlab="x-variable", 
     main="normal curve over histogram")
curve(dnorm(x, mean=m, sd=std), 
      col="darkblue", lwd=2, add=TRUE, yaxt="n")
