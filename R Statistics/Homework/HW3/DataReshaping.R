rm(list=ls())
dev.off()
#################################################
## Joining Columns and Rows in a Data Frame
# Create vector objects.
city <- c("Tampa","Seattle","Hartford","Denver")
state <- c("FL","WA","CT","CO")
zipcode <- c(33602,98104,06161,80294)

# Combine above three vectors into one data frame.
addresses <- cbind(city,state,zipcode)

# Print a header.
cat("# # # # The First data frame\n") 

# Print the data frame.
print(addresses)

# Create another data frame with similar columns
new.address <- data.frame(
  city = c("Lowry","Charlotte"),
  state = c("CO","FL"),
  zipcode = c("80230","33949"),
  stringsAsFactors = FALSE
)

# Print a header.
cat("# # # The Second data frame\n") 

# Print the data frame.
print(new.address)

# Combine rows form both the data frames.
all.addresses <- rbind(addresses,new.address)

# Print a header.
cat("# # # The combined data frame\n") 

# Print the result.
print(all.addresses)

###### Merging Data Frames
library(MASS)
head(Pima.te)
head(Pima.tr)
merged.Pima <- merge(x = Pima.te, y = Pima.tr,
                     by.x = c("bp", "bmi"),
                     by.y = c("bp", "bmi")
)

print(merged.Pima)
nrow(merged.Pima)
Pima.te[which(Pima.te$bp==60),]
P1<-Pima.te
P2<-Pima.tr
###########   Melting and Casting
library(MASS)
print(ships)
S<-ships
molten.ships <- melt(ships, id = c("type","year"))
molten.ships2 <- melt(ships, id = c("type","period"))
print(molten.ships)

recasted.ship <- cast(molten.ships, type+year~variable,mean)
print(recasted.ship)


###################################################
##################  Sorting Data
# sorting examples using the mtcars dataset
J<-mtcars
attach(mtcars)
# sort by mpg
newdata <- mtcars[order(mpg),]

# sort by mpg and cyl
newdata <- mtcars[order(mpg, cyl),]

#sort by mpg (ascending) and cyl (descending)
newdata <- mtcars[order(mpg, -cyl),]
detach(mtcars)
###################################################
################   Merging Data
# merge two data frames by ID
total <- merge(dataframeA,dataframeB,by="ID")
# merge two data frames by ID and Country
total <- merge(dataframeA,dataframeB,by=c("ID","Country"))
total <- rbind(dataframeA, dataframeB)
##################################################
######################  Aggregating Data
# aggregate data frame mtcars by cyl and vs, returning means
# for numeric variables
attach(mtcars)
A<-mtcars
newdata <- mtcars[order(cyl, vs),]
aggdata <-aggregate(mtcars, by=list(cyl,vs),
                    FUN=sum, na.rm=TRUE)  ##mean
print(aggdata)
detach(mtcars)
###################################################
#######################  Reshaping Data
# example using built-in dataset
mtcars
T<-t(mtcars)

# example of melt function
library(reshape)
mdata <- melt(mydata, id=c("id","time"))

# cast the melted data
# cast(data, formula, function)
subjmeans <- cast(mdata, id~variable, mean)
timemeans <- cast(mdata, time~variable, mean)
###################################################
######################   Subsetting Data
# select variables v1, v2, v3
myvars <- c("cyl", "hp", "wt")
newdata <- mtcars[myvars]
newdata <- subset(mtcars, wt <= 3 & cyl == 6,
                  select=c(wt, cyl, gear))
newdata <- subset(mtcars, wt <= 3 & cyl == 6)

newdata <- mtcars[ which(mtcars$wt<=3
                         & mtcars$cyl == 6),]

