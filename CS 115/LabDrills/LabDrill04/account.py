"""
File: account.py
This module defines the Account class.
"""

class Account:
    """This class represents an account with the owners'
    name, Pin, and balance."""
    
    def __init__(self, name, pin, balance = 0.0):
        self.name = name
        self.pin = pin
        self.balance = balance

    def __str__(self):
        """Returns the string rep."""
        return "Name: " + self.name + "\nPin: " + self.pin + "\nBalance: " + str(self.balance)

    def getBalance(self):
        """Returns the current balance."""
        return self.balance


    def getName(self):
        """Returns the current name."""
        return self.name

    def getPin(self):
        """Returns the current pin."""
        return self.pin

    def deposit(self, amount):
        """If the amount is valid, adds it
        to the balance and returns None;
        otherwise, returns an error message."""
        if (amount > 0):
            self.balance += amount
            return None
        else:
            return "The number you entered is invalid." 

    def withdraw(self, amount):
        """If the amount is valid, sunstract it
        from the balance and returns None;
        otherwise, returns an error message."""
        if (amount < self.balance) and (amount > 0) :
            self.balance -= amount
            return None
        else:
            return "The number you entered is invalid."

