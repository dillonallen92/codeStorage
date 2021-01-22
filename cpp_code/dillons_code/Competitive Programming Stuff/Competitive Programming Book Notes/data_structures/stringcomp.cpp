#include <iostream>
#include <string>

int main()
{
    std::string a = "adrian";
    std::string b = "Adrian";
    bool asdf = b < a;
    std::cout << asdf << "\n";
    asdf = a < b;
    std::cout << asdf << "\n";

    /*
    Adrians code

    asdf = "Adrian" < "adrian"; (should return 1 but returns 0)
    asdf = "adrian" < "Adrian"; (depending if it was written first, will be 0 or 1)
    char*
    dword asx, esx comp leq
    */



    return 0;
}