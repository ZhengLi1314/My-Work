import random
import time

def startGame():
    print("initializing the game")
    time.sleep(3)
    print("loading text...")
    time.sleep(3)
    print("loading world...")
    time.sleep(1)
    print("Hello! Welcome to Text Adventure 2.0! The mechanics in this game are very simple. You are given a series of paths, and you take the one that you think is the best!")
    print("It's a very simple game!")
    print("Let's start!")
    time.sleep(2)
    print("You are in a room all by yourself with three items. One is the TV, the other one is your bed, and the last one is your own computer")
    print("What do you want to do?  1 - watch TV.  2- Lie in bed and try to fall assleep. 3- sit in front of your own computer")
    path = input("1: TV. 2: Bed. 3: Computer. Type the number here: ")
    return nextAct(path)

def nextAct(x):
    if x == "1":
        print("Wow! You could have picked to sleep in bed, or your computer, and yet you chose to sit in front of the TV. In a game you are a lazy human, \
not capable of changing the whole around you")
        time.sleep(2)
        print("You should be ashamed of yourself. You really should. Well I'll tell you what happened.")
        print("You sat in front of the TV and did nothing with your life at all. THE END")
        return endMessage()
    elif x == "2":
        print("As you went to bed, you started to think about that girl that you saw at school. That hairstyle was kind of cute, wasn't it? As you ponder these thoughts you \
slowly fall assleep")
        print("When you wake up the next morning you realize nothing has changed and everything is still intanct. You wonder if life is a computer program on a screen...")
        time.sleep(2)
        print("Realizing life is meaningless there is only one thing left for you to do")
        secondPath = input("What would you like to do? 1: head to the closet. 2: drop from the balcony and hit your head on concrete below. Type the number: ")
        return nextAct2(secondPath)
    elif x == "3":
        print("You walk toward the computer")
        print("You sit down")
        print("You boot up the computer")
        print("This is what you see")
        return startGame()
    else:
        print("You are a stupid ass lame asss annoying bitch. Really? You thought that by pressing other buttons you could just break the game that easily. Fuck you asshole.")
        return endGame()


def nextAct2(y):
    if y == "1":
        for x in range(10):
            print("HANG" * 8)
            continue
        return endMessage()
    elif y == "2":
        for x in range(50):
            print("You are closer to the ground" * 8)
            continue
        print("You smashed your head on concrete")
        return endMessage()


def endMessage():
    print("Thanks for playing!")
    print("Come back anytime!")

startGame()

print("%0.7f" % 24.325)