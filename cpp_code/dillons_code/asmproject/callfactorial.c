#include <stdio.h>

int factorial(int n);

int main()
{
    for (int i = 0; i < 20; i++)
    {
        printf("factorial(%d) = %d\n", i, factorial(i));
    }
    return 0;
}