#include <iostream>
#include <string>

std::string userName()
{
  std::string userName = "";
  std::cout << "Enter your username to log in: ";
  std::getline(std::cin, userName);
  return userName;
}

int main()
{
  std::cout << std::endl << std::endl;
  std::cout << "First check to see if hello world works..." << std::endl;
  std::cout << "Now testing to see if the userName function works..." << std::endl;

  std::string newUser = "";
  newUser = userName();

  std::cout << "Your username is: " << newUser << std::endl;
  std::cout << "Entering Terminal..." << std::endl << std::endl;

  std::string myUserName = newUser;

  while(1){
    std::string userInput = "";
    std::cout << myUserName << " > ";
    std::getline(std::cin, userInput);
    std::cout << std::endl;
    std::cout << "Your entered the command: " << userInput << std::endl;
    if (userInput == "break")
      break;
  }
}
