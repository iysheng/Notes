### **C++ 学习笔记**
1. hex 可以在 cout 语句格式化 16 进制输出
``` C++
cout << "value=" << hex << 15 << endl; /* 打印是 f */
```
2. 8 进制和 16 进制的表示方法，特别地如果使用 8 进制来表示转义字符，那么建议使用 3 个字节的数字，eg：\033 而不是使用 \33，避免奇怪的问题
``` C++
\ooo /* 八进制表示（最多 3 个 8 进制值表示一个字节 eg: \111 表示 16 进制的 49, 'I'） */
\xhh /* 16 进制表示，eg \x12 表示 0x12 ，在字符串中使用比较方便 */
"abc\x12" /* 保存在内存对应的是 'a' 'b' 'c' 0x12 '\0' */
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
    * std::to_string(xxx) 函数可以将整数转换为 string 类型
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
	3. 因为 static 成员变量独立 object,所属这个 class,所以如果将一个 static 变量定义为 private 类型，那么需要使用 static 方法访问这个 static 变量,static 方法可以使用类的域操作符访问， ABC::getnum()
	4. 定义在 class 的枚举，只在这个 class 可以直接使用, 在这个类之外使用使前面需要添加这个 类名字::
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
	4. 纯虚函数,纯虚函数的意思是：我是一个抽象类(纯虚类，包含一个或多个的纯虚函数的类，纯虚类不能声明对应的对象，即不能将其实例化！！！)，不要将我实例化，纯虚函数用来规范派生类行为，实际就是所谓的“接口”。它告诉使用者我的派生类都要有这个成员函数！！！,否则的话会编译错误
	``` C++
	class A
	{
    public:
	    virtual void foo()=0; /* =0 标志一个虛函数为纯虚函数 */
	}
	```
		1. 析构函数也可以是虚函数，甚至可以是纯虚函数，如果一个类被当作其他类的基类时，~~这个类的析构函数必须是虚函数(否则在析构的时候不会执行到派生类的析构函数！！！)~~，并且析构的顺序是先析构派生类，再析构基类。
		2. 构造函数不能是虚的
	5. 多态（polymorphic）是指，当一个 virtual 函数在执行时，对应版本的方法执行的是这个对象真实的引用对象（即可能是派生类的而不是基类的），多态要求被访问的对象的方式是指针或者引用，并且具体的对象类型只有在程序执行的时候才确定下来
	6. 虚函数不是必须要在派生类重新定义，虚函数具有继承性，派生类会继承基类的虚函数
	7. 构造函数不能是虚函数，但是析构函数可以是虚函数，并且可以是纯虚函数
	8. 如果仅仅在派生类定义了虚函数，基类没有定义虚函数，那么基类定义的不是虚函数
	9. 虚函数实现多态是根据 **virtual method table** 实现的，根据 **VMT** 可以找到某一个类的所有虚函数入口地址
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
	1. fstream 继承 iostream， ifstream 要执行读动作， 继承 istream，ofstream 是要执行写动作的，继承 ostream，需要添加 fstream 头文件
	2. 判断一个文件流是否正常打开，除了可以使用 if (!文件流名称) 之外还可以使用文件流的方法函数 if (文件流.fail())，特别地如果是在 read 的时候出错了，有可能是到达了文件的结尾，这时候可以通过 if (文件流.eof()) 方法判断是否到达了文件结尾
	3. 对文件流来说，close 方法不是必须显式调用的，在程序正常退出或者文件流析构函数的时候会自动关闭这个文件流
	4. 文件流的 is_open() 方法来判断当前文件流是否打开了
	5. 调用 exit() 函数的时候，是在显式推出当前程序，此时也会自动关闭打开的文件流
	6. write() 方法返回的是执行这个文件流的引用，通过这个返回值可以判断是否 write() 成功
	7. ofstream 对象构造时候，如果指定目录的文件不存在，那么会自动创建这个对象，使用 ifstream 和 fstream 流对象构造时，如果当前文件不存在，那么不会自动创建这个文件，这时候需要显式使用 open 函数创建这个文件
	8. 如果一个文件流读取到了文件结尾，那么通过 tellg 获取的输入文件流的位置总是 -1 而不是真实的位置，此时需要首先通过 clear() 方法清除掉错误标记，然后在执行 tellg() 才可以获取到真实的位置信息，也就是文件结尾的位置信息，然后可以通过方法 seekg() 修改输入流的位置， seekp 修改输出流的位置，tellp() 是获取输出流的位置，特别地，seekg 和 seekp 在修改位置信息时，涉及到的三种相对位置描述
		1. 文件流.beg 开头位置
		2. 文件流.cur 当前位置
		3. 文件流.end 结尾位置
33. 运算符重载
	1. 运算符重载可以让你对 class 的对象执行现存的运算符处理
	2. 
34. 引用传递作为函数参数，在函数内部的修改是可以影响到这个参数本身的值的，类似指针传递一样
35. 为什么交叉编译器时候，全局的对象不是执行默认的构造函数，应该是在嵌入式设备初始化的时候缺少了初始化 c++ 语言构造函数初始化部分代码（需要在链接脚本中定义这部分内容，并且代码执行的时候，显式执行一部分代码）
36. protected 类型的成员
	1. 和 private 类型对象一样不能直接被这个类的对象访问
	2. 和 public 类型对象一样，基类的派生类的成员可以访问基类的 protected 成员
	3. 此外， protected 类型对象还有一个重要的属性，派生类的对象只能通过派生类的成员（**不能通过派生类对象指针或者引用访问!!!**）访问基类的 proteced 类型对象，派生类没有其他的方法访问基类对象的 protected 成员
37. 符号重载
``` C++
/* operator(运算符) */
class A
{
	private:
		int a;
	public:
		A operator+(const A &a1)
		{
			A temp;

			temp.a = a + a1.a;

			return temp;
		}
}

