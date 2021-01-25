QUARTERS_VALUE = 0.25
DIMES_VALUE = 0.10
NICKELS_VALUE = 0.05
PENNY_VALUE = 0.01

def main():
    print("Change Counter")
    print()
    print("please enter the count of each US coin type.")
    quarters = int(input("Quarters: "))
    dimes = int(input("Dimes: "))
    nickels = int(input("Nickels: "))
    pennies = int(input("Pennies: ")) 
    total = quarters * QUARTERS_VALUE + dimes * DIMES_VALUE + nickels * NICKELS_VALUE + pennies * PENNY_VALUE
    print()
    print("The total value of your change is", total)

main()

