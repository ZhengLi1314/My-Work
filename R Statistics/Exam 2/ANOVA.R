
#                   ANALYSIS OF VARIANCE (ANOVA)

# Example 1: Equal Sample Sizes: An Observational Study (pp. 1 - 10)

# (1) Create vector named 'city' (p. 8) 

city <- c(rep('LA',3), rep('Denver',3), rep('Chicago', 3), rep('NYNJ',3))




# (2) Create vector named 'readjust' (p. 8)

readjust <- c(10,9,5,11,16,9,13,8,9,18,23,25)




# (3) Create data frame named 'investment' (p. 9)

investment <- data.frame(City = city, Readjust = readjust)




# (4) Inspect 'investment' to be sure that it includes everything we want. 

investment




# (5) Use anova(lm()) function to perform an ANOVA on 'investment.' (p. 9) Let 
# 'Readjust' be the dependent variable, 'City' the independent variable. 
 
anova(lm(Readjust ~ City, data = investment))  






# Example 2: Unequal Sample Sizes: An Observational Study (pp. 10 - 16)

# (1) Create vector named 'cityn' (p. 14) 

cityn <- c(rep('Seattle',6), rep('Houston',4), rep('Miami', 5))




# (2) Create vector named 'readjustn' (p. 14)

readjustn <- c(10, 8, 5, 12, 14, 11, 6, 9, 8, 13, 14, 13, 10, 17, 16)




# (3) Create data frame named 'investmentn' (p. 14)

investmentn <- data.frame(Cityn = cityn, Readjustn = readjustn)




# (4) Inspect 'investmentn' to be sure that it includes everything we want. 

investmentn




# (5) Use anova(lm()) function to perform an ANOVA on 'investment.' (p. 15)  
# Let 'Readjust' be the dependent variable, 'City' the independent variable. 

anova(lm(Readjustn ~ Cityn, data = investmentn))  






# Example 3: ANOVA and Experimental Design (pp. 16 - 19)

# (1) Import Chemtech.CSV into the R Workspace; name it Chemtech (p. 18)

Chemtech <- read.csv('Chemtech.CSV')




# (2) Examine the data and confirm the variable names (p. 18)

Chemtech




# (3) Use anova(lm()) function to perform an ANOVA on 'Chemtech.' (p. 19)  
# Let 'Units' be the dependent variable, 'Method' the independent variable.

anova(lm(Units ~ Method, data = Chemtech))






# Example 4: Observational Study or An Experiment? (pp. 19 - 21)

# (1) Import NCP.CSV into the R Workspace; name it NCP (p. 20)

NCP <- read.csv('NCP.CSV')




# (2) Examine the data and confirm the variable names (p. 21)

NCP




# (3) Use anova(lm()) function to perform an ANOVA on 'NCP.' (p. 21)  
# Let 'Score' be the dependent variable, 'Location' the independent variable.

anova(lm(Score ~ Location, data = NCP))










