rm(list=ls())
install.packages("quantmod")
library(quantmod)
getSymbols("JPM") #NYSE JP Morgan & Chase from yahoo 
getSymbols("MSFT")
getSymbols("F")

head(JPM)
tail(JPM)
tail(JPM$JPM.Close)
JPM$JPM.Close
head(JPM$JPM.Close)
class(JPM$JPM.Close)
class(JPM)
A <- as.matrix(JPM)
A[2,]
class(A)
############ xts object
#http://rstudio-pubs-static.s3.amazonaws.com/288218_117e183e74964557a5da4fc5902fc671.html
# Create the object data using 5 random numbers

# Select all of 2016 from x
JPM_2016 <- JPM$JPM.Close["2016"]

# Select January 1, 2016 to March 22, 2016
JPM_1 <- JPM$JPM.Close["20200101/20200304"]
MSFT_1 <- MSFT$MSFT.Close["20200101/20200304"]
F_1 <- F$F.Close["20200101/20200304"]
JPM_2 <- JPM["20200101/20200304"]
S<-index(JPM_2)
W<-coredata(JPM_2)
class(W)
length(JPM_2)
class(S)
# Verify that jan_march contains 82 rows
82 == length(jan_march)


data <- rnorm(5)

# Create dates as a Date class object starting from 2016-01-01
dates <- seq(as.Date("2016-01-01"), length = 5, by = "days")
class(dates)
# Use xts() to create smith
smith <- xts(x = data, order.by = dates)

# Create bday (1899-05-08) using a POSIXct date class object
bday <- as.POSIXct("1899-05-08")

# Create hayek and add a new attribute called born
hayek <- xts(x = data, order.by = dates)

# Extract the core data of hayek
hayek_core <- coredata(hayek)

# View the class of hayek_core
class(hayek_core)

# Extract the index of hayek
hayek_index <- index(hayek)

# View the class of hayek_index
class(hayek_index)
# Create dates
dates <- as.Date("2016-01-01") + 0:4

# Create ts_a
ts_a <- xts(x = 1:5, order.by = dates)

# Create ts_b
ts_b <- xts(x = 1:5, order.by = as.POSIXct(dates))

# Extract the rows of ts_a using the index of ts_b
ts_a[index(ts_a)]

# Extract the rows of ts_b using the index of ts_a
ts_a[index(ts_b)]
# Convert austres to an xts object called au
au <- as.xts(austres)

# Then convert your xts object (au) into a matrix am
am <- as.matrix(au)

# Inspect the head of am
head(am)

# Convert the original austres into a matrix am2
am2 <- as.matrix(austres)

# Inspect the head of am2
head(am2)

# Create lastweek using the last 1 week of temps
lastweek <- last(JPM, "1 week")

# Print the last 2 observations in lastweek
last(lastweek, 2)

# Extract all but the first two days of lastweek
first(lastweek, "-2 days")
################ Lag and Lead
# Create a leading object called lead_x
lead_JPM <- lag(JPM$JPM.Close, k = -1)

# Create a lagging object called lag_x
lag_JPM <- lag(JPM$JPM.Close, k = 1)

# Merge your three series together and assign to z
z = cbind( JPM$JPM.Close, lead_JPM, lag_JPM)
head(z)
tail(z)
