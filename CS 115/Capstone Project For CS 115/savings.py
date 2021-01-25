"""Title:
- 2020 Spring Capstone Project

Author:
- Zheng Li

Date:
- 5/17/2020

Filename: 
- savings.py

Description:
- This module defines the Savings class and stimulate the Bank of 
America Advantage Savings operations.
"""
from datetime import datetime
from bank import Bank

class Savings(Bank):

    def __init__(self):
        super().__init__()
        self.monthlyFee = 0
        self.overDraft = int(input("What overdraft policy do you pick? " \
        "1 for Standard, 2 for Decline All, 3 for Overdraft Protection"))

    def SixMonthOver(self):
        #six month free period is over, time to see if the customer 
        #is qualified for free maintenance fee.
        if (self.userInfo.getAge() >= 24) and \
            (self.userInfo.getEducation() is True) or \
            (self.userInfo.getRewardProgram() > 0):
            self.monthlyFee = 0
        else:
            self.monthlyFee = 8

    def LastDayOfMonthCheck(self):
        #subtract the monthly maintenance fee from the balance if 
        #not qulified for 0 maintenance fee.
            holder = 0
            for key in self.bHistory:
                if self.bHistory[key] < 500:
                    holder += 1
            if holder > 0:
                self.balance -= self.monthlyFee
                self.bHistory[str(datetime.now())] = self.balance
        #It also checks whether the person has transfered more than 6 times.
            if (len(self.bHistory) > 6) and \
            (self.userInfo.getRewardProgram() == 0):
                self.balance -= (len(self.bHistory) - 6) * 10
    
    def LastDayOfYear(self):
        #Calculate the interest and deposit into the balance.
        RATE = 0.0009
        if self.userInfo.getRewardProgram == 0:
            interestRate = RATE
        elif self.userInfo.getRewardProgram == 1:
            interestRate = RATE * 1.05
        elif self.userInfo.getRewardProgram == 2:
            interestRate = RATE * 1.10
        else:
            interestRate = RATE * 1.20
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
    bank1 = Savings()
    bank1.LastDayOfMonthCheck()
    bank1.writeCheck(1000)
    bank1.LastDayOfYear()
    bank1.SixMonthOver()
    bank1.getBalanceSheet()
