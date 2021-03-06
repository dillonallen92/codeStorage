#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int main()
{
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    int n;
    cin >> n;
    vector<string> g(n);
    for(int i = 0; i < n; i++)
    {
        cin >> g[i];
    }
    for(string s : g){
        if(s.length() > 10)
        {
            int len = s.length();
            cout << s[0] << len-2 << s[len-1] << "\n";
        }else{
            cout << s << "\n";
        }
    }
}