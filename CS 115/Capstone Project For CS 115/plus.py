"""Title:
- 2020 Spring Capstone Project

Author:
- Zheng Li

Date:
- 5/17/2020

Filename: 
- Plus.py

Description:
- This module defines the Plus class and stimulate the Bank of 
America Advantage Plus Banking operations.
"""
from datetime import datetime
from bank import Bank

class Plus(Bank):
    def __init__(self):
        """stores not only the data from its parent class Bank, 
        but also stores a monthly fee variable. And check if 
        this monthly fee is qualified to be 0 or not"""
        super().__init__()
        self.monthlyFee = 12
        if (self.userInfo.getAge() >= 24) and \
            (self.userInfo.getEducation() is True) or \
            (self.userInfo.getRewardProgram() > 0):
            self.monthlyFee = 0
        self.overDraft = input("What overdraft policy do you pick? " \
        "1 for Standard, 2 for Decline All, 3 for Overdraft Protection")

    def LastDayOfMonthCheck(self):
        #subtract the monthly maintenance fee from the balance if 
        #not qulified for 0 maintenance fee.
            holder = 0
            for key in self.bHistory:
                if self.bHistory[key] < 1500:
                    holder += 1
            if holder > 0:
                self.balance -= self.monthlyFee
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
            print("Check is returned due to insufficient")
        else:
            self.balance -= 12
        self.bHistory[str(datetime.now())] = self.balance

    

if __name__ == "__main__":
    bank1 = Plus()
    bank1.LastDayOfMonthCheck()
    bank1.writeCheck(500)
    bank1.getBalanceSheet()