A a1, a2, a3;
a3 = a1 + a2;
/* 等价如 */
a3 = a1.opeartor+(a2);
/* 等价如 */
a3 = a2.opeartor+(a1);
```
38. 类的类型转换，C++ 支持不同类之间类型转换、也支持类和基本的数据类型间的类型转换
	* 转换构造函数，将其他类型转换为当前类的类型，即构造函数
	* 转换函数，将当前类转换为其他类型，转换函数一般都定义为当前类的一个成员函数，格式一般为**operator 类型(void)const{/* TODO */}**
39. 动态内存分配，C++ 使用 new 和 delete 动态申请和释放内存，如果不 delete 那么内存会一直占用，直到程序终止， 如果 delete 一个 NULL 指针，那么 delete 什么也不做直接返回，所以 delete 的时候不用检查是否为 NULL 指针。new 不出足够多的内存的时候，会抛出异常，任何没有被捕获的异常都会导致程序终止。delete 的时候，会首先调用析构函数，然后才释放内存
	* delete [] pArr; /* 删除一个数组的动态内存空间，[] 表示释放这整个数组的内存空间，而不单单是删除这个数组的一个对象 */
	* new [] /* 符号，动态申请一个数组 */
40. C++ 中定义 C 函数，方便外部函数调用
    * extern "C" void test_func(void) /*  这种方法对外部 C 文件调用比较友好,因为这样编译后，对应的函数符号还是 test_func, 如果有过个 C 函数，可以使用 extern "C" { C 函数定义 } */
    * void test_func(void) /* 如果使用这种方法定义这个函数，对应的符号名称会被重编，会变成类似 **_Z9test_func** 这样的符号，所以外部 C 文件执行通过 test_func 是调用不到这个函数的 */
41. [模板](https://en.cppreference.com/w/cpp/language/templates)
	* template < parameter-list > requires-clause(optional) declaration <> 符号一般用在模板中，表示模板参数， 尖括号
42. ``c++filt`` 可以将被 c++ 编译器编译后修改的符号名给反编译
43. C++ 的 goto 语句之前不能有变量定义，否则编译时候会报错。
44. std::vector 实质是 C++ 的一个类，和数组类似，但是 vector 的优势是可以动态扩展，不需考虑其内存大小。vector 是一个封装了动态大小数组的顺序容器。跟其他类型容器或者向量一样，能够存放各种类型的对象。可以简单认为 vector 是一个能够存在任意类型的动态数组。
    * push_back(elem) 尾部插入元素 elem, 比如原始 vector 的大小为 5, push_back 之后,大小会增加到 6
    * pop_back() 删除最后一个元素
    * clear() 删除容器中所有元素
    * at(int idx) 返回 idx 索引指向的数据
    * operator[idx] 返回 idx 索引指向的数据
    * front() 返回容器的第一个数据就元素
    * back() 返回容器的最后一个元素
    * void resize (size_type n) 修改 vector 大小为 n 个元素
    * void resize (size_type n, const value_type& val) 修改 vector 大小为 n 个元素，如果之前不足 n 个，那么使用 val 补全到 n 个
    * emplace_back(args) 使用 args 参数创建一个对象，插入这个向量的尾部
    * emplace(positon, args) 使用 args 参数创建一个构造函数，插入这个新的对象到 position 指定的位置
    * 定义二维向量 r*c 的方法: vector<vector<int> > ans(r,vector<int>(c));// 行数为:ans.size(),列数为:ans[0].size();
    * size() 返回容器包含元素的数量
45. auto 关键字，auto 的原理是根据后面的值，来推测前面的类型是什么, 一般用来简化变量初始化
46. to_string(数据) 将数据转换为 string 类型
47. Run-time type identification (RTTI) 运行时类型标识,通过两个操作符:
    * typeid() 返回指定表达式的类型
    * dynamic_cast() 转换基类到派生类,有下述三种表述方式(根据我实际测试发现，并且基类必须至少包含一个虚函数,否则会编译报错), 下述 e 必须是 type 的 public 派生类、e 或者是 type 的 public 基类，或者是和 type 类型一样。
        1. dynamic_cast<type*>(e) // 如果转换不成功会返回 0, e 必须是一个指针
        2. dynamic_cast<type&>(e) // 如果转换不成功会返回(抛出) std::bad_cast, e 必须是一个左值
        3. dynamic_cast<type&&>(e) // e 一定不能是左值
48. **lambda** 表达式,一般用来定义匿名函数,使代码更加灵活简洁。lambda 表达式，完整的表示式: [capture list](parameter list) -> return type { function body } ~~[captures]<tparams>(params)lambda-specifiers{body}~~, 可以忽略 parameter list 和返回类型，但是一定要有 capture list 和 function body. 和普通的函数不一样，lambda 表达式可能没有默认的参数。
    * captures 捕获列表，lambda可以把上下文变量以值或引用的方式捕获，在body中直接使用。实际编译器会将写的 lambda 表达式翻译成一个类，用重载实现 operator() 函数实现。捕获列表，可以认为是这个类的 private 成员。
        1. [] 什么也不捕获, 不会从上下文中(一般是函数的局部变量)捕获内容
        2. [&] 按照引用的方式捕获所有变量
        3. [=] 按值的方式捕获所有变量
        3. [=,&a] 除了 a 之外，按值的方式捕获所有局部变量，变量 a 使用引用捕获,这里可以引用捕获多个。例如[=,&a,&b,&c]。这里注意，如果前面加了=，后面加的具体参数必须以引用的方式来捕获，否则会报错
        4. [&,a] 除了 a 之外，按引用的方式捕获所有局部变量，变量 a 使用值的方式来捕获，这里也可以捕获多个
        5. [a,&b] 以值的方式捕获 a,以引用的方式捕获 b，也可以捕获多个
        6. [this] 在成员函数中，也可以直接捕获 this 指针，
    * tparams 模板参数列表(c++20引入)，让lambda可以像模板函数一样被调用。
    * params 参数列表，有一点需要注意，在c++14之后允许使用auto左右参数类型。参数列表可以认为是重载实现的 operator() 函数的形参列表
    * lambda-specifiers lambda说明符， 一些可选的参数
    * trailing-return-type 返回值类型，一般可以省略掉，由编译器来推导, 重载函数 operator() 函数的返回值
    * body 函数体，函数的具体逻辑, 重载函数 operator() 函数的函数体
49. std::remove(begin, end, value) remove 实际是一个模板,删除 [begin, end) 之间所有等 value 的对象,返回的是指向下一个不等 val 的对象！！！
    * a b c target d target e  eg: 如果 remove target ->(整理后为) a b c d e target e -> 返回的是指向整理之后 target 的内容
50. R"(原始字符)" raw string, 不会对原始字符进行转义, raw string 的语法 **R"delimiter( raw_characters )delimiter"** // delimiter is the end of logical entity, 其中分割符是可选的，但不可以是 / 、空格、以及() 符号.
    * R"(Hello \n china)"
    * R"a()")a" 这时候就用到分割符了，因为原始字符串内部包含有 )"序列，为了避免错误，就需要显示定义原始字符串的边界,但是新的编译器好像也可以自动识别，不用分割符也可以, 所以记住 R"(原始字符串就可以)"
51. printf 格式打印
    1. %g 表示 signed double 型数据打印
52. c++ 有 std::thread 多线程类,可以方便创建多线程
    ``` cpp
    void f1(void *){};
    void *abc=NULL;
    std::thread t1(f1, abc); // 必须要加参数
    t1.detach();
    ```
53. std::unique_ptr 是一个类模板(Smart Pointer)，与之对应的还有一个 std::shared_ptr，包含了一个管理的对象和一个删除方法
    * get 成员函数，返回管理的对象
54. std::pair is a class template that provides a way to store two heterogeneous objects as a single unit.(std::pair 是一个类模板，提供了一种将两种不同的对象存储到一个单元中的方法)
    * first 成员，返回的是 pair 的第一个元素
    * second 成员，返回的是 pair 的第二个元素
55. 类模板
    * 既可以在类模板内部定义成员函数，也可以在类模板外部定义成员函数，且定义在类模板内的成员函数被隐式声明为内联函数
    * 在类外部定义类模板的成员函数时，必须以 template 开始，后接类模板参数列表，和普通函数一样还要加上所属的类名，比如在类中声明的成员函数
    ``` C++
    template <typename T> class Blob
    {
        public:
        T sum(T a, T b);
    }
    template <typename T>
    T Blob<T>::sum(T a, T b)
    {
        return a + b;
    }
    ```
    * 类模板的成员函数只有当程序用到它时才进行实例化
    * 新标准允许为类模板定义一个类型别名：``template <typename T> using redBlob = class Blob;``
    * 不能在类内部初始化非 const 的静态成员
    * 因为参数名不能重用，所以一个模板参数名在一个特定的模板参数列表中只能出现一次
    * 模板声明必须包含模板参数，可以只声明不定义模板, 并且定义时的模板参数和声明时候的模板参数名字不必一样
    * C++ 语言假定通过作用域运算符访问的名字不是类型，因此如果我们希望使用一个模板类型参数的类型成员，必须显式告诉编译器该名字的是一个类型，这时候就需要使用关键词， **typename** 来实现, 这时候只能使用 typename
    * 可以提供默认模板实参，即在定义模板参数时候初始化一个默认的模板参数,和模板默认实参一样，对一个模板参数来说，只有当他右侧的所有参数都有默认实参时，他才可以有默认实参数
56. Smart Pointer (两种类型，用来智能地申请和释放动态内存，或者叫做堆区的内存)
    * shared_ptr ： 允许多个指针指向相同的对象, 还定义了一个伴随类 weak_ptr 是 shared_ptr 的弱引用
    * unique_ptr ： 只能允许同一个指针指向同一个对象
    * 安全使用 smart_pointer 的方法是使用函数 make_shared() 函数给 smart pointer 变量赋值 ``std::unique_ptr<object> p1 = make_shared<object>(xxxxxx);``
57. 通过将函数参数设置为 const 的引用，保证函数可以用于不能拷贝的类型
58. inline 关键词放在模板参数列表之后， constexpr 也是这样，并且 constexpr 类型的函数可以将其用到 const 表达式
59. 成员模板: 一个类可以包含本身是模板的成员函数，这种成员被成为成员模板(member template),成员模板不能是虚函数
60. std::map 类模板: std::map<int index, string value>
    * [] 重载的这个符号,可以获取指定的 index 的内容 ， std::pair<std::_Rb_tree_iterator<std::pair<const int, std::__cxx11::basic_string<char> > >, bool>
61. 类特殊的构造/析构函数，一个类有五种特殊的成员函数来控制这些操作。拷贝和移动构造函数定义了当用同类型的另一个对象初始化本对象时做什么，拷贝和移动赋值运算符定义了将一个对象赋予同类型的另一个对象时做什么。以 class Foo { } 为例
    * 拷贝构造函数， Foo(const Foo&) // 拷贝构造函数的第一个参数必须是同类型的一个引用, 如果没有为一个类定义拷贝构造函数，编译器会为我们定义一个合成拷贝构造函数
        * 拷贝初始化：直接初始化时，实际上要求编译器使用函数匹配的方式来选择和我们提供的参数最匹配的构造函数，而在使用拷贝初始化时，要求编译器将右侧运算对象拷贝到正在创建的对象中，如果需要还要进行类型转换，拷贝初始化通常使用拷贝构造函数来完成。但是，如果一个类有一个移动构造函数，则拷贝初始化有时候会使用移动构造函数而非拷贝构造函数来完成。
        * 拷贝初始化，不仅在用 = 符号时会发生，在下列情况也会发生：
            * 将一个对象作为实参传递给一个非引用类型的形参
            * 将一个返回类型为非引用类型的函数返回一个对象
            * 用花括号列表初始化一个数组中的元素或聚合类的成员
    * 拷贝赋值运算符
        * 和类控制其对象初始化一样，类也可以控制其对象如何赋值，如果一个类未定义自己的拷贝赋值运算符，编译器会为他生成一个合成拷贝赋值运算符
        * 和拷贝构造函数类似，可以给函数 = delete // 使用 = delete 来指出我们希望将他定义为删除的函数，即实现阻止赋值运算或者说是拷贝运算, 和 delete 对应的，可以使用 = default 设置合成默认的构造函数
    * 移动构造函数
    * 移动赋值运算符
    * 析构函数：定义了此类型对象销毁时做什么
62. 重载运算符本质上是函数，其名字由 **operator 关键字后接要定义的运算符**的符号组成。因此，赋值运算符就是一个名为 operator= 的函数。**特别地，赋值运算符应该返回一个指向其左侧运算对象的引用**。和其他函数一样，运算符函数也有一个返回类型和一个参数列表。
63. 构造函数后的冒号有两个作用：这个冒号定义的是 **member initializer list**
    1. 初始化类的成员对象，或者叫做成员变量
    2. 调用基类的构造函数进行初始化
64. 可以通过是否定义 ``__cplusplus`` 宏来确定是 c++ 还是 c 语言
65. 函数声明的尾部添加 noexcept 关键词表示这个函数不会抛出异常， 比如 ``void test(int) noexcept; // 不会抛出异常``
66. std::chrono  是 cpp 的 一个时间库,在这个库中，处理时间有三个概念：
	* Durations： 持续时间, 计算时间跨度，可以是分钟，小时或者毫秒, 使用的是 duration 这个类模板，有一个数量的表示和一个单位的表示，比如 10 毫秒，数量就是 10, 单位是毫秒
	* Time points：时间点,使用的是 time_point 这个类模板
	* Clocks: 时钟,一个描述将 time_point 转换为物理时间的框架
67. 函数传递引用和指针的区别:
    * 传递引用会进行类型检查,引用不可以为空,引用过程会进行类型检查,所以引用是类型安全的
    * 引用传递和指针传递都会对传入的数据内容修改
68. 枚举类的使用
``` cpp
enum class animal {dog, cat};

