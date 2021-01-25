"""Title:
- 2020 Spring Capstone Project

Author:
- Zheng Li

Date:
- 5/17/2020

Filename: 
- relationship.py

Description:
- This module defines the Relationship class and stimulate the Bank of 
America Advantage Relationship Banking operations.
"""
from datetime import datetime
from bank import Bank

class Relationship(Bank):

    def __init__(self):
        super().__init__()
        self.monthlyFee = 25
        if (self.userInfo.getRewardProgram() > 0):
            self.monthlyFee = 0
        self.overDraft = int(input("What overdraft policy do you pick? " \
        "1 for Standard, 2 for Decline All, 3 for Overdraft Protection"))

    def LastDayOfMonthCheck(self):
        #subtract the monthly maintenance fee from the balance if 
        #not qulified for 0 maintenance fee.
            monthlySum = 0
            for key in self.bHistory:
                monthlySum += self.bHistory[key]
            average = monthlySum / len(self.bHistory)
            if average < 10000:
                self.balance -= self.monthlyFee
                self.bHistory[str(datetime.now())] = self.balance
    
    def LastDayOfYear(self):
        #Calculate the interest and deposit into the balance.
        if self.userInfo.getRewardProgram == 0:
            interestRate = 0.0001 
        elif self.userInfo.getRewardProgram == 1:
            interestRate = 0.0004 
        elif self.userInfo.getRewardProgram == 2:
            interestRate = 0.0005 
        else:
            interestRate = 0.0006
        self.deposit(self.balance * interestRate)  
        self.bHistory[str(datetime.now())] = self.balance

    def writeCheck(self, amount):
        #writting a check, which can brings the balance to negative value
        #if overdraft, then check for customer's policy.
        if (self.balance >= amount) or (amount <= 1):
            self.balance -= amount
        elif self.overDraft == 1:
            self.balance -= amount + 35
        elif self.overDraft == 2:
            self.balance -= 35
        else:
            self.balance -= 12
        self.bHistory[str(datetime.now())] = self.balance

    

if __name__ == "__main__":
    bank1 = Relationship()
    bank1.LastDayOfMonthCheck()
    bank1.writeCheck(5000)
    bank1.LastDayOfYear()
    bank1.getBalanceSheet()
