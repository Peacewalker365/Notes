# C# 基础

//实现2048 核心算法  

namespace Console2048  
{  
	class GameCore  
	{  
		  
	}  


}


## .NET简介

### 略

## 变量

### 略

## 数据基本运算

### 略

## 语句

### 略

## 方法

### 定义

- 定义

- 语法

### 返回值

### 参数列表

- 参数

	- 值参数

		- 按值传递

			- 传递实参变量储存的内容

		- 传递之前 必须赋值

		- 作用

			- 传递信息

	- 引用参数

		- 按引用传递

			- 传递实参变量自身的内存地址

		- 传递之前 必须赋值

		- 作用

			- 改变数据

	- 输出参数

		- 按引用传递

			- 传递实参变量自身的内存地址

		- 区别

			- 方法内部必须为输出参数赋值

			- 传递之前 可以不赋值

		- 作用

			- 返回结果

				- Return只能返回一个结果 所以out是对return的补充

- TryParse

### 如何定义方法

- 两个整数相加

- 定义原则

### 重载

## 数组

### 略

## 数据类型

### 数据类型

- 类型分类

- 类型归属

	- 数据类型Data Type

		- 值类型

			- 结构Struct

				- 数值类型

				- bool

				- char

			- 枚举

				- 简单枚举

					- enum

						- 定义

							- 列举数据的所有取值

							- 枚举元素默认为int

							- 其元素相当于是其中int值的tag

							- 当然如果int不够用 也可以改为其他类型例如enum:long

				- 多选

					- 选择多个枚举值用运算符｜（按位或）

						- 条件1: 任意多个枚举值做｜运算的结果不能与其他的枚举值相同

							- 因为相同位数 有一个为1则结果为1

							- 否则运算之后会和其他枚举值有冲突

							- 00000001  
							  00000010  
							  00000100  
							  00001000  
							  00010000  
							  00100000  
							  01000000  
							  10000000

							- 对应的 枚举值分别为 2的n次幂 （n = 0，1，2，3，4，5，6，7）

						- 条件2: 定义枚举时 用[Flags]修饰

					- 判断标志枚举 是否包含制定枚举值 运算符 &（按位与）

						- 两个对应的二进制位中 有一个0 结果为0

						- [Flags]  
						  Enum PersonalStyle  
						  {  
						  tall = 1, rich = 2, handsome = 4, short = 8, poor = 16, ugly = 32  
						  }  
						  
						  if((style & PersonalStyle.tall) == PersonalStyle.tall)  
						  Console.WriteLine(“高个子”);
						  if((style & PersonalStyle.rich) != 0) Console.WriteLine(“有钱”);

					- 数据转换

						- int --> enum

							- (PersonalStyle)2

						- enum --> int

							- Int enumNum = (int) (Personal.tall | Personal.rich)

						- string --> enum

							- PersonalStyle style1 = (PersonalStyle)Enum.Parse(typeof(PersonalStyle), “tall”)

						- enum --> string

							- string strEnum = PersonalStyle.tall.ToString();

		- 引用类型Reference

			- 类Class

				- string

					- string

						- 字符串池

							- string s1 = “Pig”;  
							  string s2 = “Pig”;  
							  string s3 = new string (new char[] {‘P’, ‘i’, ‘g’});  
							  string s4 = new string (new char[] {‘P’, ‘i’, ‘g’});

								- bool r1 = object.ReferenceEquals(s1, s2);  
								  //true  
								  如果字符串池中有就会指向它

								- bool r2 = object.ReferenceEquals(s3, s4);  
								  //false  
								  new命令会开辟新的内存

						- 字符串的不可变性

							- string s1 = “Pig”;  
							  s1 = “Monkey”;

								- 检查Monkey在不在字符串池中，如果不在开辟内存写入它，让s1指向新的内存

								- 并不能将改写Pig为Monkey

								- 这种机制是为了保证内存分配  
								  因为Pig的内存邻居可能存着其他的对象，随意修改可能挤占破坏其他对象的内存位置

					- StringBuilder

						- 可变 初始大小为10

						- 若超过大小 开辟更大的空间 并拷贝

						- 减少了垃圾生成

				- Array

				- 委托

			- 接口Interface

### 内存分配

- 内存

	- 栈

		- 小快

	- 堆

		- 大慢

- 分配

	- 内存

		- CLR申请内存空间

			- 栈区（储存正在执行的方法）

				- 分配的空间：栈帧

			- 堆区（储存引用类型数据）

