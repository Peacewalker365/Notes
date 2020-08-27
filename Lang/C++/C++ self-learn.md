# C++ self-learn

### gdb/lldb

### Key Words

- const

## New in C++

### String

#### basic

```c++
#include <string>
using namespace std;

int main()
{
  string str1;
  string str2 = "init";
  string str3("init");
  string str4{"init"};
  
  string str = "This is a test!";
  char c = str.at(0);
  str.substr(3,6) //s is a
  int thisIndex = str.find("This");
  str.replace(thisIndex, 4, "That");
  
  return 0;
}

```

#### cin and getline



### Type conversions

- implicit conversion
- `static_cast<type>(expression)`
  - `static_cast<int>(num1 + num2)`

### Boolean

```c++
#include <iostream>
using namespace std;

int main()
{
	bool isMale;
  int weight = 90;
  
  isMale = (weight >= 85);
  
  return 0;
}
```



### Default parameter values

```c++
#include <iostream>
using namespace std;

void DataPrint(string sex, string name, int age, printStyle = 0);

int main()
{
  DataPrint("male", "Jarvis", 28); //you can omit the params with default values!
//Notice that the params with default values must be continous from the last param
// void func(int a = 0, int b, int c ,int d = 0) is INCORRECT!
  
  return 0;
}
```

### Random numbers

```c++
#include <iostream>
#include <cstdlib>
#include <time>
using namespace std;

int main(){
  
  cout << rand() << endl;
  cout << RAND_MAX << endl;
  srand(time(0));
  
}
```



## Stream

### Input string stream

```c++
#include <iostream>
#include <sstream>
#include <string>
using namespace std;


int main() {
   string  userInfo = "Amy Smith 19"; // Input string
   istringstream inSS(userInfo);      // Input string stream
   string firstName;                  // First name   
   string lastName;                   // Last name
   int userAge;                       // Age
  
   // Parse name and age values from input string
   inSS >> firstName;
   inSS >> lastName;
   inSS >> userAge;


   // Output parsed values
   cout << "First name: " << firstName << endl;   
   cout << "Last  name: " << lastName << endl;
   cout << "Age: "        << userAge << endl;
 
   return 0;
}
```

#### Using getline() with string streams

```c++
/*
A common use of string streams is to process user input line-by-line. The program below reads in a line as a string and then extracts individual data items from the string. The getline() function reads an input line into a string, and inSS.str(lineString); uses the str() function to initialize the stream's buffer to string lineString. Afterwards, the program extracts input from inSS using >>. The statement inSS.clear(); is necessary to reset the state of the stream so that subsequent extractions start from the beginning of the input strings.
*/

#include <iostream>
#include <string>
#include <sstream>
using namespace std;

int main() {
   istringstream inSS;       // Input string stream
   string lineString;        // Holds line of text
   string firstName;         // First name
   string lastName;          // Last name
   int    userAge;           // Age
   bool   inputDone;         // Flag to indicate next iteration

   inputDone = false;
   
   // Prompt user for input
   cout << "Enter \"firstname lastname age\" on each line" << endl;
   cout << "(\"Exit\" as firstname exits)." << endl << endl;
   
   // Grab data as long as "Exit" is not entered
   while (!inputDone) {
      
      // Entire line into lineString
      getline(cin, lineString);
      
      // Copies to inSS's string buffer
      inSS.clear();
      inSS.str(lineString);
      
      // Now process the line
      inSS >> firstName;
      
      // Output parsed values
      if (firstName == "Exit") {
         cout << "   Exiting." << endl;
         
         inputDone = true;
      }
      else {
         inSS >> lastName;
         inSS >> userAge;
         
         cout << "   First name: " << firstName << endl;
         cout << "   Last  name: " << lastName << endl;
         cout << "   Age:        " << userAge   << endl;
         cout << endl;
      }
   }
   
   return 0;
}
```

#### Reaching the end of a string stream

