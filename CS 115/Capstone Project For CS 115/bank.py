"""Title:
- 2020 Spring Capstone Project

Author:
- Zheng Li

Date:
- 5/17/2020

Filename: 
- bank.py

Description:
- This module defines the general bank class and allows basic operations 
like withdraw, deposit, and etc.
"""

import pickle
import random
from datetime import datetime
from user import User


class Bank:
    def __init__(self):
        self.name = input("What is your full name ")
        self.userInfo = User(self.name)
        self.balance = float(input("How much do you want to deposit now?"))
        self.bHistory = {str(datetime.now()):self.balance}
        self.key = self.name + str(random.randint(1000, 9999))
        self.pickle = open(str(self.name), "wb")
        pickle.dump(self.bHistory, self.pickle)

    def __str__(self):
        #basic information of the class
        result = "Name:   " + self.name + '\n' + "Key:   " + \
            self.key + '\n' + "Balance:   " + str(self.balance)
        return result

    def deposit(self, amount):
        #deposit money into account
        self.balance += amount
        self.bHistory[str(datetime.now())] = self.balance
        print("Amount Deposited:", amount)
 
    def withdraw(self, amount):
        #withdraw money from account
        if self.balance >= amount:
            self.balance -= amount
            print("\n You withdrew:", amount)
        else:
            print("\n Insufficient balance  ")
        self.bHistory[str(datetime.now())] = self.balance

    def getBalance(self):
        #return balance
        return self.balance
    
    def getBalanceSheet(self):
        #return the dictionary that records every transaction
        print(self.bHistory)
    
    def atm_withdraw(self, amount):
        #atm fees, because all bankings have this feature.
        self.withdraw(amount)
        self.bHistory[str(datetime.now())] = self.balance
        decision = bool(input("Are you using BOA ATM?" \
            "'True' or 'False'? "))
        if decision is False:
            decision1 = bool(input("Are you in America?" \
                 "'True' or 'False'? "))
            if decision1 is True:
                self.balance -= 2.5
                self.bHistory[str(datetime.now())] = self.balance

            else:
                self.balance -= 5.0
                self.bHistory[str(datetime.now())] = self.balance

    def save(self):
        #save the pickle file for future use
        self.pickle.close()

# Functions for testing
if __name__ == "__main__":
    bank1 = Bank()
    bank1.deposit(5000)
    bank1.atm_withdraw(300)
    print(bank1)
    bank1.getBalanceSheet()
    bank1.save()

