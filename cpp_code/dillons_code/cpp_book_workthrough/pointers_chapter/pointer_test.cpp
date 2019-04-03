#include <iostream>

// function prototypes
void function1(int a);
void function2(int b);
void function3(int c);

int main()
{
  /*
  int a;
  int* aPtr;

  a = 7;
  aPtr = &a; // set equal to the address of a

  // this shows that the value of aPtr is really the address of a
  printf("\nThe address is of is %p\nThe value of a is %p\n", &a, aPtr);

  // access values of the pointer by dereferencing *
  printf("\nThe value held by a is %d\nThe value pointed to is %d\n", a, *aPtr);
  */

  // Initialize an array of 3 pointers to functions
  void(*f[3])(int) = {function1, function2, function3};

  int choice = 0;

  printf("Enter a number between 0-2, 3 to end: ");
  scanf("%d", &choice);

  while( choice >= 0 && choice < 3)
  {
    (*f[choice])(choice);
    printf("Enter a number between 0-2, 3 to end: ");
    scanf("%d", &choice);
  }

  printf("Program execution completed.\n");

  return 0;

}

void function1(int a)
{
  printf("You entered %d so function1 was called\n", a);
}

void function2(int b)
{
  printf("You entered %d so function2 was called\n", b);
}

void function3(int c)
{
  printf("You entered %d so function3 was called\n", c);
}
