#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

void printVector(vector<int> v, int size);

// user defined structs section
struct P 
{
    int x, y;
    bool operator < (const P &p)
    {
        if (x!=p.x) return x < p.x;
        else return y < p.y;
    }
};


int main()
{
    vector<int> v = {4,2,5,3,5,8,3};
    printVector(v, 7);
    sort(v.begin(), v.end());
    cout << "Sorting... " << "\n";
    printVector(v, 7);
}

void printVector(vector<int> v, int size)
{
    for(int i = 0; i < size; i++)
    {
        cout << v[i] << " ";
    }
    cout << "\n";
}