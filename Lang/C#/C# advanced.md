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

  



#### 多线程

##### 术语

- 抢占
  - 当线程与其他线程交织的一刻，即被抢占了

##### 线程的一些属性

- 线程开始后IsAlive变为true直到线程结束
- 线程的结束条件：线程构造函数传入的委托结束了执行
- 线程结束后，无法重启
- 每个线程的Name属性只能设置一次
- 静态的Thread.CurrentThread属性，会返回当前执行的线程

##### Join and Sleep

##### 线程池

- 不可以设置池线程的Name（调试不方便，但有办法解决）
- 池线程都是后台线程
- 阻塞池线程可使性能降低
- 你可以自由的更改池线程的优先级
  - 当它释放回池的时候优先级将还原为正常状态
- 可以通过Thread.CurrentThread.IsThreadPoolThread属性来判断是否执行在池线程上

1. 进入线程池

   - 最简单的显式的在池线程运行代码的方式就是使用Task.Run

   - ```c#
     //Task is in System.Threading.Tasks
     Task.Run (() => Console.WriteLine("Greetings from the thread pool"));
     ```

     

2. 谁使用了线程池

   - 并行编程结构
   - 等等

3. 线程池中的整洁

   - 线程是提供了一个功能：确保临时超出