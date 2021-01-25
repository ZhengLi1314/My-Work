#          INTERVAL ESTIMATION

# Import NewBalance.csv into the R workspace; name it newbalance

newbalance <- read.csv("NewBalance.csv"); newbalance


# Find the 95% confidence interval estimate of the population mean

t.test(newbalance,conf=0.95)

#####################################

# Import Scheer into the R workspace; name it scheer

scheer <- read.csv("Scheer.csv"); scheer


# Find the 95% confidence interval estimate of the population mean
t.test(scheer,conf=0.95)