#include <stdio.h>
// timing library and functions
#include <time.h>
// math library
#include <math.h>

int power2( int num, int power );
int power2notasm( int num, int power );
int addtwonums ( int num1, int num2);
int multwonums( int num1, int num2);

int main( void )
{
    clock_t t1, t2;

    // Assembly Code

    t1 = clock();
    printf_s( "3 times 2 to the power of 20 is %d\n", \
              power2( 3, 20) );
    t1 = clock() - t1;
    double time_taken1 = ((double)t1)/CLOCKS_PER_SEC;
    printf("Assembly took %lf seconds to execute\n ", time_taken1);
    
    printf("----------------------------\n");

    // Non-Assembly Code

    t2 = clock();
    printf("3 times 2 to the power of 20 is %d\n", power2notasm( 3, 20));
    t2 = clock() - t2;
    double time_taken2 = ((double)t2)/CLOCKS_PER_SEC;
    printf("Non-Assembly took %lf seconds to execute\n ", time_taken2);

    printf("---------------------------\n");
    printf("The sum of 6 and 4 is: %d \n", addtwonums(6,4));
    printf("---------------------------\n");
    printf("The product of 6 and 4 is: %d \n", multwonums(6,4));
    
}

int power2( int num, int power )
{
   __asm
   {
      mov eax, num    ; Get first argument
      mov ecx, power  ; Get second argument
      shl eax, cl     ; EAX = EAX * ( 2 to the power of CL )
                      ; CL is the counter interator for ecx
   }
   // Return with result in EAX
}

int power2notasm( int num, int power)
{
    int ans = num * pow(2, power);
    return ans;
}

int addtwonums( int num1, int num2)
{
    __asm
    {
        mov eax, num1
        mov ecx, num2
        add eax, ecx
    }
}

int multwonums( int num1, int num2)
{
    __asm
    {
        mov eax, num1
        mov ecx, num2
        imul eax, ecx
    }
    
}