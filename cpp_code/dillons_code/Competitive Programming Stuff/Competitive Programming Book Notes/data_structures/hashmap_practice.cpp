

// This program is being used to practice the concept of 
// hashmaps before I try the next AlgoExpert problem
// NOTE: This is not a valid solution because unordered_map
//       does not consider order, so the solution is wrong
//       I basically completed a frequency counter lol

#include <iostream>
#include<unordered_map>
#include <vector>
#include <algorithm>

using namespace std;

bool isValidSubsequence(vector<int> array, vector<int> sub);
void printUnorderedMap(vector<int> array);

int main()
{
    vector<int> sequence = {1,2,3,4,5,6};
    vector<int> subsequence = {1,2,3,6, 20};

    // the implementation should return true
    if(isValidSubsequence(sequence, subsequence))
        cout << "It is a valid subsequence" << "\n";
    else
    {
        cout << "It is not a valid subsequence" << "\n";
    }
    return 0;
}

void printUnorderedMap(vector<int> array)
{
    std::unordered_map<int, int> um;
    for(int i : array)
    {
        if(um[i] != 0)
        {
            um[i] ++;
        }else
        {
            um[i] = 1;
        }
    }
    for(auto elm : um)
    {
        cout << elm.first << " " << elm.second << "\n";
    }
}

bool isValidSubsequence(vector<int> array, vector<int> sub)
{
    // first I will push everything into an unordered map
    std::unordered_map<int, int> m;
    for(int i : array)
    {
        if(m[i] != 0)
        {
            m[i]++;
        }else
        {
            m[i] = 1;
        }
    }

    for(int i : sub)
    {
        if(m[i] != 1)
        {
            return false;
        }
    }

    return true;
}

