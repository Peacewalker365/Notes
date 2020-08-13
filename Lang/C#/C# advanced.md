# C# advanced

#### Delegate

1. 委托 vs 接口
   - 委托可以解决的问题，接口也可以
   - 什么时候更适合用委托？
     - 接口只能定义一个方法
     - 需要多播能力
     - 订阅者需要多次实现接口

2. 委托的兼容性

- 委托类型：委托类型之间互不相容，即使方法签名也一样

- ```c#
  delegate void D1();
  delegate void D2();
  
  D1 d1 = Method1;
  D2 d2 = d1;//Compile-time error
  ```

- 委托实例：如果委托实例拥有相同的方法，那么就认为二者相等

- ```c#
  delegate void D();
  ...
  
  D d1 = Method1;
  D d2 = Method1;
  Console.WriteLine(d1 == d2);//True
  ```

- 参数：当调用方法时，args可以比param更具体  
  委托可以接受比它的目标方法更具体的参数类型，这个性质叫做ContraVariance，逆变

- ```c#
  delegate void StringAction (string s);
  
  class Test
  {
    static void Main()
    {
      StringAction sa = new StringAction (ActOnObject);//调用的方法的param是object
      sa("hello");//传入的是string，比object更具体
    }
    
    static void ActOnObject (object o) => Console.WriteLine (o);//hello
  }
  ```

- 返回类型：调用方法时，你可以得到一个比请求的类型更具体的类型的返回结果。  
  委托的目标方法可以返回比委托描述里更具体的类型的返回结果，Covariance，协变

- ```c#
  delegate object ObjectRetriever();//委托的返回类型是object
  
  class Test
  {
    static void Main()
    {
      ObjectRetriever o = new ObjectRetriever (RetrieveString);
      object result = o();
      Console.WriteLine (result);//hello
    }
    static string RetrieveString() => "hello";//调用方法的返回类型是子类string
  }
  ```

  

- 