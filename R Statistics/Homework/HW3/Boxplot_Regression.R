rm(list=ls())
setwd("/Users/alitaatian/Desktop/QF104_Spring2020/")

########################################
###########   Boxplot
input <- mtcars[,c('mpg','cyl')]
print(head(input))
# Plot the chart.
class(input)
my_subset<-mtcars[input$cyl==4,c('mpg','cyl')]
hist(input$mpg)
hist(my_subset$mpg)

library(fBasics)
basicStats(my_subset$mpg)
basicStats(input$mpg)
png("my_Hist1.png", 490, 350)
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", main = "Mileage Data")
dev.off()
# Plot the chart with the notch
boxplot(mpg ~ cyl, data = mtcars, 
        xlab = "Number of Cylinders",
        ylab = "Miles Per Gallon", 
        main = "Mileage Data",
        notch = TRUE, 
        varwidth = TRUE, 
        col = c("green","yellow","purple"),
        names = c("High","Medium","Low")
)

################################
########LinearRegression (univariate)
x <- c(151, 174, 138, 186, 128, 136, 179, 163, 152, 131) # The predictor vector (height)
y <- c(63, 81, 56, 91, 47, 57, 76, 72, 62, 48)           # The resposne vector(weight)

# Apply the lm() function.
relation <- lm(y~x)
relation$coefficients[2]
print(relation)
print(summary(relation))
####predict() Function
# Find weight of a person with height 170.
a <- data.frame(x = 170)
result <-  predict(relation,a)
print(result)
#####Visualize the Regression Graphically
# Give the chart file a name.
png(file = "linearregression.png")

