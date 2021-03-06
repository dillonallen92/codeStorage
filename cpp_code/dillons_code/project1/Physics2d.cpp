#include "Vector2d.h"
#include "Physics2d.h"
#include <cmath>
#include <cfloat>

// Vector for gravity in just y
Vector2d g = Vector2d(0,-9.81);

/* 
    Added position and init velocity just for completion
    These are just Vector2d instances, nothing special
*/

Vector2d positionVector(const float&x, const float&y)
{
    return Vector2d(x,y);
}

Vector2d initVelocity(const float&x, const float&y)
{
    return Vector2d(x,y);
}

Vector2d updatedPosition(const Vector2d&x, const Vector2d&v, const float &t)
{
    return (x + v*t);
}

Vector2d updatedPosition_a(const Vector2d&x, const Vector2d&v, const Vector2d&a, const float&t)
{
    return (x + v*t + a* pow(t, 2));
}

// This uses mass and multiplies it by gravity going down on the y
Vector2d weightVector(const float&m)
{
    return g*m;
}

// This computes the acceleration vector from a force vector
Vector2d accelerationVector(const float&m, const Vector2d&F)
{
    return (F / m);
}

// This takes the weight on a flat surface and gives it an incline, for basic incline problems
Vector2d angledWeight(const float&m, const float&a)
{
    Vector2d W = weightVector(m);
    return Vector2d(W.x*cos(a), W.y*sin(a));
}

// This calculates work done over a distance d
float WorkDone(Vector2d&F, const Vector2d&d)
{
    return (Vector2d::Dot(F,d));
}

