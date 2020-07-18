CPP



**Namespace**
To solve naming conflicts, we use namespace::name to identify something.

std::cout

Notice: court is an object, which is made by ostream.

It a bad idea to add
using namespace std;
to set std as the default one.

You can add
using std::cout;
to omit some specific namespace to reduce both naming conflicts and input complexity.


**cmath**

pow(a,b)      //a^b
NAN
INFINITY
-INFINITY
remainder(10,3)   //1
10%3     //1
10%3.25  //THIS does not work!!
//use remainder(10, 3.25) instead
//fmod(a,b) is very similar to remainder()
fmax(10, 3.25) 
fmin(25.2, 100)
ceil(2.2)    //3
floor(-1.5)    // -1   go to the smaller integer
trunc(-1.5)    //-2    cut off the decimal part
round(-1.5)    //-2
round(-1.49)    //-1
.......



**Constant**

const int x = 5;
//cannot change the value again

#define X 10
// this is in C

enum { y = 100 }
//cannot change value of y later on




**floating point**
float a = 10.0/3;
a = a * 10000000;
double b = 77000; // you can also put in 7.7E4
long double c;

cout << std::fixed << a << std:endl;
//3333333188608.00000
//floats are the least trust worthy
//use Double as posible as you can



**bool**
bool a = 0;
0 is false, and all other values are considered as true.
cout << a << std::endl;   this will print 0
cout << std::boolalpha << a << std::endl;    this will print false



**Escape Sequence**
\t tab
\n newline 其实应该叫回车换行。换行只是换一行，不改变光标的横坐标；回车只是回到行首，不改变光标的纵坐标。
\d delete a char
\v vertical tab   this works for a printer
\a bell
\0 null    use to tell if a string ends


**Char**

8bits
(int) 'A' -----> 65

ASCII
Unicode


**Itegral Data Type & Signed vs Unsigned**

short a;
int b;
long c;
long long d;

unsigned short aa;
unsigned int bb;
unsigned long cc;
unsigned long long dd;

cout << sizeof(long long) << std::endl;
cout << LLONG_MIN << std::endl;
cout << ULLONG_MAX << std::endl;



**std::cin**

using std::cin;
int slices;
std::cout << "How many do you want: ";
cin >> slices;

cin is an object of istream
cout is an object of ostream

**std::cout**
int slices = 10;
std::cout << "You have " << slices << " pieces of pizza." << std::endl;


**Operators**
They work will operants.
std::cout<< "Hello World";
std::cout and "Hello World" are operants.

In C++, we can customize the operators to do whatever we want them to.





**string**

#include <string>

// in C++
std::string greeting = "hello";
std::cout << greeting[0] << std::endl;    //h
//which you want to get the char in the string by indices
//add std:: before string

//the default value for a string is ""
//which is an empty string

complete_greeting = greeting + " there"   -----> "hello there"
complete_greeting += "!"  -----> "hello there!"
greeting.length()   ----> the length of it



//in C

char name[] = "Caleb"   //it's actually an array "Caleb\0"

name = "aaaaaa"    //you can do it! it exceeds the length of the array



**get string input**

//cin only grab the first word!
//it stops when it reaches a space

std::string greeting;
getline(std::cin, greeting);

cin.getline()
//use this one for numbers



**search a string**

std::string greeting = "What the hell?";
greeting.replace(greeting.find("hell"), 4, "****");
std::cout << substr(5, 2) << std::endl;
std::cout << greeting.find_first_of("arrest") << std::endl;    //2

std::cout << greeting.find_first_of("!") << std::endl;    //npos which is not found which equals to -1
//npos == -1 ----> not  found

if(greeting.compare("What the hell?" == 0) {
std::cout << "Equals" << std::endl;
}    // in c++ compare works by comparing values, not like Java which compares by looking if both objects hold the same thing.

std::string::compare() returns an int:

equal to zero if s and t are equal,
less than zero if s is less than t,
greater than zero if s is greater than t.

!greeting.compare(What the hell?) equals 1, so if you put it in if(), it's equivalent to true.




**string modifier members**

std::string greeting = "Hello";

greeting.length()
greeting.size()    // these two give you the length


std::string greeting = "Hello";
greeting.insert(3,"             ");    //insert it to index 3, others get pushed back
greeting.erase(3, 1);    // start from index 3 then delete one character
greeting.erase(greeting.length() -1);    //delete the last char
greeting.pop_back(); //remove one char at the end
greeting.replace(0, 4, "Heaven")    //replace the first 4 chars with Heaven


**constant**
char since it's in unicode or askii

5U //unsigned int
auto x = 5U;    // it will look at the value and assign the datatype
x = "this is a string";
auto x = 5ULL;    //long long int 
auto x = 5.0;    //double
auto x = 5.0L;    // long double
auto x = 5.0F;    //float

//Notice that this is a c++11 feature



**Precedence of operators**

double x;
double y;
x = 10;
(y = x) = 100;    //y = x;   y = 100;
// By default, it goes right to left for = operator
//But not in this case since the grouping works
std::cout << x << "\t" << y << std::endl;    // 10    100

**Hex and Octal**

int number = 30;
std::cout << number << std::endl;

int number = 0x30; // from hex to decimal  48
int number = 030;  // from octal to dec 24

int number = 30;
std::cout << std::hex << number <<std::endl;
std::cout << std::oct << number <<std::endl;




**function prototype**

have to write at least the function prototype to ensure the compiling.
you can add the body part later on.

**Include**
#include <libname>
#include "libname.h"

**Operator and Operants**

int x = 10/4;     //2 since it's integer division
double x = 10/4    //2
double x = 10. / 4;

double x = 10 % 4    //2