# Plot the chart.
plot(x,y,col = "blue",main = "Height & Weight Regression",
     abline(relation),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")
plot(x,y,col = "blue",main = "Height & Weight Regression",
     abline(relation$coefficients[1],relation$coefficients[2],col = 2),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")

# Save the file.
dev.off()
############
###Multivariate regression
input <- mtcars[,c("mpg","disp","hp","wt")]
input<-mtcars
print(head(input))
# Create the relationship model.
model <- lm(mpg~qsec+wt, data = input)
model2 <- lm(mpg~wt, data = input)
# Show the model.
print(model)
print(model2)
cor(input$wt,input$qsec)
plot(mtcars$wt,mtcars$mpg,col = "blue",main = "Height & Weight Regression",
     abline(model$coefficients[1],model$coefficients[4],col = 2),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")
plot(mtcars$wt,mtcars$mpg,col = "blue",main = "Height & Weight Regression",
     abline(model),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")

# Get the Intercept and coefficients as vector elements.
cat("# # # # The Coefficient Values # # # ","\n")

a <- coef(model)[1]
print(a)

Xdisp <- coef(model)[2]
Xhp <- coef(model)[3]
Xwt <- coef(model)[4]


mtcars$mpg
print(Xdisp)
print(Xhp)
print(Xwt)
#############################################################
#######################
### logistic model (or logit model): y = 1/(1+e^-(a+b1x1+b2x2+b3x3+...))
# Select some columns form mtcars.
input <- mtcars[,c("am","cyl","hp","wt")]

print(head(input))
am.dataS = glm(formula = am ~ wt, data = input, family = binomial)
am.data = glm(formula = am ~ cyl + hp + wt, data = input, family = binomial)
am.dataS = glm(formula = am ~ wt, data = input, family = binomial(link="logit"))   #### Logistic
am.dataSS = glm(formula = am ~ wt, data = input, family = binomial(link="probit"))  #### Probit

print(summary(am.dataS)) ###logistic
print(summary(am.data))
### logistic function
amPr = 1/(1+exp(-(am.dataS$coefficients[1]+am.dataS$coefficients[2]*mtcars$wt)))   ### Prediction value for Logistic
### Probit model: cumulative normal distribution curve
amPr2 = pnorm((am.dataSS$coefficients[1]+am.dataSS$coefficients[2]*mtcars$wt), mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
plot(mtcars$wt,mtcars$am, col="red" )
par(new=TRUE)
plot(mtcars$wt,amPr, col="green" )  ### Logit
par(new=TRUE)
plot(mtcars$wt,amPr2, col="blue" )  ### Probit
###Can we run a linear regression instead of logistic one?!
am.datalinear<-lm(mtcars$am ~ mtcars$wt)
print(am.datalinear)
par(new=TRUE)
plot( mtcars$wt,mtcars$am,col = "blue",main = "Height & Weight Regression",
      abline(am.datalinear$coefficients[1],am.datalinear$coefficients[2],col = 2),cex = 1.3,pch = 16,xlab = "Weight in Kg",ylab = "Height in cm")
####################

####################
########Normal Distribution
# Create a sequence of numbers between -10 and 10 incrementing by 0.1.
x <- seq(-10, 10, by = .1)

# Choose the mean as 2.5 and standard deviation as 0.5.
y <- dnorm(x, mean = 2.5, sd = 0.5)

plot(x,y)
##########
# Create a sequence of numbers between -10 and 10 incrementing by 0.2.
x <- seq(-10,10,by = .2)

# Choose the mean as 2.5 and standard deviation as 2. 
y <- pnorm(x, mean = 2.5, sd = 2)

# Plot the graph.
plot(x,y)
#############
# Create a sample of 50 numbers which are normally distributed.
y <- rnorm(50)

# Plot the histogram for this sample.
hist(y, main = "Normal DIstribution")
###########
###Binomial Distribution
# Create a sample of 50 numbers which are incremented by 1.
x <- seq(0,50,by = 1)

# Create the binomial distribution.
y <- dbinom(x,50,0.5)

# Plot the graph for this sample.
plot(x,y)
#######
# Probability of getting 26 or less heads from a 51 tosses of a coin.
x <- pbinom(26,51,0.5)

print(x)
#########
# Find 8 random values from a sample of 150 with probability of 0.4.
x <- rbinom(8,150,.4)
hist(x)

#########Poisson regression
####log(y) = a + b1x1 + b2x2 + ...+ bnxn
###########################################################################
###########################################################################
x = range(10)
y = rnorm(10)

layout(matrix(c(1,2,3,2), nrow=2, ncol=2))
hist(rnorm(100))

print('Results for multiple simulations')
print('Last Winner Prices mean: ')
print('Hello!')

plot(runif(10), y, xlab="runif", ylab="foo/bar", col="red")
#########################################################################
ctl <- c(4.17,5.58,5.18,6.11,4.50,4.61,5.17,4.53,5.33,5.14)
trt <- c(4.81,4.17,4.41,3.59,5.87,3.83,6.03,4.89,4.32,4.69)
group <- gl(2, 10, 20, labels = c("Ctl","Trt"))
weight <- c(ctl, trt)

anova(lm.D9 <- lm(weight ~ group))
summary(lm.D90 <- lm(weight ~ group - 1))# omitting intercept

################################################
############################## More on Statistics
library(quantmod)

# initializatiom and set up
getSymbols("JPM") #NYSE JP Morgan & Chase from yahoo 
NQyear=JPM['2011-05-08::2016-05-08']
JPM.price= NQyear$JPM.Adjusted

JPM.dayreturn=diff(JPM.price)/ JPM.price[-length(JPM.price)] ## daily simple return
JPM.dayreturn <- na.omit(JPM.dayreturn)
JPM.logreturn=diff(log(JPM.price))  ## Cont compounded return
JPM.logreturn <- na.omit(JPM.logreturn)
hist(JPM.dayreturn)
hist(JPM.logreturn)
par(mfrow=c(2,1))
hist(JPM.dayreturn, freq=F,xlim=c(-0.25,0.1))
hist(JPM.logreturn,freq=F,xlim=c(-0.25,0.1))
par(mfrow=c(1,1))

hist(JPM.dayreturn, freq=F,xlim=c(-0.1,0.1))
hist(JPM.logreturn,freq=F,xlim=c(-0.1,0.1),border="red",add=TRUE)

plot(1:length(JPM.price),JPM.price,type="l")
plot(1:length(JPM.dayreturn),JPM.dayreturn,type="l")

lines(1:length(JPM.logreturn),JPM.logreturn,col="red")
lines(1:length(JPM.dayreturn),JPM.dayreturn,col="green")

hist(JPM.dayreturn, freq=F,nclass=100)

hist(JPM.dayreturn, freq=F,ylim=c(0,50))
points(density( JPM.dayreturn),type="l",col="blue")
points(density( JPM.dayreturn,width=0.03),type="l",col="lightblue")
points(density( JPM.dayreturn,width=0.05),type="l",col="lightgreen")

points(density( JPM.dayreturn,kernel="gaussian"),type="l",col="red")
points(density( JPM.dayreturn,kernel="epanechnikov"),type="l",col="orange")
points(density( JPM.dayreturn,kernel="cosine"),type="l",col="yellow")

qqnorm(as.vector(JPM.dayreturn))

#calcultes basic stats

mean(JPM.logreturn)
sd(JPM.logreturn)

library(fBasics) ## This loads the package fBasic

basicStats(JPM.logreturn) ## all the stats
## some stats can be accessed directly
skewness(JPM.logreturn)
kurtosis(JPM.logreturn)      ## Excess kurtosis

mean(JPM.dayreturn)
sd(JPM.dayreturn)
skewness(JPM.dayreturn)
kurtosis(JPM.dayreturn)

basicStats( JPM.dayreturn)
t.test(JPM.dayreturn)

basicStats( JPM.logreturn)
t.test(JPM.logreturn)

## Normality tests
## Check documentation on  normalTest
normalTest(JPM.dayreturn,method="jb")
#jarqueberaTest(sp500.dayreturn)


