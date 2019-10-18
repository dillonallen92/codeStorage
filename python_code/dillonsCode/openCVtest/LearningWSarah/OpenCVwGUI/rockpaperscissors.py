# Rock Paper Scissors 

# Import the random library
import random

# Infinite loop to keep the game state going
print("Rock paper scissors game!")
while True:

    # User Choice here
    user_choice = int(input("Enter your choice below: \n 1. Rock \n 2. Paper \n 3. Scissors \n User Input: "))
    if user_choice > 3 or user_choice < 1:
        user_choice = int(input("Enter your choice below: \n 1. Rock \n 2. Paper \n 3. Scissors \n User Input: "))
    if user_choice == 1:
        choice_name = "Rock"
    elif user_choice == 2:
        choice_name = "Paper"
    else:
        choice_name = "Scissors"
    print("You chose:", choice_name)

    # Computer Choice
    comp_choice = int(random.randint(1,3))
    if comp_choice == 1:
        computer_choice_name = "Rock"
    elif comp_choice == 2:
        computer_choice_name = "Paper"
    else:
        computer_choice_name = "Scissors"
    print ("Computer chose:", computer_choice_name)

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