#               Central Limit Theorem: A Demonstration

# (a) Simulate 1,200,000 data values that are exponentially-distributed
# with a mean of 15; assign these values to an object named 'exp15'

rexp(1200000, 1/15) -> exp15



# (b) Display data in 'exp15' is a histogram (to make sure shape of 
# the distribution looks 'exponential'). Confirm that the mean and
# standard deviation of 'exp15' are equal to 15.

hist(exp15, col = 'purple', breaks = 100)

mean(exp15); sd(exp15)



# (c) Reshape the data in 'exp15' into a matrix with 40,000 rows and
# 30 columns (note: 40,000 rows of 30 columns includes 1,200,000 data 
# values.) Note: the second argument of the matrix() function indicates
# the number of rows the matrix must have. Assign the result to 'm.'

m <- matrix(exp15, 40000)



# (d) Find the mean of all 40,000 rows (remember that each row has 30
# values); assign the 40,000 values ( i.e., means) to an object named 'r.'

rowMeans(m) -> r



# (e) Display the 'r' data in a histogram.  Confirm that it is 'normal.'

hist(r, col = 'green', breaks = 100, xlim = c(5, 35))



# (f) Now that we know the 'shape' of the sampling distribution of x-bar is
# normal, confirm that its mean = 15   

mean(exp15); mean(r)



# (g) And now that we know that (1) the sampling distribution of x-bar 
# is normal and (b) the mean of the sampling distribution is 15, confirm
# that the standard deviation of the sampling distribution of x-bar is
# 15/sqrt(30) = 2.74 (roughly). 

sd(exp15)/sqrt(30); sd(r)