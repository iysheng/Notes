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
