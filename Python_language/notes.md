### 读书笔记
python 具有大量的内置函数,用来处理不同类型的数据.python 是面向对象的语言.每一个数据和函数都可以称之为对象.面向对象区别之前的面向过程的语言.面向过程的语言数据和方法在语言中没有关联起来.
1. print 函数的 sep 参数，用来设置 print 的打印分隔符，默认是' '，空格
``` python
print('a','b') # a b
print('a','b',sep='') # ab
```
2. youcompleteme 安装 python 补全引擎**python-jedi**
```bash
sudo pacman -S python-jed
# 为了修改 vim 自动将当前路径添加到当前工程还需要修改 .vimrc 的配置
```
3. **help** 函数可以查看某一个模块的所有信息，比如定义的方法、变量等内容，help(待查询的函数)
``` bash
>>> help(str.join)
Help on method_descriptor:
join(self, iterable, /) # 参数列表中的 / 符号表示的限制参数列表的数量,不是真正意义的函数参数
```
4. 给变量赋值前加 r，表示后续内容不需要转义，eg A=r'\t' A 的值不会被转义为 tab
5. if 判断
``` python
if a == 1:
    do sth1
elif:
    do sth2
else:
    do sth3
```
6. python import 其他目錄的 python 文件時，首先需要將存在 python 腳本的目錄添加
到系統的 sys 目錄，方法是 import sys 包，然後執行 sys.path.append("路徑")，然後
再 import 包文件
7. python 執行 linux 命令並且獲取返回值
``` python
ret = os.system("linux 命令")
```
8. python 復制文件 copyfile 函數，在包 shutil 中
9. pip install pip-compile-multi # 该工具支持批量安装 python 包
	* 可以将需要安装的 python 包写在文件 a.in，然后执行 pip-compile -U a.in 就可以批量安装所有的 a.in 的 python 包
10. 注释
	* 单行注释
	``` python
	# 注释语句
	```
	* 多行注释
	``` python
	'''
	注释内容
	'''
	"""
	注释内容
	"""
	```
11. **numpy** 是 python 科学计算（数学）的包
	* y = np.arange(0,0) # 创建一个空数组
	* y = np.arange(2,3) # 创建一个 2 行 3 列的数组
	* y = np.append(y, 123) # append 函数是在数组 y 后追加内容 123, **重点需要将返回值赋值为 y**，否则起不到追加的效果
12. 对 str 类型变量 a 为例子
	* a.isdigit() 判断 a 是否只包含数字
	* a.isalpha() 判断 a 是否只包含字母
	* a.isalnum() 判断 a 是否只包含字母或者数字
13. int(string) # 格式化 string 类型为 int
	* int('12') # 默认转换为 10 进制
	* int('12', 16) # 默认转换为 16 进制
14. str(int) # 格式化为字符串格式
	* str(18) # 默认以 10 进制转换
	* hex(18) # 以 16 进制形式格式化为字符串
15. 绘制图形库 matplotlib.pyplot
	1. plot(x, y) # 以 x 轴和 y 轴绘制曲线图
	2. show() 显示绘制的图形
16. 字符串的内容在 ''' 字符串内容 '''
17. 字典中的变量用大括号括起来 {food}
18. **def** 是 definition function 的缩写
	``` python
	def say_sth(name):
		print (name)
	```
	* 函数的通常语法:
	``` python
		functionName (parameters)
	```
19. strting 字符串
	* format() 方法:格式化,可以替换字符串中字典变量的内容
	* 单引号 ' 定义一行的字符串,双引号中可以嵌套单引号包括的字符串
	* 三引号 ''' ''' 定义多行的字符串内容,三引号中可以嵌套双引号和单引号的字符串