```c++
/*
A programmer will not always know how much data exists in a user input string, so using multiple individual extractions (Ex: inSS >> data1; inSS >> data2;) is not useful for reading all of the input data. Input streams have a Boolean function called eof() or end of file that returns true or false depending on whether or not the end of the stream has been reached. An if statement or while loop can check if the end of input string stream has been reached by using the extraction operator. Ex: In the code
while (inSS >> data) {
   ...
}

the while statement implicitly calls inSS's eof() function, which returns false if more data exists in the string stream to be read and true if the end of string stream has been reached. When eof() returns false, inSS >> data resolves to true, causing the loop to continue. Conversely, when eof() returns true, inSS >> data resolves to false, meaning the end of the string stream has been reached, and the loop exits.
*/


#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int main() {
   istringstream inSS;      // Input string stream
   string lineString;       // Holds input string
   string data;
    
   cout << "Enter a list of names separated by spaces: ";
 
   // Entire line into lineString
   getline(cin, lineString);
   inSS.str(lineString);
 
   while (inSS >> data) {    
      cout << data << endl;
   }
 
   return 0;
}
```

#### Example: Phone number formats

```c++
/*
The example below reads in phone numbers in two different formats and then presents the phone numbers in a standard 10-digit format. American phone numbers include an area code (3 digits), central office code (3 digits), and station number (4 digits). The program uses an input string stream to read each portion of the phone number, the ios good() function to determine if the area code entered consists solely of integers, and two dummy characters to read and determine if valid phone number delimiters were used. If the area code does not contain solely integers or the delimiters are not valid, the string stream is placed into an error state, and an error message is output. The program outputs all valid phone numbers in a standardized format.
*/

#include <iostream>
#include <sstream>
#include <string>
using namespace std;

int main() {
   istringstream inSS;      // Input string stream
   string lineString;       // Holds line of text
   int    areaCode;         // Area code (3 digits)
   int    officeCode;       // Central office code (3 digits)
   int    stationNum;       // Station number (4 digits)
   char   dummyChar1;
   char   dummyChar2;
   bool   isValidNumber;
   
   cout << "Enter a 10-digit phone number (or -1 to exit):" << endl;
   getline(cin, lineString);
   
   while (lineString != "-1") {
      isValidNumber = false; // Set to false before extracting phone number
      dummyChar1 = ' '; // Reset dummy chars to character other than - and (
      dummyChar2 = ' ';

      // Copy input to inSS's string buffer
      inSS.clear();
      inSS.str(lineString);
      
      // Try extracting area code.
      inSS >> areaCode;
      if (inSS.good()) {
         // Number format should be ###-###-####
         inSS >> dummyChar1 >> officeCode >> dummyChar2 >> stationNum;
         
         if (inSS.eof() && dummyChar1 == '-' && dummyChar2 == '-') {
            isValidNumber = true;
         }
      }
      else {
         // Number format should be (###) ###-####

         // Clear inSS state, and try extracting with area code in ()
         inSS.clear();
         inSS >> dummyChar1 >> areaCode >> dummyChar2;
         if (inSS.good()  && dummyChar1 == '(' && dummyChar2 == ')') {
            // Extract office code, then -, and then station number
            inSS >> officeCode >> dummyChar1 >> stationNum;
            if (inSS.eof() && dummyChar1 == '-') {
               isValidNumber = true;
            }
         }
      }

      if (isValidNumber) {
         cout << "   Standardized format: (" << areaCode << ") "
              << officeCode << "-" << stationNum << endl << endl;
      }
      else {
         cout << "   Invalid phone number." << endl << endl;
      }
      
      // Get next user input
      getline(cin, lineString);
   }
   
   return 0;
}
```

### Output string stream

