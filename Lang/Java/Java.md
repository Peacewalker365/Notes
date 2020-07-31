# Java

### 可变参数

```java
public void show(String ... strs){
  System.out.println("sths");
}

public void show(String str){
  System.out.println("sth");
}

//public void show(String[] strs){}  冲突

/*
	Test test = new Test();
	test.show("hey");
	此时调用的是后者 因为它更加确定
*/
```

1. 可变个数形参的格式
   - 数据类型 ... 变量名
2. 当调用可变个数形参的方法时，传入的参数个数可以是0个，1个……多个
3. 可变个数形参的方法与本类中方法名相同，形参不同的方法构成重载
4. 可变个数形参的方法与本类中方法名相同，形参是类型相同的数组的方法不构成重载，也就是说，不能共存
   - 它们本质上是相同的
   - 以前数组作为参数时：test.show(new String[] {"这里是参数", "另一个参数"})；
   - 现在可以：test.show("aa", "bb");
   - 本质上是数组，因为在方法内部循环遍历时，跟数组完全一样用
5. 可变个数形参在方法的形参中，必须声明在末尾（类似于parma in C#）
   - 主要是为了编译器了解实参的归属问题
6. 可变个数形参在方法的形参中，最多只能声明一个可变形参（原因为5.）



### Scanner

1. 从键盘获取不同类型的变量，需要使用Scanner类

2. 导入：import java.util.Scanner;

3. 实例化：Scanner scan = new Scanner(System.in);

4. 方法

   1. nextInt()

   2. 具体方法看文档

   3. 没有返回char的方法 可用字符串的代替 next(), 或者用char变量接收一个返回字符串的第一个位置

      - ```java
        String gender = scan.next();
        char genderChar = gender.charAt(0);
        ```

      - charAt(int index)获取索引位置上的char

   4. 注意：需要根据相应的方法，来输入制定类型的值，如果输入的数据类型与要求不匹配时，报错

      - 注意 ：不一定非得一样，因为有些匹配规则可以自行转换类型



### Arrays工具类

1. java.util.Arrays
2. 常用方法
   1. `bool equals(int a, int b)`
   2. `String toString(int[] a)`  遍历并输出数组信息
   3. `void fill(int[] a, int val)` 将指定的值替换进a的所有位置
   4. `void sort(int[] a)` 双pivot快排
   5. `int binarySearch(int[] a, int key)` 前提是有序 然后二分查找 返回值小于0说明没找到
   6. 其他看文档



### 对象的内存解析（初级）

- [对象的创建和使用：内存解析](https://www.bilibili.com/video/BV1Kb411W75N?p=183)

  - Heap: 存放对象实例
  - VM Stack：储存局部变量
  - Method Area：储存已被虚拟机加载的类信息，常量，静态变量，即时编译器编译后的代码等

  ```java
  Person p1 = new Person();
  //首地址值 0x12ab 在栈上 指向堆中的实例
  p1.name = "Tom";
  p1.isMale = true;
  //更改堆中的成员
  Person p2 = new Person();
  //首地址值 0x7788
  sysout(p2.name);
  Person p3 = p1;
  //首地址值 0x12ab 此时实际上就是p1
  p3.age = 10;
  //修改了p3，p1改变
  ```



### 方法参数的值传递机制

1. [目前进度](https://www.bilibili.com/video/BV1Kb411W75N?p=210)

