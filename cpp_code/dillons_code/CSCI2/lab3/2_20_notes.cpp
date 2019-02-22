// Notes for CSCI 2 on 2/20/2019
// Notes on List

#include <iostream>
#include <string>
#include <list>

class superList 
{
private:

public:
    superList();
    void pushback();

};

int main()
{

    std::list<std::string> x;
    std::list<std::string>::iterator it;

    x.push_back("hello");
    x.push_back("world");
    x.push_back("yolo");
    

    std::cout << "myList contains: " << std::endl;
    for (it = x.begin(); it != x.end(); it++)
    {
        std::cout << *it << std::endl;
    }


    return 0;
}