```c++

#include <iostream>
#include <string>
#include <sstream>
using namespace std;

int main() {
   ostringstream infoOSS;    // Output string stream
   string infoStr;           // Information string
   string firstName;         // First name
   string lastName;          // Last name
   int userAge;              // Age
   
   // Prompt user for input
   cout << "Enter \"firstname lastname age\": " << endl;
   cin >> firstName;
   cin >> lastName;
   cin >> userAge;
   
   // Write user input to string stream
   infoOSS << lastName << ", " << firstName;
   infoOSS << " " << userAge;
   
   // Appends (minor) to string stream if less than 21
   if (userAge < 21) {
      infoOSS << " (minor)";
   }
   
   // Extract string stream buffer as a single string
   infoStr = infoOSS.str();

   cout << "Information: " << infoStr << endl;
   
   return 0;
}
```

#### Example: Savings table

```c++
/*
The example below uses an output string stream to create a savings table. The ProduceSavingsTable() function has 3 parameters: the starting amount, the annual percentage rate, and number of years. ProduceSavingsTable() uses several manipulators like fixed, setprecision, and setw to create a table with an ostringstream and returns the table as a single string.

*/

#include <iostream>
#include <iomanip>
#include <string>
#include <sstream>
using namespace std;

string ProduceSavingsTable(double startAmount, double apr, int numYears) {
   // Column widths
   const int YEAR_COL_WIDTH = 5;
   const int BALANCE_COL_WIDTH = 10;
    
   ostringstream outSS;
   double interest;
   double balance = startAmount;
   int month;
   int totalMonths = numYears * 12;

   // Convert APR to monthly percentage rate and decimal number
   double mpr = apr / 12 * 0.01;
    
   // Display 2 decimal places
   outSS << fixed << setprecision(2);
    
   // Table heading
   outSS << setw(YEAR_COL_WIDTH) << "Year" 
      << setw(BALANCE_COL_WIDTH) << "Balance" << endl; 
   
   // Calculate interest and ending balance for each month
   for (month = 1; month <= totalMonths; ++month) {
      interest = balance * mpr;
      balance += interest;
        
      // Only output year number and balance at the end of the year
      if (month % 12 == 0) {
         outSS << setw(YEAR_COL_WIDTH) << month / 12 
             << setw(BALANCE_COL_WIDTH) << balance << endl;
      }
   }
    
   // Return the table as a string
   return outSS.str();
}

int main() {
   string table;
   double startAmount;
   double apr;
   int years;
   
   // Get input values
   cout << "Starting amount?" << endl;
   cin >> startAmount;   
   cout << "Annual Percentage Rate?" << endl;
   cin >> apr;   
   cout << "Number of years?" << endl;
   cin >> years;
   
   cout << endl << "Savings over time:" << endl;
   table = ProduceSavingsTable(startAmount, apr, years);
   cout << table << endl;
   
   return 0;
}
```

here we have fixed, setw, setprecision(int n), setfill('-')

### File input

#### Opening and reading from a file

```c++
/*
Sometimes a program should get input from a file rather than from a user typing on a keyboard. To read file input, a programmer can create a new input stream that comes from a file, rather than the predefined input stream cin that comes from the standard input (keyboard). An input stream can then be used just like cin.

The inFS.open(str) function has a string parameter str that specifies the name of the file to open. The filename parameter can be a C++ string or a null-terminated C string. A program can also use a user-entered string as the filename, such as using cin >> filename;.
*/

#include <iostream>
#include <fstream>
using namespace std;

int main() {
   ifstream inFS;     // Input file stream
   int fileNum1;      // Data value from file
   int fileNum2;      // Data value from file

   // Try to open file
   cout << "Opening file numFile.txt." << endl;

   inFS.open("numFile.txt");
   if (!inFS.is_open()) {
      cout << "Could not open file numFile.txt." << endl;
      return 1; // 1 indicates error
   }

   // Can now use inFS stream like cin stream
   // numFile.txt should contain two integers, else problems
   cout << "Reading two integers." << endl;
   inFS >> fileNum1;
   inFS >> fileNum2;
   cout << "Closing file numFile.txt." << endl;
   inFS.close(); // Done with file, so close it

   // Output values read from file
   cout << "num1: " << fileNum1 << endl;
   cout << "num2: " << fileNum2 << endl;
   cout << "num1 + num2: " << (fileNum1 + fileNum2) << endl;

   return 0;
}
```

