"""
File: savingsaccount.py
This module defines the SavingsAccount class.
"""
from account import Account

class SavingsAccount(Account):
    """This class represents a savings account
    with the owner's name, PIN, and balance."""

    RATE = 0.02    # Single rate for all accounts

    def __init__(self, name, pin, balance = 0.0):
        super().__init__(self, name, pin, balance)

    def computeInterest(self):
        """Computes, deposits, and returns the interest."""
        interest = self.balance * SavingsAccount.RATE
        self.deposit(interest)
        return interest

a1 = SavingsAccount("Zheng", "8219", 10000)
print(a1.getBalance())
print(a1.getName())
print(a1.getPin())
print(a1.computeInterest())
print(a1.getBalance())
print(a1.deposit(-2))
print(a1.withdraw(50))
print(a1.getBalance())
