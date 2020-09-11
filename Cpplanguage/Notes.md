---
### **C++ 学习笔记**
1. hex 可以在 cout 语句格式化 16 进制输出
``` C++
cout << "value=" << hex << 15 << endl; /* 打印是 f */
```
2. 8 进制和 16 进制的表示方法，特别地如果使用 8 进制来表示转义字符，那么建议使用 3 个字节的数字，eg：\033 而不是使用 \33，避免奇怪的问题
``` C++
\ooo /* 八进制表示（最多 3 个 8 进制值表示一个字节 eg: \111 表示 16 进制的 49, 'I'） */
\xhh /* 16 进制表示，eg \x12 表示 0x12 */
```
3. 变量赋值除了可以使用 = 之外，还可以使用 () 直接初始化变量
``` C++
int i(10); /* eq int i = 10; */
```
4. 关键字 **volatile** 表示易失，编译器会使用特殊的机器码编译保证访问对应的变量时是最新的状态，而不是上一时刻的状态
5. 正斜杠 **/** 反斜杠 **\**，特别地正斜杠 **/** 不需要转移，可以直接 cout 打印出来
6. include 当前工程目录的头文件，需要使用 #include "header.h"，不能使用 #include <...>，当前工程路径不再系统的搜索路径，特别地，.h 通常是区别用户定义的头文件，系统的 C++ 头文件没有 .h 这个后缀
7. **cout** 打印输出
``` C++
cout << hex << 11; /* b 16 进制打印 */
cout << dec << 11; /* 11 10 进制打印 */
cout << oct << 11; /* 13 8 进制打印*/
cout << showpos << 123; /* +123 打印了符号 */
/* 特别地 cout 的打印还有继承性，如果在一个地方修改了打印 16 进制，如果需要 10 进制打印，还需要手动 dec 调整 */
/* 和如下等价 */
cout.setf(ios::showpos); /* ios::showpos flag 标志 */
cout << 123;
/* 不打印符号 */
cout.unsetf(ios::showpos)
cout << 123;
/* 大写打印 */
cout << uppercase << "abc"; /* ABC */
/* 小写打印 */
cout << nouppercase << "ABC"; /* abc */
/* 设置以及返回浮点数的精度 */
int precision(int n);
int precision() const;
/* 如果想要打印 bool 变量的 true 或者 false,那么需要 setf(boolalpha) */
bool ok(true);
cout << boolalpha << ok << endl;
```
8. **ios** 输入输出流
|流名称|流描述|
|---|---|
|cin| Object of class istream to control standard input|
|cout| Object of class ostream to control standard output|
|cerr| Object of class ostream to control unbuffered error output|
|clog| Object of class ostream to control buffer|
9. **cin** 格式化输入
``` C++
cin.sync(); /* 清除输入 */
cin.clear(); /* 清除错误标志 */
```
10. 可以使用 **get() 和 put()**，读或者写一个单一字符
``` C++
char ch;
cin.get(ch); /* 从命令行获取一个字符保存到 ch */
cout.put(ch); /* 将 ch 字符打印出来 */
```
11. **>>** 符号只能读取一个单词到 string,如果想获取一整句的话，那么需要使用函数 **getline()**
``` C++
getline(cin, text); /* 读取一整句话，直到遇到 '\n' */
getline(cin, s, '.'); /* 读取一整句话，直到遇到 '.' + 回车 */
```
12. a++ 的优先级比 ++a 的优先级高； **&&** 优先级比 **||** 高
13. **building block** 编译块
``` C++
{
    /* building block */
}
```
14. **,** 具有最低的运算符优先级
``` C++
int x = (a = 3, b = 4, 12); /* 以 , 隔开的最后的值是这个表达式的值， x = 12 */
```
15. 宏不能被定义两次，重复定义时需要先通过 #undef 取消定义
16. 浮点数类型转换的时候：
	1. 正数，需要加 0.5 取整
	2. 负数，需要减 0.5 取整
17. **标准的 string 类可以使用 <= >= < > + += == 这些运算符**
``` C++
string s("abcdef");
s.erase(4, 6); /* 删除从第 4 个字节开始长度 6 个字节的内容 */
s.erase(5); /* 删除从第 5 个字节开始到结束的所有内容 */
s.find("a"); /* 返回第一个字符串 a 出现的位置 */
s.rfind("a"); /* 返回最后一个字符串 a 出现的位置 */
s.at(0); /* 等价 s[0] ，获取字符串 s 的第一个字符 */
```
18. **inline** 函数定义， inline 函数会在编译过程展开为多个副本，这是和一般函数最大的区别，内联函数和宏定义相比，可以进行一些规则检查
``` C++
inline void hello()
{
    cout << "hello";
}
```
19. 函数可以添加默认参数，这样 **在调用的时候，可以不传递这些默认参数**
	1. 默认参数后续的参数也要带有默认参数，否则在编译阶段就不会成功
	2. C++ 支持函数重载，函数名称可以一致，但是参数列表不同，也可以！！！，函数签名包含参数的数量和参数类型，不包含返回值类型
