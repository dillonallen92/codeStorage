#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

// this section is going to cover three implementations of the
// max subarray sum

// The three algorithms will be of O(n^3), O(n^2), and O(n)
// time complexity

int sol1(int arr[], int size);
int sol2(int arr[], int size);
int sol3(int arr[], int size);

int main()
{

    int arr[] = {-1, 2, 4, -3, 5, 2, -5, 2};
    int size = 8;
    cout << "The max subarray sol1 sum is: " << sol1(arr,8) << "\n";
    cout << "Sol2 sum is: " << sol2(arr, 8) << "\n";
    cout << "Sol3 sum is: " << sol3(arr, 8) << "\n";
}

int sol1(int arr[], int size)
{
    int best = 0;
    int MAX_SIZE = size;
    for(int i = 0; i < MAX_SIZE; i++)
    {
        for(int j = i; j < MAX_SIZE; j++)
        {
            int sum = 0;
            for (int k = i; k<=j; k++)
            {
                sum += arr[k];
            }
            best = max(best, sum);
        }
    }

    return best;
}

int sol2(int arr[], int size)
{
    int best = 0;
    for (int i = 0; i < size; i++)
    {
        int sum = 0;
        for (int j = i; j < size; j++)
        {
            sum += arr[j];
            best = max(best, sum);
        }
    }
    return best;
}

int sol3(int arr[], int size)
{
    int best = 0, sum = 0;
    for(int i = 0; i < size; i++)
    {
        sum = max(arr[i], sum + arr[i]);
        best = max(best, sum);
    }
    return best;
}