### 局部变量

- 值类型与引用类型

- 分配图

	- 内存分配

		- 值类型

			- 声明在栈

			- 数据储存在栈

		- 引用类型

			- 声明在栈

			- 栈中储存该数据的引用

			- 数据储存在堆

	- 特点

		- 被调用时 存在栈 调用结束被清除

		- 没有默认值 必须自行设定初始值

- 垃圾回收器

	- GC线程从栈中的引用开始跟踪 若无法跟踪到某一块内存 那么就认为不再使用了 继而被回收

		- CPU占用率高 尽量别生产垃圾 例如尽量减少重复的new

		- 一般等到内存告急回收

### 成员变量

- 值类型与引用类型

- 分配图

### 应用

- 比较

	- 值类型

		- 比较数据（值）

	- 引用类型

		- 比较数据（地址）

			- 相等 == 必须指向同一块内存

- 赋值

	- 在main中 int i; i = 28;

		- 赋给栈中的内存

	- 在main中 int[] arr; arr[0] = 28;

		- 赋给堆中的内存

- 传参

### 拆装箱

- 装箱

	- 值类型隐式转换为object类型或由此值类型实现的任何接口类型的过程
	  int a = 1;  
	  Object o = a;

		- 在堆中开辟内存空间

		- 将值类型的数据复制到其中

		- 返回堆中新分配对象的地址

- 拆箱

	- 从object类型到值类型或从接口类型到实现该接口的值类型的显式转换
	  Object o = 1;  
	  Int b = （int）o;

- 装箱比拆箱消耗性能

	- 减少装箱

		- 避免（形参object 实参传递值类型）

			- 重载

			- 泛型

- ILSPY去看中间语言判断有没有拆装箱

	- int num = 100;  
	  string str = num.ToString();  
	  //没装箱

	- Int num = 100;  
	  string str = num + “”;  
	  装箱了  
	  该功能在中间语言起始call了string.concat()
	  其中的string.concat(params Object[] args)
	  Int-->Object 装箱

## 类和对象

### 什么是类什么是对象

- 类和对象

	- OOP

	- 类是蓝图 对象是实现

	- 类是抽象 对象是具体

	- 数据成员

	- 方法成员

- 创建类

	- 访问级别 class 类名  
	  {  
	      类成员  
	  }

- 创建对象

	- Wife wife = new Wife();

- 成员变量

	- 定义在类中方法外的变量

	- 具有默认值

	- 实例化后 存在堆中

	- 对象被回收 成员变量从堆中移除

	- 可与局部变量重名

	- 内存分配

		- 值类型

			- 声明在堆

			- 数据储存在堆

		- 引用类型

			- 声明在堆

			- 数据储存在堆

### 构造函数

- 定义

	- 创建对象的方式

	- 访问修饰符 类名（）  
	  {  
	  }

- 特点

	- 常用于初始化对象成员

	- 没有返回值 也不能写void

	- 如果没有 编译器默认创造一个  
	  如果有了 就不会提供

	- 如果是private 则只有类内部才能invoke 无法在外部 new它

	- 创建对象时自动调用 无法手动调用

	- 如果想要套娃，例如有参的构造函数要执行无参的构造函数  
	  public Wife(string name, string age):this()  
	  {  
	      this.name = name;  
	      this.age = age;  
	  }

- 注意！

	- 数据成员的初始化要放入相应的构造函数里(实例的 或 静态的) 不要直接在声明后初始化 以避免不必要的麻烦

### 访问修饰符

- public

- protected

	- 继承可以使用

- private

	- 所属类及其内部类才能访问

### this 关键字

- 表示当前对象的引用  
  提高可读性  
  只有在没有歧义的时候才可以省略

### 属性

- 对字段起保护作用 可实现只读 只写 本质其实是对字段的读写方法 公有的属性用来操作私有的字段

- private string name;  
  //以下为属性 保护字段  
  public string Name{  
      get  
      {return this.name;}  
      Set  
      {this.name = value;}  
  }

	- Name就是一个属性

- 自动属性  
  包含1字段 2方法  
  相当于属性+字段的作用  
  public string Password{get; set;}

### 类结构

练习 用户集合类  
//还未实现缩小 插入 和删除  