20. **namespaces** 为了避免命令全局对象时冲突
	1. :: 符号引用的变量属全局变量，不属任何 namespace
``` C++
namespace myspace
{
    int title = 1;
}

namespace yourspace
{
    int title = 2;
}

int title = 3;

int main()
{
    using myspace::title;

    cout << myspace::title;
    cout << yourspace::title;
    cout << ::title; /* 全局变量等 3 ，不属任何 namespace */
}
```
21. 存储类的区别
|keyword|描述|
|---|---|
|extern||
|static||
|auto||
|register||
22. object 对象视野
	1. block scope: 定义的代码块有效，局部变量，一般是自动变量
	2. file scope: 在定义的文件区域（或者说模块区域）有效
	3. program scope: 在整个程序范围有效， namespace 细分了 program scope
23. 引用和指针
	1. 引用类似给变量起别名，不会占用额外的内存空间，方法 T& a; 定义了一个 T 变量类型的引用 a， 引用在定义时必须初始化.引用作为函数参数的时候，传递的实际是地址，所以函数对该对象的修改不仅仅在函数内部.
	2. 如果为了不修改引用的值，那么可以使用 const 限定传递的参数只读.
	3. 引用也可以作为函数返回值.
	4. 引用变量在定义的时候必须初始化，不能定义后在修改引用变量.
	5. + += *= 这些操作符返回左边操作数的引用
``` C++
float x(12.3);
float &rx = x; /* 定义了一个 x 的引用 rx */
/* 导致的结果是 rx 变化时候， x 也会变化 */
```
24. 类定义
	1. 类成员默认是 private 类型的，除非显式声明为 public
	2. struct 和 union 是特殊的 class,成员默认是 public 的，除非显式声明为 private
	3. :: 是域操作符
25. 方法
	1. 构造方法没有 **返回值， void 都没有** ，构造方法的名称要和 **类名称一致**
	2. 构造方法通常是 public 的，构造方法支持重载
	3. 如果一个构造方法只有一个参数，那么可以通过 = 符号直接给这个类对象赋值，会调用到这个一个参数的构造方法
	4. 不带参数的构造方法称为默认的构造方法，如果没有指定构造方法，编译器会创建一个默认的构造方法，但是不会使用这个隐含的默认构造方法初始化变量！！！
	5. 析构方法，每一个类有且只有一个析构方法，并且析构方法没有参数,在 object 的生命周期结束时，会自动执行这个类的析构方法
	6. 频繁地调用很短的方法会影响系统的性能，产生很大的开销，所以引入了 inline 方法来降低频繁调用短方法，类似定义 inline 函数, inline 方法分为显式和隐式定义
		1. 显示定义 inline 方法
		``` C++
			inline void ABC::hello()
			{
			...
			}
		```
		2. 隐式定义 inline 方法,没有 inline 关键字，定义在 class 内部
		``` C++
			class ABC
			{
    			void hello()
    			{
    			...
    			}
			}
		```
``` C++
class ABC
{
    public:
	ABC(int);
	ABC(int, int);
	void hello(void);
	static int num;
	static int getnum();

	private:
	int age;
	int acount;
}

/* 构造函数定义 */
ABC::ABC(int a, int b)
{
    age = a;
	acount = b;
}

ABC::ABC(int a)
{
    age = a;
	acount = 1;
}

ABC a(1); /* 等价 ABC a = 1; 这个构造方法只有一个参数 */
```
	7. Access 方法简单来说就是对 private 数据包装了一层 public 的方法，可以访问 private data 成员
	8. 只读方法的定义是在函数声明的结尾添加 **const**
	9. copy 构造函数方法,当一个类对象是函数参数的时候，在调用这个函数的时候，也使用了 copy 构造方法
	``` C++
	ABC a1(1);
	ABC a2(a1); /* a2 对象等 a1 */
	```
	10. object 也可以直接赋值，使用 **=**
	11. 类的方法通过 this 指针访问这个类 object 的所有成员
	12. 函数可以通过返回 object 的引用或者 copy（类似是重新定义一个 object 变量返回） 来返回一个 object，也可以返回一个 object 指针
26. 成员对象
	1. **static** 静态成员对象对一个类来说占用的内存空间只有一份，就像成员函数一样,不管定义多少个类的 object,这个类 static 的变量仅有一份，类似在是这个类的全局变量，访问这个变量使用的是域操作符 **::**,静态变量使用在 **必须初始化（在 class 之外初始化： int Class::aount; 否则会报编译错误）**
	``` C++
	int ABC::num = 1;
	```
	2. 构造函数初始化成员可以写为：
	``` C++
	ABC::ABC(int a):age(a),acount(a)
	```
	3. 因为 static 成员变量独立 object,所属这个 class,所以如果将一个 static 便另至为 private 类型，那么需要使用 static 方法访问这个 static 变量,static 方法可以使用类的域操作符访问， ABC::getnum()
	4. 定义在 class 的枚举，只在这个 class 可以直接使用
