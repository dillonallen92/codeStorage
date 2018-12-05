#include <stdio.h> 
int sum( int val1, int val2);
int mult( int val1, int val2);

int main(void)
{
	int op1 = 50;
	int op2 = 70;

	printf("%d + %d = %d\n", op1, op2, sum(op1, op2));
	printf("%d * %d = %d\n", op1, op2, mult(op1, op2));
	return 0;
}

int sum( int val1, int val2)
{
	int c = 0;
	__asm__(" movl %2, %%eax;"
			" addl %1, %%eax;"
			" movl %%eax, %0;"
			:"=r"(c)
			:"r"(val1),"r"(val2)
			:"%rax"
			);
	return c;
}

int mult( int val1, int val2)
{
	int c = 0;
	
	__asm__(" movl %2, %%eax;"
			" imul %1, %%eax;"
			" movl %%eax, %0;"
			:"=r"(c)
			:"r"(val1), "r"(val2)
			);
	
	return c;
}