#### Reading until the end of the file

```c++
/*
A program can read varying amounts of data in a file by using a loop that reads until the end of the file has been reached. The eof() function returns true if the previous stream operation reached the end of the file.

Errors may be encountered while attempting to read from a file, like the inability to read the file, reading corrupt data, etc. So, a program should check that each read was successful before using the variable to which the read data was assigned. The fail() function returns true if the previous stream operation had an error.
*/
Program	Example input file and output
#include <iostream>
#include <fstream>
using namespace std;

int main() {
   ifstream inFS;   // Input file stream
   int fileNum;     // File data

   // Open file
   cout << "Opening file myfile.txt." << endl;
   inFS.open("myfile.txt");

   if (!inFS.is_open()) {
      cout << "Could not open file myfile.txt." << endl;
      return 1;
   }

   // Print read numbers to output
   cout << "Reading and printing numbers." << endl;

   while (!inFS.eof()) {
      inFS >> fileNum;
      if (!inFS.fail()) {
         cout << "num: " << fileNum << endl;
      }
   }

   cout << "Closing file myfile.txt." << endl;

   // Done with file, so close it
   inFS.close();

   return 0;
}
```

notice inputFile.eof() and inputFile.fail()

#### Example: Counting instances of a specific word

```c++
/*
The following program uses both the extraction operator, eof(), and fail() to determine how many times a user entered word appears in a file. The number of words in the file is unknown, so the program extracts words until the end of the file is reached. The program exits if the stream extraction causes an error or after the word's frequency in the file is output.
*/

#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {
   ifstream inFS;     // Input file stream        
   string userWord;
   int wordFreq = 0;
   string currWord;
   
   // Open file
   cout << "Opening file wordFile.txt." << endl;
   inFS.open("wordFile.txt");
   
   if (!inFS.is_open()) {
      cout << "Could not open file wordFile.txt." << endl;
      return 1;
   }
   
   // Word to be found
   cout << "Enter a word: ";
   cin >> userWord;
   
   // Identify when a word matches the userWord 
   // and increase wordFreq
   while (!inFS.eof()) {
      inFS >> currWord;
      if (!inFS.fail()) {
         if(currWord == userWord) {
            ++wordFreq;
         }
      }
   }
   
   cout << userWord << " appears in the file " 
        << wordFreq << " times." << endl;
   
   // Done with file, so close it
   inFS.close();
   
   return 0;
}
```



#### Example: Business reviews

```c++
/*
The following example reads a file with business reviews as the program starts and outputs data from the file at the end of the program. The number of reviews is unknown to the program, so the program continues to read until the end of the file. Each entry contains the username of the person who left the review and a 1 - 5 rating (1 being a low rating and 5 being a high rating). Upon completion, the program outputs the data from the file along with the average business rating.
*/
#include <iostream>
#include <fstream>
#include <string>
#include <vector>
using namespace std;


class Review {
   public:
      void SetUserName(string revUserName) {
         userName = revUserName;
      }
      void SetRating(int revRating) {
         rating = revRating;
      }
      string GetUserName() const { return userName; }
      int GetRating() const { return rating; }

   private:
      string userName = "NoName";
      int rating = -1;
};


void ReadReviews(string& restaurantName, vector<Review>& reviewList) {
   ifstream inFS;     // Input file stream
   string userName;
   int userRating;
   Review currentReview;

   // Open file
   inFS.open("Trattoria_Reviews.txt");
   
   if (!inFS.is_open()) {
      cout << "Could not open file Trattoria_Reviews.txt."<< endl;
   }

   getline(inFS, restaurantName);
        
   while (!inFS.eof()) {
      inFS >> userName;
      inFS >> userRating;
           
      if (!inFS.fail()) {
         currentReview.SetUserName(userName);
         currentReview.SetRating(userRating);
         reviewList.push_back(currentReview);
      }
   }

   // Close file when done reading
   inFS.close();
}

double CalcAvgRating(const vector<Review>& reviewList) {
   int i;
   double ratingAvg = 0;

   for(i = 0; i < reviewList.size(); ++i) {
      ratingAvg += reviewList.at(i).GetRating();
   }
   return ratingAvg /= reviewList.size();
}

void DisplayReviews(const string& restaurantName, 
                    const vector<Review>& reviewList, 
                    const double ratingAvg) {
   int i;

   cout << endl << restaurantName << endl;
   cout << "Average rating: " << ratingAvg << endl;
   cout << "--------------------" << endl;

   for(i = 0; i < reviewList.size(); ++i) {
      cout << "User name: " << reviewList.at(i).GetUserName() << endl;
      cout << "   Rating: " << reviewList.at(i).GetRating() << endl;
      cout << endl;
   }
}

int main() {        
   double ratingAvg;
   vector<Review> reviewList;
   string restaurantName;

   // Reads restaurant name and reviews from input file at program start
   ReadReviews(restaurantName, reviewList);
   
   ratingAvg = CalcAvgRating(reviewList);
   DisplayReviews(restaurantName, reviewList, ratingAvg);

   return 0;
}
```



