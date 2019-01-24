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

template <class T1, class T2, class T3>
class Student
{
private:
    T1 score1;
    T2 score2;
    T3 score3;
    std::string studentName;
    float w1 = 0.2;
    float w2 = 0.2;
    float w3 = 0.6;
public:
    Student(std::string name, T1 s1, T2 s2, T3 s3);
    std::string getName();
    T1 getScore1();
    T2 getScore2();
    T3 getScore3();
    float weightedAverage();
};

int main()
{
    Student<double, float, int> john("john", 63.7, 43.4, 70);
    std::cout << "Student name is: " << john.getName() << "\n";
    std::cout << john.getName() << "'s test score 1 is: " << john.getScore1() << "\n";
    std::cout << john.getName() << "'s test score 2 is: " << john.getScore2() << "\n";
    std::cout << john.getName() << "'s test score 3 is: " << john.getScore3() << "\n";
    std::cout << john.getName() << "'s weighted test average is: " << john.weightedAverage() << "\n"; 
    return 0;
}

template <class T1, class T2, class T3>
Student<T1, T2, T3>::Student(std::string name, T1 s1, T2 s2, T3 s3)
{
    studentName = name;
    (s1 < 0) ? (score1 = 0) : (score1 = s1);
    (s2 < 0) ? (score2 = 0) : (score2 = s2);
    (s3 < 0) ? (score3 = 0) : (score3 = s3);
}

template <class T1, class T2, class T3>
std::string Student<T1, T2, T3>::getName()
{
    return (studentName);
}

template <class T1, class T2, class T3>
T1 Student<T1, T2, T3>::getScore1()
{
    return (score1);
}

template <class T1, class T2, class T3>
T2 Student<T1, T2, T3>::getScore2()
{
    return (score2);
}

template <class T1, class T2, class T3>
T3 Student<T1, T2, T3> :: getScore3()
{
    return (score3);
}

template <class T1, class T2, class T3>
float Student<T1, T2, T3>::weightedAverage()
{
    return( w1*score1 + w2*score2 + w3*score3);
}