# Rock Paper Scissors 

# Import the random library
import random

# Infinite loop to keep the game state going
while True:
    print("Rock paper scissors game!")

    # User Choice here
    user_choice = int(input("Enter your choice below: \n 1. Rock \n 2. Paper \n 3. Scissors \n User Input: "))
    if user_choice > 3 or user_choice < 1:
        user_choice = int(input("Enter your choice below: \n 1. Rock \n 2. Paper \n 3. Scissors \n User Input: "))
    if user_choice == 1:
        print("You chose Rock!")
    elif user_choice == 2:
        print("You chose Paper!")
    else:
        print("You chose Scissors!")

    # Computer Choice
    comp_choice = int(random.randint(1,3))
    if comp_choice == 1:
        print("Computer chose Rock!")
    elif comp_choice == 2:
        print("Computer chose Paper!")
    else:
        print("Computer chose Scissors!")
    
    # Evaluation Loop
    if user_choice == 1 and comp_choice == 3:
        print("Player wins.")
    if user_choice == 1 and comp_choice == 2:
        print("Computer wins.")
    if user_choice == 2 and comp_choice == 1:
        print("Player wins.")
    if user_choice == 2 and comp_choice == 3:
        print("Computer wins.")
    if user_choice == 3 and comp_choice == 1:
        print("Computer wins.")
    if user_choice == 3 and comp_choice == 2:
        print("Player wins.")
    if user_choice == comp_choice:
        print("Tie.")