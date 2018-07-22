#ifndef PHYSICS2D_H
#define PHYSICS2D_H

#include "Vector2d.h"

Vector2d positionVector(const float&x, const float&y);

Vector2d initVelocity(const float&x, const float&y);

Vector2d updatedPosition(const Vector2d&x, const Vector2d&v, const float&t);

Vector2d updatedPosition_a(const Vector2d&x, const Vector2d&v, const Vector2d&a, const float&t);

Vector2d weightVector(const float&m, const Vector2d&a);

Vector2d accelerationVector(const float&m, const Vector2d&F);

Vector2d angledWeight(const float&m, const float&a);

float WorkDone(const Vector2d&F, const Vector2d&d);


#endif