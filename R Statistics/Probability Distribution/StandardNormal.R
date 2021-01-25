

####                            STANDARD NORMAL PROBABILITIES


# (1) Standard Normal probability: p(z < 2)

z <- 2

pnorm(z)




# (2) Standard Normal probability: p(z > -1)

z <- -1

1 - pnorm(z)




# (3) Standard Normal probabilty: p(-1 < z < 1)

z2 <- 1

z1 <- -1

pnorm(z2) - pnorm(z1)





# (4) Let z be the standard normal random variable. 
# If the area to the left of z is alpha = 0.01, then z is

alpha <- 0.01

qnorm(alpha)





# (5) Let z be the standard normal random variable.  
# If the area to the left of z is alpha = 0.025, then z is

alpha <- 0.025

qnorm(alpha)




# (6) Let z be the standard normal random variable. 
# If the area to the left of z is alpha = 0.050, then z is

alpha <- 0.050

qnorm(alpha)






# (7) Let z be the standard normal random variable. 
# If the area to the left of z is alpha = 0.10, then z is


alpha <- 0.10

qnorm(alpha)








