#include <iostream>
#include <stdlib.h>
#include <array>

int main()
{
  static const int N = 1000;
  int i, p, q, id[N], j;
  
  for(i = 0; i < N; i ++)
  {
    id[i] = i;
  }
  
  /*
  while(std::cin >> p >> q)
  {
    int t = id[p];
    if (t == id[q])
    {
      continue;
    }
    
    for(i = 0; i < N; i++)
    {
      if(id[i] == t)
      {
        id[i] = id[q];
      }
      std::cout << " " << p << " " << q << "\n";
    }
  }
  */
  
  for(i = p; i != id[i]; i = id[i]) ;
  for(j = q; j != id[j]; j = id[j]) ;
  if( i == j ) continue;
  id[i] = j;
  std::cout << " " << p << " " << q << "\n";
  
  
}