animal a0 = animal::dog;

// 传统的枚举
enum animal{dog, cat};

auto a1 = dog;
```
69. map 分类
* std::unordered_map:底层是哈希表,无序的
* std::map:底层实现是红黑树
* std::multimap:底层实现是红黑树
70. C++ 编译器版本控制
    * g++ -std=c++11 /* 强制使用 c++11 版本 */
    * #pragma once   /* pragma 编译指示 */
71. std::list<> 模板类,功能比较强大的链表类
72. std::stack<> 模板类,栈类
73. std::chrono
74. 针对 cpp 定义有返回值的函数，如果没有 return 语句，会出现奇怪的现象，所以一定要在函数中写上 return 返回值语句.
75. 初始化变量的 int def{123}; // 初始化 def 为 123；这种写法支持 C++， C 语言不支持
76. 一些关键关键词
    - ``decltype`` 关键词用来获取指定数据的类型
    - ``constexpr`` 关键词用来声明一个函数，在变量是常数表达式，可以在编译过程计算结果，加快效率
77. set 集合是一个关联容器，包含``对唯一key序列化``之后的结果，重点是 insert 到 set 之后，会自动给你排序哦。有一些关键的属性，如下：
    1. 可以自定义集合的元素类型 ``set<struct abc>``
    2. 可以自定义对比函数 ``std<struct abc, decltype(&funccompare)> xxx(funccompare)``， 还有一些其他写法列举如下：
        ```C++
        #include <set>
        struct abc {
            int index;
            int counts;
            abc(int i, int c):index(i), counts(c){};

            // 注意，这里的 const 不能少，否则编译会提示重载出错，编译不通过
            bool operator<(const abc rhs) const {return counts < rhs.counts;};
        };

        set<struct abc> demo0;

        // 定义函数
        bool compare_abc(struct abc lhs, struct abc rhs)
        {
            return lhs.counts < rhs.counts;
        };

        set<struct abc, decltype(&compare_abc)> demo1(compare_abc);// 必须用 demo1(compare_abc) 实例化自定义 set 类型的比较大小函数

        // lambda 表达式
        auto func1=[](struct abc lhs, struct abc rhs){ 
            return lhs.counts < rhs.counts;
        };

        set<struct abc, decltype(func1)> demo2(func1);

        // 仿函数：是一种重载了 operator() 符号的类或结构体，它可以像函数一样被调用。
        struct def{
        // 注意：这个 const 也不能省略，否则编译会出错
            bool operator()(struct abc lhs, struct abc rhs) const {
                return lhs.counts < rhs.counts;
            };
        };

        set<struct abc, struct def> demo3;
        ```
    3. 获取 `` set<int> abc `` 中的第一个和最后一个元素
        - 第一个元素: ``*abc.begin()``
        - 最后一个元素: ``*--abc.end()``
    4. 使用 for 循环迭代器对 set 这类变量进行迭代，示例如下：
        ``` C++
        #include <set>
        #include <iostream>

        using namespace std;
        set<int> demo4 = {1,2,3};
        int main()
        {
            for (auto item:demo4)
            {
                cout << item << endl;
            }
            // 等价如下
            for (auto i = demo4.begin(); i != demo4.end(); i++)
            {
                auto item = *i;
                cout << item << endl;
            }
            return 0;
        }
        ```
    5. 重载 ``<<`` 符号示例：
        ```cpp
        #include <set>
        #include <iostream>
        #include <string>

        using namespace std;
        struct abc{
            string name;
            string id;
            int index;
            bool operator<(const struct abc rhs) const
            {
                return index < rhs.index;
            }
        };
        set<struct abc> demo5 = {{"RED","123",1}, {"BLUE", "abc", 0}};

        ostream& operator<<(ostream &os, struct abc item)
        {
            return os << item.name << "->" << item.id;
        }

        int main()
        {
            for (auto item:demo5)
                cout << item << endl;

            return 0;
        }
        ```
78. ``#include <algorithm>`` cpp 提供了一些算法模板在这个头文件中，比如 find，默认 vector 是不支持 find 的，使用模板的 find 函数可以完成查找
    ``` cpp
    #include <algorithm>
    #include <iostream>

    using namespace std;

    vector<int> test = {1,2,3};

    int main(void)
    {
        int i = 0;

        for (; i < test.size(); i++)
        {
            cout << test[i] << endl;
        }

        if (test.end() != find(test.begin(), test.end(), 3))
        {
            cout << "catchde" << endl
        }

        return 0;
    }
    ```
79. 类定义后都要添加符号 ;
    ``` cpp
    class a {

    };

    class b {

    }
    ```
