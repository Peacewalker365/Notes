

```
void GetMemory( char *p )
{
 p = (char *) malloc( 100 );
}
void Test( void )
{
 char *str = NULL;
 GetMemory( str );
 strcpy( str, "hello world" );
 printf( str );
}
```
程序崩溃: 更改的是函数内的str的copy的指向，形参的改变未影响实参

```
char *GetMemory( void )
{
 char p[] = "hello world";
 return p;
}
void Test( void )
{
 char *str = NULL;
 str = GetMemory();
 printf( str );
}
```
可能返回乱码： 因为 GetMemory 返回的是指向“栈内存”的指针，该指针的地址不是 NULL，但其原现的内容已经被清除，新内容不可知。
p[]数组为函数内的局部自动变量,在函数返回后,内存已经被释放。这是许多程序员常犯的错误,其根源在于不理解变量的生存期


*p[0] []和*的优先度一定要注意 否则access的逻辑完全不同 编译器也不一定会报错 因为语法上没问题！！

```
//assign NULL to the pointer after free() to avoid wild pointer!
free(ptr);
ptr = NULL;
```

各种语言下的不同默认初始化值

同种语言下 class struct global local的初始化默认值

在struct里 不能初始化成员

当对pointer所指向的对象进行操作时，边界条件一定要考虑空指针的情况，否则会出现错误！

free时，也要考虑是否会free空指针！

a可以被看做指向数组首地址的指针。但是！这种说法在以下两种情况下不成立：
1. sizeof(a);
2. &a;

c语言中不允许在函数外部给全局变量赋值

全局中无法用变量作为数组长度，除非用macro

（一部分编译器即使变量已经在生命时初始化了也不行）

注意各种遍历方式的区别和坑

掌握递归与非递归的遍历

怎么用 C 语言画出二叉树的图形：绘制2dbuffer？ 按层打印？ 怎么加线

波兰表示法与表达式树



归并排序 空间复杂度O(1)的实现方法 有没有退化 怎么实现的？（手摇算法 or 其他）

路由算法

双递归的进出栈

解释一下双递归：（遇到双递归问题时，当第一个递归执行的时候，第二个递归并不是不执行，而是先进栈，根据顺序来，简单明了的解释就是，第一个递归你该怎么走就怎么走，完全没什么可以阻挡你，第二个递归就不同了，他是在第一个递归的基础上执行的，但不是立刻执行，而是执行递归进栈，当第一个递归完全执行技术的时候，第二个递归出栈，开始慢慢执行！）


把arr为结构体数组，把arr赋值给结构体指针p，free(p)之后，arr指向的之前malloc的内存块都free了，但是p仍指向原地址，成为了野指针！记得要assign NULL!

允许可独立编译单元内存在未定义的函数 不允许可独立编译单元内存在未定义存储（数据类型）！ 可独立编译单元就是指.c文件

也就是说，在.h里声明一个struct 但是没有写具体定义，如果对应的.c文件没有具体定义，则编译失败，因为不清楚结构体的大小。


```
switch(foo) {
  case 1:
    int i = 42; // i exists all the way to the end of the switch
    dostuff(i);
    break;
  case 2:
    dostuff(i*2); // i is *also* in scope here, but is not initialized!
}
```
报错的原因在于，switch语句中，在一个case里声明的变量，如果没有被{}包含，则在后续的cases中是可见的，但是
they will not be initialized because the initialization code belongs to another case.

In the code above, if foo equals 1, everything is ok, but if it equals 2, we'll accidentally use the i variable which does exist but probably contains garbage.





