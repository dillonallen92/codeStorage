#include <iostream>

// structures
struct Vector{
    int sz;
    double* elem;

    void vector_init(Vector& v, int s);
};

void vector_init(Vector& v, int s)
{
  v.elem = new double[s];
  v.sz = s;
}

double square(double x)
{
    return x*x;
}

void copy_fct()
{
    int v1[10] = {0,1,2,3,4,5,6,7,8,9};
    int v2[10];

    for(auto i = 0; i!=10; i++)
    {
	     v2[i] = v1[i];
    }
}

void printSquare(double x)
{
    std::cout << "The square of " << x << " is " << square(x) << std::endl;
}

int main()
{
    printSquare(4);
}
