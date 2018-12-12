
# Imports

# Globals

def optionOne():
    print("option One")

def optionTwo():
    print("option Two")

def optionThree():
    print("option Three")

def main():
    print("Machine Learning Command Line Interface")
    print("1. Option 1")
    print("2. Option 2")
    print("3. Option 3")

    userInput = input("What would you like to do? ")

    if ( userInput == "1" ) :
        optionOne()
    if ( userInput == "2" ) :
        optionTwo()
    if ( userInput == "3" ):
        optionThree()

# Main statement here to start the program

if __name__ == '__main__':
    main()