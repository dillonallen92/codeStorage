/*
    This template for a 2D vector class was taken from a code review sample online, will modify what is needed
*/

#ifndef Vector2d_H
#define Vector2d_H


class Vector2d
{
public:

    float x,y;

    Vector2d();
    Vector2d(float, float);

    // Arithmetic Operations
    Vector2d operator+(const Vector2d&) const;
    Vector2d operator-(const Vector2d&) const;

    // Boolean Comparison
    bool operator==(const Vector2d&) const;

    // Make the vector totally negative
    Vector2d operator-() const;

    // Scalar Operations
    Vector2d operator* (const float&) const;
    Vector2d operator/ (const float&) const;

    // Dot Product
    static float Dot(const Vector2d&, const Vector2d&);

    // Norm and UnitVector
    static float Norm(const Vector2d&);
    static Vector2d UnitVector(const Vector2d&);

    // Angle Between
    static float AngleBetween(const Vector2d&, const Vector2d&);
};

#endif