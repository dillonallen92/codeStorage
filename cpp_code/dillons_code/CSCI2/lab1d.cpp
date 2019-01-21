/*
    Test Score Class Template lab1d
    Dillon Allen

    Task: 
    Design a test scores class template that has member variables to hold student name, three test scores, 
    and associated weights, i.e Weighted average = weight1*T1 + weight2*T2 + weight3*T3.
    Example: weightedAvg = 0.20(85.5) + 0.20(83) + 0.60(96) = 91.3
    The weights are always floats, but the test scores could be of type int, float, or double. 
    The class template should have a constructor, accessor methods, and weighted average method. 
    Do not allow for negative values and demonstrate the class usage in a main function with no user interaction.
*/ 

#include <iostream>
#include <string>

template < class T1 ,class T2, class T3, class T4>
class Student
{
private:
    T2 score1;
    T3 score2;
    T4 score3;
    T1 studentName;
    float w1 = 0.2, w2 = 0.2 , w3 = 0.6;
public:
    Student(T1, T2, T3, T4);
    T1 getName();
    T2 getScore1();
    T3 getScore2();
    T4 getScore3();
    float weightedAverage();
};

int main()
{
    Student< std::string, double, double, double> john("john", 63.0, 43.0, 70.1);
    std::cout << "Student name is: " << john.getName() << "\n";
    std::cout << john.getName() << "'s test score 1 is: " << john.getScore1() << "\n";
    std::cout << john.getName() << "'s test score 2 is: " << john.getScore2() << "\n";
    std::cout << john.getName() << "'s test score 3 is: " << john.getScore3() << "\n";
    std::cout << john.getName() << "'s weighted test average is: " << john.weightedAverage(); 
    return 0;
}

template <class T1, class T2, class T3, class T4>
T1 Student<T1, T2, T3, T4>::getName()
{
    return (studentName);
}

template <class T1, class T2, class T3, class T4>
T2 Student<T1, T2, T3, T4>::getScore1()
{
    return (score1);
}

template <class T1, class T2, class T3, class T4>
T3 Student<T1, T2, T3, T4>::getScore2()
{
    return (score2);
}

template <class T1, class T2, class T3, class T4>
T4 Student<T1, T2, T3, T4> :: getScore3()
{
    return (score3);
}

template <class T1, class T2, class T3, class T4>
float Student<T1, T2, T3, T4>::weightedAverage()
{
    T2 t1 = score1;
    T3 t2 = score2;
    T4 t3 = score3;
    return ((w1*t1 + w2*t2 + w3*t3));
}