#include "Vector2d.h"
#include <cmath>
#include <cfloat>

    float x,y;


    // Default constructor
    Vector2d::Vector2d()
    {
        x = 0.0;
        y = 0.0;
    }

    // Constructor with actual values
    Vector2d::Vector2d(float pX, float pY)
    {
        x = pX;
        y = pY;
    }

    // Operators
    Vector2d Vector2d::operator+(const Vector2d&a) const
    {
        return Vector2d(x + a.x, y + a.y);
    }

    Vector2d Vector2d::operator-(const Vector2d&a) const 
    {
        return Vector2d(x - a.x, y - a.y);
    }
    
    /*
        TODO: Fix this equality statement 
    */
    bool Vector2d::operator==(const Vector2d&a) const 
    {
        (x == a.x && y == a.y) ? true : false;
    }

    Vector2d Vector2d::operator-() const 
    {
        return Vector2d(-x, -y);
    }

    Vector2d Vector2d::operator*(const float& c) const 
    {
        return Vector2d(c*x , c*y);
    }

    Vector2d Vector2d::operator/(const float& c ) const 
    {
        return Vector2d(x/c, y/c);
    }

    // Dot Product
    float Vector2d::Dot(const Vector2d&a, const Vector2d&b)
    {
        return (a.x*b.x + a.y*b.y);
    }

    // Norm
    float Vector2d::Norm(const Vector2d&a)
    {
        return (sqrt(pow(a.x, 2) + pow(a.y,2)));
    }

    // Unit Vector
    Vector2d Vector2d::UnitVector(const Vector2d&a)
    {
        float norm = Norm(a);
        return Vector2d(a.x / norm, a.y / norm);
    }

    // Angle Between (Will return in degrees)
    float Vector2d::AngleBetween(const Vector2d&a, const Vector2d&b)
    {
        float dot = Dot(a,b);
        float normA = Norm(a);
        float normB = Norm(b);
        return ((acos(dot / (normA * normB)))* 180 / M_PI);
    }