Class UserList  
{  
	//*******字段*******  
	private User[] data;  
	private int currentIndex = 0;  
	//*******属性*******  
	public int Count  
	{  
		get  
		{return currentIndex;}  
	}  
	//*******构造*******  
	public UserList():this(8)  
	{}  
	public UserList(int capacity)  
	{  
		data = new User[capacity];  
	}  
	//*******方法*******  
	public void CheckCapacity()  
	{	  
		if(currentIndex >= data.Length)  
		{  
			User[] newData = new User[data.Length * 2];  
			Data.CopyTo(newData, 0);  
			Data = newData;  
		}		  
	}  

	public void Add(User value)  
	{  
		data[currentIndex++] = value;  
	}  

	public User GetElement(int index)  
	{  
		return data[index];  
	}  

}  


static void main(string[] args)  
{  
	UserList userList1 = new UserList(2);  
	userList1.add(new User());  
	userList1.add(new User());  
	userList1.add(new User());  
	userList1.add(new User());  

	for (int i = 0; I < userList1.Count; i++)  
	{  
		User user = list.GetElement(i);  
		user.PrintUser();  
	}  
}

- 字段

	- 储存数据

- 属性

	- 保护字段

- 构造函数

	- 提供创建对象的方式 常用于初始化数据成员

- 方法

	- 像类的外部提供某种功能

### Static

//需求：在二维数组中，获取某个元素某个方向上的元素

索引很容易出错，所以需要封装一下  

class Direction  
{  
	private int rIndex;  

	public RIndex  
	{  
		get  
		{return this.rIndex;}  
		set  
		{this.rIndex = value;}  
	}  

	public int CIndex {get; set;}  

	public Direction()  
	{}  

	public Direction(int rIndex, int cIndex)  
	{  
		this.rIndex = rIndex;  
		this.cIndex = cIndex;  
	}  

	public static Direction Up  
	{  
		get  
		{  
			return new Direction(-1, 0);  
		}  
	}  
	  
	public static Direction Down  
	{  
		get  
		{  
			return new Direction(1, 0);  
		}  
	}  

	public static Direction Left  
	{  
		get  
		{  
			return new Direction(0, -1);  
		}  
	}  

	public static Direction Right  
	{  
		get  
		{  
			return new Direction(0, 1);  
		}  
	}  

}  


static Class DoubleArrayHelper  
{  
	public static string[] GetElements(string[,] array, int rIndex, int cIndex, Direction dir, int count)  
	{  
		List<string> result = new List<string>(count);  

		for (int i = 0; i < count; I++)  
		{  
			rIndex += dir.RIndex;  
			cIndex += dir.CIndex;  
			if(rIndex >= 0 && rIndex < array.GetLength(0) &&  cIndex >= 0 && cIndex < array.GetLength(1))  
				result.Add(array[rIndex, cIndex]);  
		}  
		return result.ToArray();  
	}  
}  


static void main()  
{  
	string[,] array = new string[3, 4];  
	for (int r = 0; r < array.GetLength(0); r++)  
	{  
		for (int r = 0; r < array.GetLength(0); r++)		{  
			array[r, c] = r.ToString() + c.ToString();  
		}  
	}  
	  
	String[] result = DoubleArrayHelper.GetElements(array, 2, 0, Direction.Up, 5);  

}  
























- 静态成员变量

	- 类被加载时初始化 仅一份

		- Student stu = ....  
		  或 Student.StaticCount.....  
		  当第一次出现类名的时候 就会被加载

	- 优先存在于对象，被所有对象共享，常驻静态区

- 静态构造函数

	- 初始化类的静态数据成员

	- 仅仅在类被加载时执行一次

	- 不允许使用访问修饰符

		- 因为没有意义 因为static 构造函数 在类加载时就会执行

- 静态方法

	- 通过引用调用实例方法时，会隐式的传递对象引用，以便在方法内部可以正确访问该对象成员变量

		- 当new实例对象时  
		  内存块中有数据成员 但不含方法成员  
		  方法成员是共享的  
		  当实例对象要call方法成员时  
		  需要隐式的传递对象引用  
		  从而使方法知道谁在调用它  
		  以便访问该实例对象的成员

		- 静态代码块只能访问静态成员  
		  因为它拿不到引用去访问实例成员

			- 还可以这么理解  
			  静态的生命周期长  
			  当静态方法存在于内存中时  
			  可能还没有实例  
			  所以静态无法访问实例  
			  反之则可以

	- 通过类名调用静态方法时，因为没有具体对象，所以在static方法中不能访问实例成员

- 静态类

	- 不能实例化

	- 只能包含静态成员

	- 静态类不能被继承

