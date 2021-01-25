"""

File: checkingaccount.py

Defines the CheckingAccount
"""


class CheckingAccount(Account):
    """This class represents a checking account
    with the owner's name, PIN, and balance."""

    CHECKING_RATE = 0.01

    def __init__(self, name, pin, balance = 0.0):
        super().__init__(self, name, pin, balance)
    
    def computeInterest(self):
        """Computes, deposits, and returns the interest."""
        interest = self.balance * CheckingAccount.CHECKING_RATE
        self.deposit(interest)
        return interest

account = CheckingAccount("zheng", "12312")
account.getBalance()