20. 基本变量类型
	1. 数字: 1,2,-5
	2. 字符串: 'hello', 'who are you', python 中的字符串表示的是字符序列,必须使用引号限制字符串范围. python 解释器支持使用单引号 ' 定义字符串,还支持" ",以及 ''' '''
        * 字符串支持从后边索引
        ``` python
        a='abcdef'
        a[0] == 'a'
        a[5] == 'f'
        a[-1] == 'f'
        ```
		* 字符串支持片段截取
		``` python
		a = 'abcdef'
		a[:1] == 'ab'
		a[1:2] == 'bc'
		```
		* find() 函数可以在字符串中查找指定的字符串
		* split(sep) 以指定的字符拆分字符串,返回的是 list 类型
		* join 则是相反,将 list 类型合并为字符串类型
		* capitalize() 首字母大写,其他小写的方法
	3. lists: 可以表示组织任意类型, [1, 2, 3],['right', 'wrong', 'dog'], [[1,2], [2,3]] # list 可以互相嵌套
		* append('abc') # 直接将 'abc' 作为一个整体追加到 list 中
		* extend('abc') # 将 'abc' 拆分为 3 部分 'a' 'b' 'c' 添加到 list 中
	4. 特殊的变量,无,表示 nothing: None
	5. F-strings 是新的变量类型, python3.6 引入
	6. list 类型可以包含重复的内容,但是 set 类型就不可以,set 就是类似数学的集合,可以通过对 list 执行构造函数,提取不同的 list 成员.
	``` python
	a=[1, 2, 3, 2, 1]
	b=set(a)
	b == [1, 2, 3]
	```
	* class 是 python 基本变量类型术语,用 type 命令查看时都会返回这个关键字
	``` bash
    >>> type(1)
    <class 'int'>
    >>> type(print)
    <class 'builtin_function_or_method'>
	```
	* strings 和 lists 都是序列数据,分别是字符串序列和元素序列. len() 函数可以返回序列变量的长度,字符串拼接.支持乘法和加法
	* 变量名必须以字母开头,可以包含字母\数组\下划线
	* python 区分大小写
21. 常见函数
	1. type() # 返回对象类型
	2. int(字符串) # 字符串转 int
	3. str(整形) # 整形转字符串
	4. 除法 / 打印浮点数据结果, // 整除,只会打印整数部分
	5. print() 函数可以打印变量的内容
		* 默认情况下, print 会在每一行的结尾添加换行符,可以使用 end 关键字修改结尾字符内容
		* sep 关键字作为打印参数之间的间隔
		* 关键字的修改都要放在 print 函数的结尾处
	6. input() 函数接收键盘输入赋值给变量
	7. locals() 返回所有当前变量组成的字典
	8. range(序列大小) 自动产生常规的数字序列,一般地会讲过 range() 函数的返回值 list 化,格式化到一个 list 中. range() 直接返回的是 range 类型的数据. list(range(5)) 将 range 的输出直接格式化到一个 list
	9. count() 函数统计指定字符串出现的次数
	``` python
	'abca'.count('a') # 结果是 2
	```
	10. 内置的 dir() 函数可以列出指定对象所有的方法
	``` python
	dir('') # 列出字符串所有的方法
	dir(1) # 列出整形所有的方法
	```
	11. help() 方法查找指定对象方法的帮助文档
	``` python
	hkelpl(str.find)
	```
22. 字典,类似 KV 数据对的存储结构, python 有内置的字典类型 **dict**,提供一个 word 可以查找出他的定义
	* dict() 初始化一个空字典
	``` python
	fruit = dict()
	fruit['0'] = 'apple' # 给字典填充数据
	fruit['1'] = 'banana'
	```
23. 循环
	* for 循环
	``` python
	for count in [1, 2, 3]:
		print (count)
	```
24. python 使用下划线进行保护变量或者方法
	1. 单前置下划线
		* 阻止其他 python 脚本通过 from module import * 语句导入该名字,不会被 * 号匹配
		``` python foo.py
		def test0(x, y):
			return x + y
		def _test1(x, y):
			return x * y
		```
		不能通过 from foo import * 导入 _test1 方法,只能通过 from foo import \_test1 来导入这个方法
		* 作为类的属性名(成员名)或者方法名时,不希望下游的程序员直接访问该名字而导致意外覆盖这个属性,但是这种1情况只是一种命名约定, python 解释器不会对这种属性名做特殊处理.
	2. 前后均带有双下划线 __ 的命名,一般用来特殊的方法,用来实现对象的一些行为或者功能.
		```
		* __new__() 方法用来创建对象
		* __init__() 方法用来初始化对象
		* x + y 被映射为 x.__add__(y), 序列或者字典的索引操作 x[k] 映射为 x.__getitem__(k)
		* __len__(), __str__() 分别被内置函数 len() 和 str() 调用
		```
	3. 仅开头带双下划线 __ 的命名,用来对象的数据封装,以此命名的属性或者方法为类的私有属性或者私有方法.这种实现的机制并不严格,机制是通过自动变形实现的,类中所有以双下划线开头的名称 __name 都会自动变为 _类名__name 的新名称.
	``` python
	class Foo(object):
		def __init__(self):
			self.__name = 'private name'
		def getname(self):
			return self.__name
		def __spam(self):
			print 'private method'
		def bar(self):
			self.__spam()
	f = Foo()
	f.__name # 会报错
	f._Foo__name # 可以打印
	```
25. python 获取命令行参数
	* import sys ,使用 sys.argv 获取指定的命令行参数
	``` python
	import sys
	print(len(sys.argv)) # 打印命令行参数的数量
	print(sys.argv[0]) # python 脚本本身
	```
26. exit() 函数整个退出 python 脚本
27. matplotlib.pyplot 库
	1. 一般绘图
	``` bash
	import matplotlib.pyplot as plt
	plt.plot(x, y, label="test demo")
	plt.legend() # 添加曲线的描述即 legend
	```
	![](figures/plt_legend.png)