27. 数组
	1. 数组的成员也可以是类的对象，这时候就称之为 class array
28. **virtual 函数**（虚函数是 C++ 中用于实现多态(polymorphism)的机制。核心理念就是通过基类访问派生类定义的函数。）
	``` C++
	class A
	{
	public:
	    virtual void foo() { cout << "A::foo() is called" << endl;}
	};
	
	class B: public A
	{
	public:
	    virtual void foo() { cout << "B::foo() is called" << endl;}
	};
	
	A * a= new B(); /* 动态联编!!!,一个类函数的调用不是在编译的时候确定的，是在运行的时候确定的,因为在编写代码的时候不确定被调用的是基类的函数还是哪个派生类的函数，所以被称为虚函数,虚函数只能借助 **指针和引用** 来达到多态的效果 */
	a->foo(); /* 执行的 class B 的 fool 成员函数 */
	```
	1. 切记动态联编只能借助指针和引用来实现，特别是在嵌入式交叉编译的时候，[~~虽然在 PC 上定义静态变量也可以，但是不要按照规范来用！！！~~]
	2. **多态** 同一代码产生不同效果
	``` C++
	void bar(A *a)
	{
		a->fool(); /* 单看这里是无法确定执行的是基类的 A 的 fool() 函数还是 B 的 fool() 函数，需要在执行的时候确定传递的指针是指向 A 的指针还是  B 的指针,这种同一代码产生不同效果的特点被称为 **多态** */
	}
	```
	3. 虚函数具有继承性，如果基类定义了虚函数，纵使派生类定义这个函数的时候没有添加 virtual 关键字，但是这个函数在派生类中也算是虚函数
	4. 纯虚函数,纯虚函数的意思是：我是一个抽象类，不要将我实例化，纯虚函数用来规范派生类行为，实际就是所谓的“接口”。它告诉使用者我的派生类都要有这个成员函数,否则的话会编译错误
	``` C++
	class A
	{
    public:
	    virtual void foo()=0; /* =0 标志一个虛函数为纯虚函数 */
	}
	```
		1. 析构函数也可以是虚函数，甚至可以是纯虚函数，如果一个类被当作其他类的基类时，这个类的析构函数必须是虚函数(否则在析构的时候不会执行到派生类的析构函数！！！)，并且析构的顺序是先析构派生类，再析构基类。
		2. 构造函数不能是虚的
29. 友元函数和友元类，目的是为了在类的成员函数外部直接访问类的私有成员，而不是必须通过类的成员函数。相当说是：朋友是值得信赖的，所以可以对他们公开一些自己的隐私
    1. 友元函数
        1. 全局函数定义为友元的方法
    ``` C++
        friend 返回值类型 函数名(参数列表)
    ```
        2. 将其他类的成员函数定义为友元的方法（备注：不能将其他类的私有成员定义为友元函数）
    ``` C++
        friend 返回值类型 其他类名::成员函数名(参数列表)
    ```
    2. 友元类，class driver 是 class car 的友元，class driver 的所有成员函数就可以访问 class car 的私有成员
    ``` C++
    class car {
        friend class driver;
        private:
            int prive;
    }

    class driver {
    public:
        car myCar;
        /* 改装汽车 */
        void modify_car()
        {
            /* 因 driver 是 car 的友元类，故此处可以访问其私有成员 */
            myCar.price += 1000;
        }
    }
    ```
30. C++ 调用 C 函数方法，由于编译器生成函数的机制不一样，所以需要经过特殊处理，才可以调用，调用C语言的函数，需要在函数声明的地方语句 **extern "C"**。如果不使用该语句，在链接的时候，编译器就会报错误， C++ 预编译的时候会自动添加预处理器定义 **__cplusplus**，可以通过该宏编写一个自适应的头文件：
``` C++
extern "C" void hello(void); /* 这样定义才可以正常在 C++ 函数调用到 C 函数定义的 hello 函数 */

#ifdef __cplusplus
{
#endif
函数定义...
#ifdef __cplusplus
}
#endif
```
31. 数组和指针
	1. 在 C++ 如果希望通过 cout 打印出 char *类型的指针保存的地址值，那么可以使用 (void *) 强制类型转换这个指针.原因是 void * 类型的对象重载了 << 操作符号，实际测试 int * 等也是可以的
	2. **char * environ* 是系统环境变量缓冲区的头指针
32. 文件输入和输出基础
	1. fstream 继承 iostream， ifstream 继承 istream，ofstream 继承 ostream，需要添加 fstream 头文件
