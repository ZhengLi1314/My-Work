"""Title:
- 2021 SSMIF Quant Project - Pi Challenge

Author:
- Zheng Li

Date:
- 10/17/2020

Filename: 
- Pi.py

Description:
- This project creates a rollDice function and use it to estimate the
value of pi using a monte-carlo simulation.
"""

import random

#Create the rollDice function
def rollDice():
    return random.randint(1,6)


#Monte-carlo simulation for Pi using rollDice function
INTERVAL= 700
  
circle_points = 0
square_points = 0

for x in range(INTERVAL**2):


# Since 6 inputs are too less to have the close estimation of pi, I decided to find a way
# to expand the number of available random inputs.
# In order to add more numbers that don't overlap with the 1 to 6, I came out a formula:
# (rollDice - 1) * 6
# This plus rollDice will give me random int from 1 to 36
# I then repeated the process to expand further and was able to have random int from 1 to 1296.
# Since I want numbers starting from 0, I then minus all of the numbers by 1.
# I multiply every number by 1/1295 because I need all of my numbers to be less than 1.
# Hence I can just use the same rest of the code as shown in the example from the link.

#I kept the following 2 lines long because this is easier to view.
    rand_x = (rollDice() + ((rollDice()-1)*6) + ((rollDice()-1)*36) + ((rollDice()-1)*216) - 1) * 1/1295

    rand_y = (rollDice() + ((rollDice()-1)*6) + ((rollDice()-1)*36) + ((rollDice()-1)*216) - 1) * 1/1295

    origin_dist= rand_x**2 + rand_y**2

    if origin_dist <= 1: 
        circle_points += 1
    
    square_points += 1

    pi = 4 * circle_points / square_points

print(pi)


