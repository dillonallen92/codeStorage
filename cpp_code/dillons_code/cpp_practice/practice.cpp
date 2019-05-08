#include <iostream>

class Fraction
{
public:
  
  Fraction(int a, int b);
  void setNum(int a);
  void setDenom(int b);
  int getNum();
  int getDenom();
  void add(Fraction y);
private:
  
  int num, denom;
  
};

int main()
{
  Fraction myFrac = Fraction(1,2);
  Fraction secondFrac = Fraction(1,3);
  std::cout << "Hello world!\n";
  std::cout << "The first fraction is: " << myFrac.getNum() <<"/" << myFrac.getDenom()<< "\n";
  std::cout << "The second fraction is: " << secondFrac.getNum() <<"/"<<secondFrac.getDenom()<< "\n";
  myFrac.add(secondFrac);
  std::cout << "The Fraction sum is: " << myFrac.getNum() << "/" << myFrac.getDenom() << "\n";
  
  return 0;
}

Fraction::Fraction(int a, int b)
{
  setNum(a);
  setDenom(b);
}

int Fraction::getNum()
{
  return num;
}

int Fraction::getDenom()
{
  return denom;
}

void Fraction::setNum(int a)
{
  num = a;
}

void Fraction::setDenom(int b)
{
  denom = b;
}

void Fraction::add(Fraction y)
{
  int newNum, newDenom;
  newNum = num * (y.getDenom()) + ((y.getNum())*denom);
  newDenom = (denom*y.getDenom());
  setNum(newNum);
  setDenom(newDenom);
}