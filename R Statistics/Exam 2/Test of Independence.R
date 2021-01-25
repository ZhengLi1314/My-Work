#                     CHI-SQUARE TEST OF INDEPENDENCE

# Example 1 (pp. 2 - 11): Is Beer Preference the Same For Males and Females?

# (1) Import BeerPreference.CSV into R Workspace; name it bp; take a look

bp <- read.csv('BeerPreference.csv'); head(bp, 7); str(bp)




# (2) Just to get a better idea of what the data look like, organize
# the 'bp' data in a crosstabulation; name the crosstab 'table';take a look

table(bp$Preference, bp$Gender) -> table; table




# (3) To test for the independence of beer preference across genders,
# apply the chisq.test() function.

chisq.test(bp$Preference, bp$Gender)



# Example 3 (pp. 13 - 17):  CEOs and zodiac signs


# (1) create data set consisting of 256 CEOs as well as their zodiac sign;
# assign the result to an object named 'CEOsign'

CEOsign <- c(rep('aries', 23), rep('taurus', 20), rep('gemini', 18),
    rep('cancer', 23), rep('leo', 20), rep('virgo', 19),
    rep('libra', 18), rep('scorpio', 21), rep('sagittarius', 19),
    rep('capricorn', 22), rep('aquarius', 24), rep('pisces', 29))




# (2) Just to get a better idea of what the data look like, organize
# the 'CEOsign' data in a crosstabulation; name the crosstab 'ceotbl';
# take a look

table(CEOsign) -> ceotbl; ceotbl




# (3) To test for the independence of CEO-status and zodiac signs;
# apply the chisq.test() function to the name of the crosstabulation
# created in (2) above, 'ceotbl.' (Since CEOsign is not a data frame, 
# and does not have variable names, we can execute the test by simply 
# submitting 'ceotbl.')  


chisq.test(ceotbl)




          






