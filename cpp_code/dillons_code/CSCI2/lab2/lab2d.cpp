#include <iostream>
#include <string>

void printArr(int* arr, int size);
void deleteElement(int* arr, int index, int size);

int main()
{
	const int size = 6;
	int arr[size]{ 10,20,30, 40, 50, 70 };

	int* a = arr;
	std::cout << "Initial Array \n";
	printArr(a, size);
	std::cout << "Performing the first delete: \n";
	deleteElement(a, size-1, size);
	printArr(a, size);
	std::cout << "Performing another delete: \n";
	deleteElement(a, 3, size);
	printArr(a, size);
	std::cout << "Display the shifted array with the 0 values\n";
	printArr(a, size);
	system("pause");
	return 0;
}


void printArr(int* arr, int size)
{
	for (int i = 0; i < size; i++ )
		std::cout << *(arr + i) << std::endl;
}

void deleteElement(int* arr, int index, int size)
{
	// std::cout << "Now deleting element in location: " << index << "\n";
	if (index > size - 1)
		std::cout << "Invalid index" << std::endl;
	for (int j = index; j < size; j++)
		*(arr + j) = *(arr + j + 1);
	*(arr + size - 1) = NULL;
}