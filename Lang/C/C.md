# Command Line Arguments


## int main(int argc, char* argv[])

### Argument count

- The number of command line argument that you have

- Include the name of program

### Argument Vector

- A array of pointers to the command line args stored as strings

- argv[0]: /Users/.....  
  The others points to the args formed as strings


# string


## syntax

### char str[STR_LEN + 1];  
  当给str赋值STR_LEN长度的字符串以后 我们仍然可以通过str[STR_LEN]取得最后的’\0’  
  这确保我们可以access包括‘\0’在内的所有元素

### 关于string的不可变性

- 简化理解 但不正确

	- char str[] 相当于 char const *str 元素可变 地址不可变

	- char *str 相当于 const char *str 地址可变 元素不可变 赋值之后字符数组在常量区

- 实际原理

	- 声明 char *str时，str是text只读区的地址，所以无法更改成员，但可以改变指向

	- 声明char str[]时，在栈中创建数组，并将text中的字符串复制到其中，str则指向了栈中的相应大小的内存块

	- 注意：数组名和指向数组首位的指针并不完全相同，只是有时数组名会退化成指向数组首位的指针

		- Int a[5];

			- a++;  
			  报错  
			  因为a代表整个内存块

				- 类型为int [5]  
				  即大小为5个int的内存块标识

			- (&a)++;  
			  增加5*4

				- 类型为int (*)[5]  
				  指向大小为5个int的内存块的指针

			- (&a[0])++;  
			  增加8 （64位）

				- 类型为int*  
				  int指针

		- void func(int a[5])  
		  在func里面打印sizeof(a)

			- 在main中声明int a[5]  
			  sizeof(a)为 5*4

			- 在func中则变为了8 （64位）

		- Except when it is the operand of the sizeof operator or the unary & operator, or is a  
		  string literal used to initialize an array, an expression that has type ‘‘array of type’’ is  
		  converted to an expression with type ‘‘pointer to type’’ that points to the initial element of  
		  the array object and is not an lvalue. If the array object has register storage class, the  
		  behavior is undefined.

## string.h

### strlen()

- Return the length of string(excluding the null character)

### strcpy(str1, str2)

- Copy str2 to str1

### strncpy(str1, str2, 5)

- strncpy() copy a portion of str2 to str1 up to 5 char

- strncpy() does not copy the null character!  
  We should do it at the end  
  str1[SIZE - 1] = ‘\0’;

### strcat(str1, str2)

- Append str2 to str1, first char of str2 replace the first null char of str1

### strncat(str1, str2, 5)

- Append 5 char of str2 to str1, it automatically add null char to the end.

### strcmp(str1, str2)

- Compare one string to another, returning values less than, equals to, or greater than 0. Comparison is based on ASCII

- A-Z a-z 0-9 space(32)  
  ASCII decrease from left to right

- Notice that different IDE may have a slight different ASCII code  
  But the overall strcmp() result would be correct, which mean the sign of the result would not be affected

### 

- strncmp(str1, str2, 5)

	- Compare the first 5 char of them

- strchr(str, ‘a’)

	- If the ‘a’ is in the str  
	  It will stop once the first ‘a’ is found

	- Return the pointer to that char, or a null pointer if it’s not in the string

- strrchr(str, ‘a’)

	- The only difference is that this one starts from the end of str  
	  Basically a reverse version

- strstr(str1, str2)

	- If str2 is in the str1

	- Return a pointer

- strtok(str, ‘,.-’)

	- 会破坏原字符串的完整

	- 每当监测到一个delimiter就会将其转化成一个’\0’

	- 第一次使用需要传入string  
	  之后在str位置传入NULL  
	  会从上次结束的位置的下一位开始

	- 每次返回的是当前被cutout的token的指针  
	  剩余被破坏的字符串则储存在静态区

	- 如果查找到末尾事 则返回NULL  
	  如果查找不到delim中的字符时，则返回当前strtok的字符串指针

	- 注意 多有的delim中包含的字符会被过滤，因为其被转换为一个分割的节点

	- 若不希望破坏原字符串  
	  可尝试strchr与sscanf的组合等

- strtod(str, &charPtr)

	- The part to be converted to double must be at the beginning of the str

	- Return the double  
	  And the pointer points to the rest  of the string

- strtol(str, &cPtr, 0)

	- The part to be converted to long must be at the beginning of the str

	- Return the int  
	  And the pointer points to the rest  of the string

	- The 0 means it can be in the form of decimal, octal, or hex

- For convenience

	- stdlib.h

		- atof(str)

			- Convert a string to a floating point (double or float)

		- atoi(str)

			- Convert a string to an int

