```C++
#include <iostream>
#include <fstream>
#include <string>
#include <vector>

int main()
{
  std::cout << "Hello World" << std::endl;
  const double PI = 3.1415926;
  char myGrade = 'A';
  bool isHappy = true;
  float favNum = 3;
  int myAge = 80;
  // short int, long int, unsigned int
  std::cout << "Size of int" << sizeof(myGrade) << std::endl;
 
  string numberGuessed;
  int intNumberGuessed = 0;
  do
  {
    std::cout << "Guess between 1 and 10: ";
    getline(cin, numberGuessed);
    intNumberGuessed = stoi(numberGuessed);
  } while(intNumberGuessed != 4);
  
  string birthdayString = "Birthday";
  char* happyArr = "Happy";
  std::cout << "hello" << yourName << std::endl;
  std::cout << happyArr + birthdayString << std::endl;
  string yourName;
  std::cout << "What is your name?" << std::endl;
  getline(cin, yourName);
  std::cout << yourName << std::endl;
  
  //stoi(), stod()
  
  //str.size()  str.empty()   str.append(str2)   str.compare(str2) str.assign(str2)   str.assign(str2, 0, 5)   str.find("str1", 0) returns the starting index of the substring
  
  //str.insert(5, "Justin")
  //str.erase(int startPoint, int len)
  //str.replace(int startPoint, int len, "The string your want to replace")
  
  
  vector <int> lotteryNumVect(10);
  int lotteryNumArray[5] = {3, 4, 1, 9, 0};
  
  
  
  return 0;
}
```