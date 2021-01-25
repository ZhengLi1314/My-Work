"""Title:
- 2020 Spring Capstone Project

Author:
- Zheng Li

Date:
- 5/17/2020

Filename: 
- user.py

Description:
- This module defines the user class and store the user information.
"""

class User:
    """This class store all the necessary user information for future 
    banking operations. It requires one argument: the user's full 
    name."""
    def __init__(self, fullname):
        self.name = fullname
        self.age = int(input("What is your age "))
        self.dob = input("What is your date of birth ")
        self.education = bool(input("Are you currently in" \
        "highschool or college? Answer 'true' or 'false' "))
        self.address = input("What is your address ")
        self.eaddress = input("What is your email address ")
        self.rewardProgram = int(input("What type of client are" \
        "you in the Preferred Rewards Program? Answer '0' for not" \
        "in the program, '1' for Gold member, '2' for Platinum" \
        "member, '3' for Platinum Honors member. "))

    def __str__(self):
        #Returns the string rep.
        result =  'Name:    ' + self.name + '\n' + \
            'Age:     ' + str(self.age) + '\n' + \
            'DOB:    ' + self.dob + '\n' + \
            'A student in high school or college:     ' + \
                str(self.education) + '\n' + \
            'Address:    ' + self.address + '\n' + \
            'Email address:     ' + self.eaddress + '\n' + \
            'Preferred Rewards Program status:     ' + \
                str(self.rewardProgram) + '\n' 
        return result

    def setAge(self, newAge):
        #Change the user's age.
        self.age = newAge

    def getAge(self):
        #Get the user's age.
        return self.age

    def setDob(self, newDob):
        #Change the user's DOB.
        self.dob = newDob

    def setEducation(self, newEducation):
        #Change the user's education info.
        self.education = newEducation

    def getEducation(self):
        #Get the user's education info.
        return self.education

    def setAddress(self, newAddress):
        #Change the user's address.
        self.address = newAddress

    def setEaddress(self, newEaddress):
        #Change the user's email address.
        self.eaddress = newEaddress

    def setRewardProgram(self, newRewardProgram):
        #Change the user's Preferred Reward Program status.
        self.rewardProgram = newRewardProgram

    def getRewardProgram(self):
        #Get the user's Preferred Reward Program status.
        return self.rewardProgram

# Functions for testing
if __name__ == "__main__":
    user1 = User("Zheng Li")
    print(user1)
    user1.setAge(19)