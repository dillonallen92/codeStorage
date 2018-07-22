/*
    This is a test to building a 2D vector and then 2D physics engine, for darwyns project
*/

#include <iostream>
#include "Vector2d.h"

Vector2d a, b, c, d, f, q;


int main()
{
    std::cout << "Testing stuff" << std::endl;
    a = Vector2d(1,2);
    b = Vector2d(-1, 5);
    d = Vector2d(4, -2.5);
    q = Vector2d(1,2);
    f = a + d*2 + b;

    c = a + b;
    std::cout << "X component of a is: " << a.x << " and Y is: " << a.y << std::endl;
    std::cout << "X of b is : " << b.x << " Y is : " << b.y << std::endl;
    std::cout << "Vector addition of c gives us an X of : " << c.x << " and Y of : " << c.y << std::endl;

    std::cout << "Dot product of a*b is : " << Vector2d::Dot(a,b) << std::endl;
    std::cout << "The angle between the two vectors is: " << Vector2d::AngleBetween(a,b) << " degrees" << std::endl;   
    std::cout << "Testing the superposition principle: a + b + d: (" << f.x << "," << f.y << ")\n";
    
}