#### Input stream errors

```c++
/*
A stream error occurs when insertion or extraction fails, causing the stream to enter an error state. Ex: If a file has the string two but the program attempts to extract an integer, the extraction will fail and the stream will enter an error state.

An input stream may also enter an error state if a value extracted is too large (or small) to fit in the given variable. While in an error state, an input stream may: skip extraction, set the given variable to 0, or set the given variable to the maximum (or minimum) value of that variable's data type.

A stream internally uses several 1-bit error flags to track the state of the stream. A program can check a stream's error state using several stream functions that return the current state. A stream's error state is cleared using clear().
*/
```

| Flag    | Meaning                                                      | Function                                                     |
| ------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| goodbit | Indicates no error flags are set and the stream is good.     | **good()** returns true if no stream errors have occurred.   |
| eofbit  | Indicates if end-of-file reached on extraction.              | **eof()** returns value of eofbit, if end-of-file reached on extraction. |
| failbit | Indicates a logical error for the previous extraction or insertion operation. | **fail()** returns true if either failbit or badbit is set, indicating an error for the previous stream operation. |
| badbit  | Indicates an error occurred while reading or writing the stream, and the stream is bad. Further operations on the stream will fail. | **bad()** returns true if badbit is set, indicating the stream is bad. |

```c++
inFS.open("Reviews.txt");
 
if (!inFS.is_open()) {
   cout << "Could not open file Reviews.txt."<< endl;
}

while (!inFS.eof() && inFS.good()) {
   inFS >> userName;
   inFS >> userRating;
    
   if (!inFS.fail()) {
      currentReview.SetUserName(userName);
      currentReview.SetRating(userRating);
      reviewList.push_back(currentReview);
   }
}
 
// If end-of-file not reached, then an error occurred
if (!inFS.eof()) {
   cout << "Error reading Reviews.txt." << endl;
   exit(EXIT_FAILURE);
}
```



### C++ example: Parsing and validating input files

```c++
/*
The following program reads input from the teams.txt file, which contains a baseball team name on one line followed by an optional line with the number of wins and losses for the season. Some win/loss lines only have a single number representing the number of wins. The file may have any number of team name and win/loss lines.
*/
#include <iostream>
#include <fstream>
#include <string>
using namespace std;

int main() {
   ifstream teamFS;
   string teamName; 
   int numWins;
   int numLosses;

   teamFS.open("teams.txt");

   if (!teamFS.is_open()) {
      cout << "Could not open file teams.txt." << endl;
      return 1;
   }

   // Read first team name
   getline(teamFS, teamName);

   // Read until end-of-file 
   while (!teamFS.fail()) {
      // Attempt to read wins
      teamFS >> numWins;

      if (teamFS.fail()) {
         // Win/loss line missing
         cout << teamName << " has no wins or losses" << endl;                        
      }
      else {
         // Attempt to read losses
         teamFS >> numLosses;

         if (teamFS.fail()) {
            // No losses provided
            cout << teamName << " has " << numWins << " wins" << endl;
         }
         else {
            // Win and losses provided
            cout << teamName << " win average is " 
                 << static_cast<double>(numWins) / (numWins + numLosses) << endl;
         }

         // Remove newline
         teamFS.ignore();                        
      }

      // Clear the error state
      teamFS.clear();

      // Attempt to read next team
      getline(teamFS, teamName);
   }

   teamFS.close();

   return 0;
}
```



