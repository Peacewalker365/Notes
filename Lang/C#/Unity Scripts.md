# Unity核心类


## Object

### GameObject  
  Sealed class

### Component

- Transform

- Rigidbody  
  Sealed class

- ParticleSystem  
  Sealed class

- Behaviour

	- MonoBehaviour

		- Terrain  
		  Sealed class

	- Camera  
	  Sealed class

	- Animator  
	  Sealed class

	- AudioSource  
	  Sealed class

	- Light  
	  Sealed class

	- Animation  
	  Sealed class

	- AudioListener  
	  Sealed class

- Collider

- Renderer

### Texture

### Mesh  
  Sealed class

### Material


# Unity脚本


## 脚本介绍

### 介绍

- 附加在游戏物体上用于定义游戏对象行为的指令代码

### 语法结构

- using 命名空间；

- public class 类名：MonoBehaviour

- void 方法名()

- Debug.Log(“调试显示信息”);  
  print(“本质就是Debug.Log方法”);

- 文件名与类名必须一致

- 写好的脚本必须附加到物体上才执行

- 附加到游戏物体的脚本类必须从MonoBehaviour类继承

### 编译过程

- 源代码-CLS-中间语言dll-Mono Runtime-机器码

## 开发工具

### MonoDevelop

### Visual Studio

### Console

## 脚本生命周期

### 简介

- 脚本从唤醒到销毁的过程

- 又叫 消息 或者必然事件

### 初始阶段

### 物理阶段

### ...

### 结束阶段

### 具体见官方文档

## 调试

### 平台

- 使用Unity编辑器

- 使用vs

- 使用MonoDevelop

### 工具

- 控制台调试

	- Debug.log(变量)

		- 一定要记得删 很占性能

	- print(变量)

- 定义public变量 程序运行后在检测面板查看数据

	- 适合调试逻辑简单的错误

- 如果逻辑复杂 用vs调试

	- 断点

	- attach to unity启动调试

	- 运行unity场景

	- 右键 快速监视  
	  底部 即时窗口

		- 适合在start中调试

	- Update

		- 适合单帧调试

	- 自动窗口 局部变量


# 常用API


## Component

### 提供了查找（在当前物体后代和前辈）组件的功能

- 深度优先

	- GetComponents<Type>

	- GetComponent<Type>

- CompareTag

## Transform

### 位置

- this.transform.Location

- this.transform.localPosition

	- 编辑器面板都是local值

### 缩放比例

- this.transform.localScale

- this.transform.lossyScale

	- 自身缩放比例*父物体缩放比例(也就是local)

	- 只能get不能set

- this.transform.Translate(0, 0, 1)

	- 向自身坐标系z轴移动一米

- this.transform.Translate(0, 0, 1, Space.World)

	- 向世界坐标系z轴移动一米

- this.transform.Rotate(0, 10, 0)

	- 自身坐标系 z轴 转10度

- this.transform.Rotate(0, 10, 0, Space.World)

- this.transform.RotateAround(Vector3.zero, Vector3.forward, 1)

	- 世界定点绕世界y轴围绕旋转1度

- this.transform.root

	- 获取根物体变换组件

- this.transform.parent

	- 获取父物体

- This.transform.setParent()

	- 设置父物体

- This.transform.Find(“子物体名称”)

	- 根据名称获取子物体

- this.transform.GetChild(int index)

	- 根据索引获取子物体

- this.transform.childCount

## GameObject

## Object

## Time

