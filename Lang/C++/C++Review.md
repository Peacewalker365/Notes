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

- Difference between free() and delete
  1. free() is a function in a library, while delete is an operator
  2. free() de-allocate the memory, while delete will also call the destructor function
  3. detele is faster since operator is faster than calling a function

- The length of memory that pointers indicate

  1. ```c++
     int* func()
     {
       int arr[100] = {0};
       int* ptr = arr;
       return ptr;
     }
     //The func return a pointer containing only the beginning address of the arr, there is not no info about the length
     int* func()
     {
       int* ptr = (int*)malloc(100 * sizeof(int));
       return ptr;
     }
     //The malloc function will store some bytes of extra info in the allocated memory including the length
     ```

  2. So if the ptr points to a memory created by malloc(), then length = `sizeof(ptr) / sizeof(type)`

- Polymorphism

  1. ```c++
     class Animal
     {
       public:
       void print()
       {
         std::cout << "I'm a/an animal!" << std::endl;
       }
     }
     
     class Dog:public Animal
     {
       public:
       void print()
       {
         std::cout << "I'm a/an dog!" << std::endl;
       }
     }
     
     class Spot:public Dog
     {
       public:
       void print()
       {
         std::cout << "I'm a/an spot!" << std::endl;
       }
     }
     ```

  2. If `Animal ptr = new Animal` and call the function, it will run the print() of Animal class.

  3. If `Animal ptr = new Dog` and call the function, it will run the print() of Animal class.

  4. If `Dog ptr = new Dog` and call the function, it will run the print() of Dog class.

  5. 2 3 4 happens because the the compiler knows the types of the object from the type of the pointer.

  6. If `Animal ptr = new Animal` and call the function and the print() of Animal is `virtual`, it will run the print() of Animal class.

  7. If `Animal ptr = new Dog` and call the function and the print() of Animal is `virtual`, it will run the print() of Dog class.

  8. If `Animal ptr = new 。spot` and call the function and the print() of Animal is `virtual`, it will run the print() of Spot class.

  9. **1 成员函数重载特征：**
       a 相同的范围（在同一个类中）

       b 函数名字相同

       c 参数不同

       d virtual关键字可有可无

     2 **重写（覆盖)**是指派生类函数覆盖基类函数，特征是：

       a 不同的范围，分别位于基类和派生类中

       b 函数的名字相同

       c 参数相同

       d 基类函数必须有virtual关键字

     3 **重定义(隐藏)**是指派生类的函数屏蔽了与其同名的基类函数，规则如下：

       a 如果派生类的函数和基类的函数同名，但是参数不同，此时，不管有无virtual，基类的函数被隐藏。

       b 如果派生类的函数与基类的函数同名，并且参数也相同，但是基类函数没有vitual关键字，此时，基类的函数被隐藏。（如果父类的成员和子类的成员属性名称相同，我们可以通过作用域操作符来显式的使用父类的成员，如果我们不使用作用域操作符，默认使用的是子类的成员属性。）

     **虚函数作用及上三条总结**

     **基类和子类都有同一个函数，定义一个\**基类指针\**指向子类对象，用指针调用该函数，如果函数为非虚则调用基类函数，否则调用子类函数（第2条）。若指针与指向对象相同，则各自调用各自的函数（子类时第3条）。**

     **《C++ Primer》第五版，P537 页：“当我面在派生类中覆盖某个虚函数时，可以再一次使用virtual关键字指出该函数的性质。然而这么做并非必须，因为一旦某个函数被声明为虚函数，则在所有派生类中它都是虚函数”**

     ***\*C++的多态性\****用一句话概括就是：在基类的函数前加上virtual关键字，在派生类中重写该函数，运行时将会根据对象的实际类型来调用相应的函数。如果对象类型是派生类，就调用派生类的函数；如果对象类型是基类，就调用基类的函数



- 虚继承
  - [虚继承详解](https://www.cnblogs.com/BeyondAnyTime/archive/2012/06/05/2537451.html)

- 内存对齐 Memory Alignment
  - [C/C++内存对齐详解](https://zhuanlan.zhihu.com/p/30007037)

- Template
  1. [typename和class在模版语法中的区别](https://www.runoob.com/note/12729)
  2. 



- Inline
  - [内联函数 看后半部分](https://zhuanlan.zhihu.com/p/50812510)