- 适用性

	- pro

		- 单独空间存储 省地方

		- 所有对象共享

		- 可直接被类名调用

	- con

		- 只能访问静态成员

		- 共享数据被多个对象访问 会出现并发

	- 适用场合

		- 所有对象需要共享

		- 在没有对象前就要访问成员

		- 工具类适合做静态类  
		  常用 不需要过多数据

### 继承

class Person  
{  
	public string Name {get; set;}  

}  


class Student:Person  
{  
	public string Score {get; set;}  
}  




class Teacher:Person  
{  
	public string Salary {get; set;}  
}  


- class 子类:父类

	- 子类可以使用父类

		- Private虽然继承过来了 但是无法访问

	- 父类无法使用子类

		- 当父类型的引用指向子类的对象时 只能用父类的成员  
		  Person person = new Student();

			- 如果需要访问指向的该子类成员  
			  需要强制类型转换  
			  Student stu = (Student)person;

				- 兄弟之间强行转换会报错  
				  Teacher teacher = (Teacher)stu;  
				  //报错

				- Teacher teacher = stu as Teacher;  
				  
				  用此种语法不会报错 但是teacher为null

### 结构体

//需求：在二维数组中，获取某个元素某个方向上的元素

索引很容易出错，所以需要封装一下  

struct Direction  
{  
	private int rIndex;  

	public RIndex  
	{  
		get  
		{return this.rIndex;}  
		set  
		{this.rIndex = value;}  
	}  

	public int CIndex {get; set;}  

	//public Direction()  
	{}  

	public Direction(int rIndex, int cIndex):this()
	{  
		this.rIndex = rIndex;  
		this.cIndex = cIndex;  
	}  

	public static Direction Up  
	{  
		get  
		{  
			return new Direction(-1, 0);  
		}  
	}  
	  
	public static Direction Down  
	{  
		get  
		{  
			return new Direction(1, 0);  
		}  
	}  

	public static Direction Left  
	{  
		get  
		{  
			return new Direction(0, -1);  
		}  
	}  

	public static Direction Right  
	{  
		get  
		{  
			return new Direction(0, 1);  
		}  
	}  

}  


static Class DoubleArrayHelper  
{  
	public static string[] GetElements(string[,] array, int rIndex, int cIndex, Direction dir, int count)  
	{  
		List<string> result = new List<string>(count);  

		for (int i = 0; i < count; I++)  
		{  
			rIndex += dir.RIndex;  
			cIndex += dir.CIndex;  
			if(rIndex >= 0 && rIndex < array.GetLength(0) &&  cIndex >= 0 && cIndex < array.GetLength(1))  
				result.Add(array[rIndex, cIndex]);  
		}  
		return result.ToArray();  
	}  
}  


static void main()  
{  
	string[,] array = new string[3, 4];  
	for (int r = 0; r < array.GetLength(0); r++)  
	{  
		for (int r = 0; r < array.GetLength(0); r++)		{  
			array[r, c] = r.ToString() + c.ToString();  
		}  
	}  
	  
	String[] result = DoubleArrayHelper.GetElements(array, 2, 0, Direction.Up, 5);  

}  
























- 什么是结构体

	- 用于封装小型相关变量的值类型

	- 与类语法相似 都可以包含数据成员与方法成员

	- 属于 值 类 型！ （类是引用类型）

- 适用性

	- pro

		- 表示位置 点 颜色等轻量级对象  
		  如创建储存1000个点的数组  
		  若使用类 将为每个对象分配更多内存  
		  使用结构体可以节约资源

	- con

		- 每次new在栈分配空间 不适用于大型数据结构

- 定义结构体

	- 结构体不能包含无参数构造函数  
	  因为结构体自带一个

	- 构造函数中 必须先为所有字段赋值  
	  如果结构体中含有自动属性  
	  所以必须让其:this()  
	  利用自带的无参构造函数访问只有在编译后才生成的隐藏在自动属性中的字段  
	  并给赋值

	- 除非字段被声明为const或static 否则无法初始化  
	  意思是一般情况下  
	  不可以直接 private int num = 0；  
	  必须放在构造函数里初始化

	- 结构不能继承 但可以实现接口

- 内存分配

	- 声明在栈 数据在栈

## 其他

### List<数据类型>

- 泛型集合

	- List<User> list = new List<User>(10);

		- 适合储存东西 但不经常查找 或者需要从头到尾拿出来用

### Dictionary<string, User> dic = new Dictionary<string, User>();

- 查找元素的性能很好

- 遍历性能很差