## Vector

### Vectors

- declaration
  - `vector<dataType> vectorName(numElements);`

```c++
#include <iostream>
#include <vector>
using namespace std;

int main() {
 vector<int> itemCounts(3);

 itemCounts.at(0) = 122;
 itemCounts.at(1) = 119;
 itemCounts.at(2) = 117;

 cout << itemCounts.at(1);

 return 0;
}
```

#### Using an expression for a vector index

```c++
/*
A powerful aspect of vectors is that the index is an expression. Ex: userNums.at(i) uses the value held in the int variable i as the index. As such, a vector is useful to easily lookup the Nth item in a list.

A vector's index must be an unsigned integer type. The vector index cannot be a floating-point type, even if the value is 0.0, 1.0, etc.

The program below allows a user to print the age of the Nth oldest known person to have ever lived. The program quickly accesses the Nth oldest person's age using oldestPeople.at(nthPerson - 1). Note that the index is nthPerson - 1 rather than just nthPerson because a vector's indices start at 0, so the 1st age is at index 0, the 2nd at index 1, etc.
*/

#include <iostream>
#include <vector>
using namespace std;

int main() {
   vector<int> oldestPeople(5);  
   int nthPerson;               // User input, Nth oldest person

   oldestPeople.at(0) = 122; // Died 1997 in France
   oldestPeople.at(1) = 119; // Died 1999 in U.S.
   oldestPeople.at(2) = 117; // Died 1993 in U.S. 
   oldestPeople.at(3) = 117; // Died 1998 in Canada
   oldestPeople.at(4) = 116; // Died 2006 in Ecuador

   cout << "Enter N (1..5): ";
   cin  >> nthPerson;

   if ((nthPerson >= 1) && (nthPerson <= 5)) {
      cout << "The " << nthPerson << "th oldest person lived ";
      cout << oldestPeople.at(nthPerson - 1) << " years." << endl;
   }

   return 0;
}
```

#### Loops and vectors

```c++
/*
A key advantage of vectors becomes evident when used in conjunction with loops. The program below uses a loop to allow a user to enter 8 integer values, storing those values in a vector, and then printing those 8 values.

A vector's size() function returns the number of vector elements. Ex: In the program below, userVals.size() is 8 because the vector was declared with 8 elements.
*/

#include <iostream>
#include <vector>
using namespace std;

int main() {
   const int NUM_VALS = 8;         // Number of elements in vector
   vector<int> userVals(NUM_VALS); // User values
   unsigned int i;                 // Loop index
   
   cout << "Enter " << NUM_VALS << " integer values..." << endl;
   for (i = 0; i < userVals.size(); ++i) {
      cout << "Value: ";
      cin >> userVals.at(i);
   }
   
   cout << "You entered: ";
   for (i = 0; i < userVals.size(); ++i) {
      cout << userVals.at(i) << " ";
   }
   cout << endl;
   
   return 0;
}
```

#### Vector initialization

```c++
/*
A vector's elements are automatically initialized to 0s during the vector declaration.

All of a vector's elements may be initialized to another single value. Ex: vector<int> myVector(3, -1); creates a vector named myVector with three elements, each with value -1.

A programmer may initialize each vector element with different values by specifying the initial values in braces {} separated by commas. Ex: vector<int> carSales = {5, 7, 11}; creates a vector of three integer elements initialized with values 5, 7, and 11. Such vector declaration and initialization does not require specifying the vector size, because the vector's size is automatically set to the number of elements within the braces. For a larger vector, initialization may be done by first declaring the vector, and then using a loop to assign vector elements.
*/
```

