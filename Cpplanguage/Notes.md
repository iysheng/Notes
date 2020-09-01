---
### C++ 学习笔记
#### 第二章 数据类型
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
```
8. **ios** 输入输出流
|流名称|流描述|
|---|---|
|cin| Object of class istream to control standard input|
|cout| Object of class ostream to control standard output|
|cerr| Object of class ostream to control unbuffered error output|
|clog| Object of class ostream to control buffer|
