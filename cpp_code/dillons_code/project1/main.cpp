/*
    This is a test to building a 2D vector and then 2D physics engine, for darwyns project
*/

#include <iostream>
#include "Vector2d.h"

Vector2d a, b;


int main()
{
    std::cout << "Testing stuff" << std::endl;
    a = Vector2d(1,2);

    std::cout << "X component of a is: " << a.x << " and Y is: " << a.y << std::endl;

}