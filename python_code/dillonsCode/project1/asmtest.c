#include <stdio.h>

int poweroftwo( int num, int power);

int main(void)
{
    float num, power;
    printf("Power of two: %d\n", poweroftwo( 2, 3 ));
}

int poweroftwo( int num, int power)
{
    int output;
    __asm__(" mov %%1, %%eax;"
            " mov %%2, %%ecx;"
            " shlw %%cl, %%eax;" : "=r"(output) : "a" (num), "c" (power));
        return output;
}