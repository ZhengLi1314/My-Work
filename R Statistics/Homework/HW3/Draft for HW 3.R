rm(list=ls())
library("readxl")
library(fBasics)
library(reshape)

compustat <- read_excel("COMPUSTAT.xlsx")
crsp <- read_excel("CRSP.xlsx")

merged <- merge(compustat, crsp, by = c("fyear","cusip8"))

x1 <- merged[["vol"]]
y1 <- merged[["at"]]
relation1 <- lm(y1~x1)
print(summary(relation1))
plot(x1,y1,col = "blue",main = "Vol & At Regression",
     abline(relation1),cex = 1.3,pch = 16,xlab = "vol",ylab = "at")

yearMerged1 <- aggregate(merged$vol, by=list(merged$fyear, merged$cusip8, merged$at), FUN=sum, na.rm=TRUE)

x2 <- yearMerged1[["x"]]
y2 <- yearMerged1[["Group.3"]]
relation2 <- lm(y2~x2)
print(summary(relation2))
plot(x2,y2,col = "blue",main = "Vol & At Regression(Yearly)",
     abline(relation2),cex = 1.3,pch = 16,xlab = "vol",ylab = "at")

yearMerged2 <- aggregate(merged$vol, by=list(merged$fyear, merged$cusip8, merged$at), FUN=mean, na.rm=TRUE)
x3 <- yearMerged2[["x"]]
y3 <- yearMerged2[["Group.3"]]
relation3 <- lm(y3~x3)
print(summary(relation2))
plot(x3,y3,col = "blue",main = "Vol & At Regression(Yearly)",
     abline(relation3),cex = 1.3,pch = 16,xlab = "vol",ylab = "at")

Table <- matrix(c(relation1$coefficients, relation2$coefficients, relation3$coefficients),ncol = 2, byrow = TRUE)
colnames(Table) <- c("Intercept","x")
rownames(Table) <- c("Montly(Question 1)","Yearly By Sum(Question 2)","Yearly By Mean(Question 3)")
print(Table)

tinytex::install_tinytex()
