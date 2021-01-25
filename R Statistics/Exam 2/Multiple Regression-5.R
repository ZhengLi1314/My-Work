#                             Multiple Regression

# (1) Import cityraw into the R Workspace; list the first 2 observations and
# variable names

cityraw <- read.csv('cityraw.csv'); head(cityraw, 2)




# (2) Create a scatterplot to confirm (or disconfirm) any linear
# relationship between the dependent and independent variables

plot(cityraw$weather, cityraw$attitude, pch = 19, col = 'red', 
     xlim = c(0, 11), ylim = c(0, 11), xlab = 'Importance Placed on 
     Having Good Weather', ylab = 'Attitude on 11 Point Rating Scale',
     main = 'Scatterplot of Attitude against Importance Placed on 
     Having Good Weather')




# (3) Regress the dependent variable ('attitude') on the 2 independent 
# variables ('duration' and 'weather'). Name the model object 'model2.' 
# Display the estimated regression equation.

model2 <- lm(attitude ~ duration + weather, data = cityraw); model2

# model1 <- lm(attitude ~ duration, data = cityraw); model1


# (4) Report the diagnostic statistics associated with model2; report
# findings in normal notation (not scientific notation) 

options(scipen = 999)

summary(model2)




# (5) Find the 95% confidence interval of the regression coefficients and
# the intercept term

confint(model2, level = 0.95)




# (6) Find the values of the predicted dependent variable ('attitude') 
# for model2; store the values in the new object named 'attitude_predicted.'
# Display those values

attitude_predicted <- predict(model2); attitude_predicted




# (7) Incorporate the new column of data into the cityraw data; name the
# new (larger) data object 'newcityraw'

newcityraw <- cbind(cityraw, attitude_predicted); newcityraw




# (8) Find correlation coefficient of the actual and predicted dependent
# variables; that is, the correlation of 'attitude' and 'attitude_predicted'

cor(newcityraw$attitude, newcityraw$attitude_predicted)




# (9) Simulate 1,000,000 data values that have an F distribution with 
# numerator degrees of freedom = k = 2 and denominator degrees of freedom =
# (n - k - 1) = (12 - 2 - 1) = 9. (Remember that k = number of independent
# variables; n = sample size). Save in an object named 'ftwofive' and 
# create a histogram to get a glimpse at the distribution.

rf(1000000, 2, 9) -> ftwofive; hist(ftwofive, breaks = 500, 
    xlim = c(0, 10), ylim = c(0, 200000), col = 'gold', 
    xlab = 'F statistic', main = 'F Distribution with 2 and 9 df')




# (10) Now that we know what the F distribution (with k = 2 and
# (n - k - 1) = 9) looks like, what is the value of F that cuts off 
# an area of 0.05 in the upper tail?  Or what is the same thing,
# what is the value of F that cuts off an area of 0.95 in the lower tail?

qf(0.05, 2, 9, lower.tail = FALSE)

qf(0.95, 2, 9)




# (11)  Since F = 57.132, what is the p-value?

options(scipen = 999)

pf(77.132, 2, 9, lower.tail = FALSE)

# Because p-value = 0.000 < alpha = 0.05, we reject the null hypothesis




# Butler Trucking Example: a quick review of the process

# (12) Import Butler.csv into the R Workspace; name it butler;
# examine entire data set (don't worry: it's very small)

butler <- read.csv('Butler.csv'); butler




# (13) Use the pairs() function to create a scatterplot depicting
# the relationship between all four variables simultaneously. 
# Note: the fourth argument suppresses the values in the lower
# diagonal of the matrix (which is redundant; all the information
# we need is reported in the upper diagonal)

pairs(butler, pch = 19, col = 'purple', lower.panel = NULL)

# There is a roughly linear relationship between 'Time' and 
# 'Miles'; there is a somewhat weaker linear relationship
# between 'Time' and 'Deliveries'; there doesn't appear to 
# be any sign of a linear relationship between 'Time' and 'Price.' 
# (We may want to consider dropping 'Price' from the analysis,
# but let us continue with the regression equation.)




# (14) Regress the dependent variable ('Time') on the 3 independent 
# variables ('Miles,' 'Deliveries,' and 'Price'). Name the object 
# 'model3.' Display and summarize the estimated regression equation

model3 <- lm(Time ~ Miles + Deliveries + Price, data = butler);
          summary(model3)

# Going through the 3 steps of the document "How to interpret our
# regression results.pdf," we see that (1) the adjusted-rsquare is
# 0.8703 (very good), (2) the p-value associated with the F statistic
# is 0.001367 (also good), and (3) the p-values (reported in the
# column headed by Pr(>|t|)) are 0.00172 for 'Miles' (good); 0.01382
# for 'Deliveries' (good again); and 0.44206 for 'Price' (awful). Our
# conclusion at this point is to drop 'Price' from the analysis 
# and re-run the regression equation without it.  



# (15) Regress the dependent variable ('Time') on the 2 independent 
# variables ('Miles' and 'Deliveries'). Name the object 'model4.' 
# Display the estimated regression equation.

model4 <- lm(Time ~ Miles + Deliveries, data = butler); 
          summary(model4)

# Going through the 3 steps once again, we see that everything now
# looks fine: the overall regression equation is significant and
# the two independent variables---Miles and Delivery---are too.

# How do we interpret this result?

# Since b1 = 0.0611, we know that a 1-mile change is expected to
# result in a change of (0.0611)(60 minutes) = 3.67 minutes; i.e.,
# Want to add 1 extra mile? it will require truck to be out for an
# additional 3.67 minutes

# Since b2 = 0.9234, we know that a 1-delivery change is expected to
# result in a change of (0.9234)(60 minutes) = 55.40 minutes; i.e.,
# add 1 extra delivery? it will require truck to be out for an
# additional 55.40 minutes




# (16) Suppose it's 12:00 noon and we have 1 truck that is currently
# sitting in the garage and not being used. The garage closes at
# 6:00 p.m. (6 hours from now), but an order comes in that requires
# the driver to drive 95 miles and make 4 deliveries. Will the driver
# be able to make all 4 deliveries and still return by 6:00 p.m. when
# the garage closes for the evening?  Let's plug these values of
# the independent variables into the estimated regression equation
# and see how long this driving assignment might be expected to take.
# Here is how R can do this in 2 steps: first, create a new data 
# frame, and second, use the name of the new data frame as the
# second argument of the predict() function. 

newvalues <- data.frame(Miles = c(95), Deliveries = c(4)); newvalues

predict(model4, newvalues)




# Using the estimated regression equation to predict how long the
# driver should be out on an assignment requiring 95 miles and
# 4 deliveries, we see that the required time is 8.63 hours, far
# longer than the time that is available before the garage closes.
# It is probably best to redeploy the resources in some other way.




# (17) Finally, suppose we have a workday assignment that requires
# the driver to travel 80 miles and make 6 deliveries.  Should we
# use the regression equation to make predictions in this case? To
# answer this question, let's take a look at the 'butler' data

butler

# Answer: Strictly speaking, we should not.  The model itself was
# calibrated on a range of data that does not extend to 6 deliveries
# so we do not know for sure what the world looks like "out there."
# If we do use the model for prediction anyway we should keep in 
# the weakness of the model: the range of Miles runs from 50 to 100;
# the range of Deliveries runs from 2 to 4. Attempting to forecast
# by plugging in values outside that range is usually risky.


