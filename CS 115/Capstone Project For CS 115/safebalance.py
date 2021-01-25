"""Title:
- 2020 Spring Capstone Project

Author:
- Zheng Li

Date:
- 5/17/2020

Filename: 
- safebalance.py

Description:
- This module defines the SafeBalance class and stimulate the Bank of 
America Advantage SafeBalance Banking operations.
"""
import pickle
from datetime import datetime
from bank import Bank

class SafeBalance(Bank):

    def __init__(self):
        """stores not only the data from its parent class Bank, 
        but also stores a monthly fee variable. And check if 
        this monthly fee is qualified to be 0 or not"""
        super().__init__()
        self.monthlyFee = 4.95
        if (self.userInfo.getAge() <= 24) and \
            (self.userInfo.getEducation() is True) or \
            (self.userInfo.getRewardProgram() > 0):
            self.monthlyFee = 0

    def LastDayOfMonthCheck(self):
        #subtract the monthly maintenance fee from the balance
        self.balance -= self.monthlyFee
        self.bHistory[str(datetime.now())] = self.balance
    
    def writeCheck(self, amount):
        #writting a check, which can brings the balance to negative value
        self.balance -= amount
        self.bHistory[str(datetime.now())] = self.balance

if __name__ == "__main__":
    bank1 = SafeBalance()
    bank1.LastDayOfMonthCheck()
    bank1.writeCheck(500)
    bank1.getBalanceSheet()
