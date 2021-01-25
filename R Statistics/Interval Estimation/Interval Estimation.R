
#                     INTERVAL ESTIMATION

#   Import NewBalance.csv into the R Workspace; name it newbalance

newbalance <- read.csv("NewBalance.csv")



#   Find 95% confidence interval estimate of the population mean

t.test(newbalance, conf = 0.95)



#   Import Scheer.csv into the R Workspace; name it scheer

scheer <- read.csv("Scheer.csv")



#   Find 95% confidence interval estimate of the population mean

t.test(scheer, conf = 0.95)




# Import TeeTimes.csv into the R Workspace; name it teetimes

teetimes <- read.csv('TeeTimes.csv')



#   Find 95% confidence interval estimate of the population proportion

t.test(teetimes, conf = 0.95)



