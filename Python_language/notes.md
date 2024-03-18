### 读书笔记
* python 具有大量的内置函数,用来处理不同类型的数据.python 是面向对象的语言.每一个数据和函数都可以称之为对象.面向对象区别之前的面向过程的语言.面向过程的语言数据和方法在语言中没有关联起来.
* 当一个类型的名字作为函数调用时,这就是一个构造函数.构造函数会创建一个新的对象然后立即返回.构造函数可以添加参数.
* 对象会有一些专门的方法和他们关联
* python 默认的搜索路径, import sys, 变量 sys.path 列表对应的是一个 list
* Most of the uses of inheritance can be simplified or replaced with composition, and multiple inheritance should be avoided at all costs.(继承的大多数用法都可以简化或者直接使用构造替代,而且应该不惜一起代价避免多重继承)
* python 中有一个通用的模式,涉及到字典、module、class
	* key-value 风格的容器
	* 通过 key 引用非当前文件的内容
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
	* pip list # 可以列出已经安装的 python packages 以及他们对应的版本号
	* print(package.__version__) # 打印软件包的版本号
	* pip install -i https://pypi.tuna.tsinghua.edu.cn/simple some-package # 临时使用清华大学的源安装文件包
	* pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple # 配置默认使用清华大学的源作为软件包
	* 如果找到一个软件包的源代码，可以执行 ``python setup.py sdist`` 进行打包，然后再执行 ``pip install dist/xxxxx.tar.gz`` 安装这个软件包
	* pip uninstall xxx # 卸载指定的软件包
	* 还可以执行 ``python setup.py bdist_wheel`` 进行打包 whl 包
	* 如果有 README，请参看 README 的描述如何正确打包！！！
	* 如果没有安装 pip, 可以使用 ``python -m ensurepip install pip`` 来安装 pip
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
11. **numpy** 是 python 科学计算（数学）的包, numpy 核心数据结构是 ndarray object ，概括了一种 n 维数组
	* y = np.arange(0,0) # 创建一个空数组
	* y = np.arange(2,3) # 创建一个 2 行 3 列的数组
	* y = np.append(y, 123) # append 函数是在数组 y 后追加内容 123, **重点需要将返回值赋值为 y**，否则起不到追加的效果
	* np.array(xxxxx, dtype=np.float32) # 将 xxxx 的数据转换为一个 numpy array 类型的结构并且数据类型是 np.float32
	* np array 在创建时候就已经确认了大小，不像 list 一样，大小可变, 修改 ndarray 的 size ，会删除原始的 ndarray 创建一个新的 ndarray
	* np array 中的所有元素都是同一类型的, 例外：可以有（Python，包括NumPy）对象的数组，从而允许不同大小的元素数组
	* np array 可以加速对大量数据进行高级的数学运算和其他操作,通常比使用 python 内置的数组效率更高
	* 目前越來越多的软件包使用 np array 这类数据类型,所以即要了解 python 内置的序列类型，也要知道如何使用 np 的 array 类型
	* 在 print np 部分的数据时，因为数据过长部分内容省略的问题，可以通过修改 threshold 扩大限制。``np.set_printoptions(threshold=sys.maxsize)``
	* 将 numpy 数组以整形数组保存到文件中(使用 savetxt 方法)，方便 C 语言调用： ``np.savetxt('person.csv', person, fmt='%d', delimiter=',')``
	* savetxt 还可以添加头注和脚注, ``np.savetxt('person.c', person, fmt='%d', delimiter=',', header="const unsigned char g_person_detect_model_data[]={", footer="};", comments='')`` ，使用上述命令可以直接将数据保存到数组中
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
15. 绘制图形库 [matplotlib.pyplot](https://matplotlib.org/stable/tutorials/introductory/usage.html)
	1. plot(x, y) # 以 x 轴和 y 轴绘制曲线图
	2. show() 显示绘制的图形
	3. 左边无法显示中文时，需要加载对应的中文字库
	``` python
    from pylab import *
    mpl.rcParams['font.sans-serif'] = ['Source Han Sans CN']
	```
	4. 涉及到的一些概念
		* axes : 轴，一个轴可以绘制一部分图片
		* figure : 画布
		* axis: 坐标轴
		* x axis label: x 坐标轴 label
		* y axis label: y 坐标轴 label
		* major tick label:
		* minor tick label:
		* major tick:
		* minor tick:
		* legend: 
	5. [常用函数查询](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.html?highlight=pyplot#module-matplotlib.pyplot)
---
![](https://s3.bmp.ovh/imgs/2022/04/28/0cc5fb9fe82ced5e.png)
---
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
		* list(字符串) 可以将字符串拆分为单个字符组成的 list 返回
	3. lists: 可以表示组织任意类型, [1, 2, 3],['right', 'wrong', 'dog'], [[1,2], [2,3]] # list 可以互相嵌套
		* append('abc') # 直接将 'abc' 作为一个整体追加到 list 中
		* extend('abc') # 将 'abc' 拆分为 3 部分 'a' 'b' 'c' 添加到 list 中
		* a = [1,2,3] # 取 list 的索引 a[1:2] == [1], 还支持反向索引, a[1:-1] == [1] 左边是包含,右边不包含
		* b = a # 通过等号赋值相当引用实际指向的同一片区域,如果希望复制一个 list 可以使用
			* list.copy()
			* b = a * 1
			* b = a[:]
			* b = list(a)
			* b = a[x for x in a]
			* b = copy.deepcopy(a) # 深度拷贝,需要 import copy
		* list 前添加 * 号表示将 list 解开为多个独立的参数传入函数
		``` python
		def add(num1, num2):
			return num1 + num2
		data = [1,2]
		add(*data) == add(1, 2)
		import numpy as np
		np.arange(*data) == np.arange(1, 2)
		```
		* list 有 remove 方法可以直接删除指定的成员,如果有多个重复的成员，该函数只会删除第一个该成员
	4. 特殊的变量,无,表示 nothing: None
	5. F-strings 是新的变量类型, python3.6 引入
	6. list 类型可以包含重复的内容,但是 set 类型就不可以,set 就是类似数学的集合,可以通过对 list 执行构造函数,提取不同的 list 成员.
	``` python
	a=[1, 2, 3, 2, 1]
	b=set(a)
	b == [1, 2, 3]
	```
		* 借助 set 可以提取 list 的不重复内容
		``` python
		a = [1,2,3,4,5,6,6,1]
		b = list(set(a)) # [1,2,3,4,5,6]
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
	7. tuple 是元组类型,元组类型和 list 类似,但是元组类型不支持对指定索引编号的变量进行修改,但是可以将元组以一个整体进行拼接和删除,元组的定义使用的是 () 括号,而 list 使用的 [] 方括号
		* 访问元组的方法和 list 类型,可以直接使用索引编号
			``` python
			a =(1,2,3)
			a[1:]=(2,3)
			```
		* 元组连接组合
			``` python
			a = (1, 2)
			b = (3, 4)
			c = a + b # c =(1, 2, 3 ,4)
			```
		* 删除元组
			``` python
			a = (1,2)
			del a
			print (a) # NameError: name 'a' is not defined
			```
		* 定义元组,任意无符号的对象，以逗号隔开，默认为元组
			``` python
			a = 123, 'abc', 567
			print (type(a)) # <class 'tuple'>
			```
		* 元组前添加 *,和 list 类似,表示将元组的变量作为函数参数传入
21. 常见函数
	1. type() # 返回对象类型
	2. int(字符串) # 字符串转 int, int(strrrr, 16) 以 16 进制转换字符串
	3. str(整形) # 整形转字符串
	4. 除法 / 打印浮点数据结果, // 整除,只会打印整数部分
	5. print() 函数可以打印变量的内容
		* 默认情况下, print 会在每一行的结尾添加换行符,可以使用 end 关键字修改结尾字符内容
		* sep 关键字作为打印参数之间的间隔
		* 关键字的修改都要放在 print 函数的结尾处
		* print(格式化 %(数据变量)) 示例:
		``` python
		print('num=%d string=%s' %(123, 'abc')) # num=123, string='abc'
		print('num=%x string=%s' %(123, 'abc')) # hexnum=7b, string='abc'
		print("num=%d string=%s" %(123, 'abc'))
		```
	6. input() 函数接收键盘输入赋值给变量
	7. locals() 返回所有当前视图变量组成的字典!!!
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
	* 字典前加 ** 号表示将字典解开成为独立的参数作为形参,形参的名字是字典对应的 key 值 !!!
	``` python
	def add(x, y):
		print(x + y)
	data = {'a':7, 'b':6}
	add(**data) # error 会报错,因为形参是 x 和 y,但是字典中是 a 和 b 无法匹配形参列表
	newdata = {'x':7, 'y':6}
	add(**newdata) # ok 等价 add(7, 6) 结果是 13
	```
23. 循环
	* for 循环
	``` python
	for count in [1, 2, 3]:
		print (count)
	```
	* 元组类型和循环一起使用
	``` python
	list4tuple=[(1, 'one'), (2, 'two')]
	for (atuple_num, atuple_str) in list4tuple:
		print('galaxy (%d, %s)' %(atuple_num, atuple_str))
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
	2. 前后均带有双下划线 __ 的命名,一般用来特殊的方法,用来实现对象的一些行为或者功能.这些方法也是可以直接调用的
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
	plt.plot(x1, y1, '.', label="1msavg2energy") # 绘制散点图而非连线图
	plt.legend() # 添加曲线的描述即 legend
	plt.legend(labels=["demo0", "demo1"]) # 添加曲线(x,y)和(x1,y1)的描述即 legend 分别为 demo 和  demo1
	```
	![](figures/plt_legend.png)
28. 对小数取整的四种方法
	* 向上取整: math.ceil()
	* 向下取整: math.floor()
	* 四舍五入: round()
	* 向 0 取整: int()
29. 获取命令行参数的两种方法
    1. getopt
        ``` python
        getopt(args, shortopts, longopts=[])
        getopt(args, options[, long_options]) -> opts, args
        # eg test.py -l 1 -t abc 5 6 -> opts=[(-l, 1), (-t, 2)] args=[5,6]
        opts,args = getopt.getopt(sys.argv[1:], 'l:t:', ["list=", "target="])
        ```
        * 当参数后跟随的是多个字符串时可以使用 str.split(字符串列表) 将字符串解析为 list 格式数据
        ``` python
        # eg test.py -l 'test0.txt test1.txt' -t abc 5 6 -> opts=[(-l, 'test0.txt test1.txt'), (-t, 2)] args=[5,6]
        opts,args = getopt.getopt(sys.argv[1:], 'l:t:', ["list=", "target="])
        for opt,param in opts:
            if opt == 't':
                print(str.split(param)) # ['test0.txt', 'test1.txt']
        ```
    2. argparse

30. 使用全局变量的方法,必须在函数中使用 global 关键字声明这个全局变量
``` python
g_data = 0
def print_demo():
	global g_data # 必须显式声明这个全局变量,否则的话会运行出错
	print(g_data)
```
31. 文件
	* python 考虑到初始化初始化一个文件特别耗时,所以会缓存文件数据,一次性将文件所有的内容都写到文件
	* 文件的 **write** 方法不像 printf 一样会在末尾添加 '\n' 字符. print 打印的时候默认都是带有换行的, print("Hello", end=''), 可以通过 end 参数取消 print 换行
	* open(filenama) # 默认的方法就是 'r',所以只读文件的时候可以不添加爱 'r' 模式,会将文件的整个内容返回到一个字符串,只读模式下可以不用 close() 文件
		* 'a' 參數表示以追加方式打開文件
		* 't' 參數表示以文本方式(默認)打開文件
		* 'b' 參數以二進制打開文件
32. boolean 运算
	* **in** 是一个布尔运算符号,用来判断对象是否是所属成员,对应的还有 **not in** 这个布尔元算符号
	* 复合表达式的关键字, and / or / not
	* python 支持  `` 90 <= a <= 100 `` 类似的这种表达式
33. python 对类的支持
``` python
class demo_class(object):
	def __init__(self):
		self.string = 'Red demo'
	def hello(self):
		print(self.string)

# 构造一个类的对象
'''
1. 首先会查找 demo_class 发现是定义的一个类
2. 创建一个空的对象包含这个类使用 def 定义的所有方法
3. python 会查找是否存在名称为 __init__ 的函数,如果有的话调用这个函数
4. __init__ 参数有一个 self 参数,指向的就是对象本身的**指针**
'''
demo0 = demo_class()

# 类的继承,括号内为基类的名字,而不再是 **object**
class derive_demo0(demo_class):
    def __init__(self):
        print("hello derived class")

class demo_class(object):
    pass
# 派生类可以直接继承自多个基类
class derive_demo0(demo_class, demo1_class):
    def __init__(self):
        print("hello derived class from demo0 and demo1 ")
```
34. 遍历指定目录下所有目录的方法,os.walk() 返回的是一个 generator, 每一个成员是一个三维的 tuple:
	1. os.walk() 方法
	``` python
    for usb_root, usb_subdirs, usb_subdir_files in os.walk('.'):
		for subdir in usb_subdirs:
			# 获取对应的目录
		for subdir_files in usb_subdir_files:
			# 获取对应目录的文件
		# usb_root 对应的是每一次迭代的根目录
	```
	2. os.scandir() 方法
35. python 中如果使用了 yield 表达式,那么这就是一个 generator function. 只有当调用generator的next方法，generator会执行到yield 表达式处，返回yield表达式的内容，然后暂停（挂起）在这个地方，所以第一次调用next打印第一句并返回“first yield”。 暂停意味着方法的局部变量，指针信息，运行环境都保存起来，直到下一次调用next方法恢复。第二次调用next之后就暂停在最后一个yield，再次调用next()方法，则会抛出StopIteration异常。并且因为 for 语句可以自动捕捉 StopIteration 异常,所以 generator(本质上是任何 iterator)较为常见的方法是在循环中使用.
	``` python
    def generetor_foo():
        yield 1
        yield 2
    def func_fool():
        return 1
    for t in generator_foo():
        print('generator:%d' %(t))
        print('func_fool:%d' %(func_foo()))
	```
	结果为:
	``` bash
    ▸ python test_generator.py
    generator:1
    func_fool:1
    generator:2
    func_fool:1
	```
	一般函数和 genetrator 函数返回 generator 相比有什么区别呢:
	* function 每次都从第一行开始执行,而 generator 从上一次 yield 的地方执行
	* function 每调用一次返回一组/个值,而 generator 可以多次返回
	* function 可以无数次被调用执行,但是 generator 在 yield 最后一个值或者 return 之后不能继续调用了
	特别地函数中使用 yield 是生成 generator 的一种方式,另一种常见的方法是使用 generator expression:
	``` python
	times = [1,2]
	gen = (x * x for  x in times) # generator 表达式
	print(gen) # <generator object <genexpr> at 0x7f035b65ff90>
	```
36. 生成器表达式:
	1. 生成器表达式（generator expression）也叫生成器推导式或生成器解析式，用法与列表推导式非常相似，在形式上生成器推导式使用圆括号（parentheses）作为定界符，而不是列表推导式所使用的方括号（square brackets）。
	2. 与列表推导式最大的不同是，生成器推导式的结果是一个生成器对象。生成器对象类似于迭代器对象，具有惰性求值的特点，只在需要时生成新元素，比列表推导式具有更高的效率，空间占用非常少，尤其适合大数据处理的场合。
	3. 使用生成器对象的元素时，可以根据需要将其转化为列表或元组，也可以使用生成器对象的next()方法或者内置函数next()进行遍历，或者直接使用for循环来遍历其中的元素。但是不管用哪种方法访问其元素，只能从前往后正向访问每个元素，不能再次访问
	4. 已访问过的元素，也不支持使用下标访问其中的元素。当所有元素访问结束以后，如果需要重新访问其中的元素，必须重新创建该生成器对象，enumerate、filter、map、zip等其他迭代器对象也具有同样的特点。
37. 继承: 基类和派生类之间交互有三种方法:
    * 隐式继承(imply)
    ``` python
    class Parent(object):
        def implicit(self):
            print('PARENT implicit')
    class Child(Parent):
        pass
    ```
    * 覆盖继承(overrite)
    ``` python
    class Parent(object):
        def override(self):
            print('PARENT override')

    class Child(Parent):
        def override(self):
            print('CHILD override')

    dad = Parent()
    son = Child()

    dad.override()
    son.override()
    ```
    * 改变继承(alter)
    ``` python
    class Parent(object):
        def altered(self):
            print('PARENT altered')

    class Child(Parent):
        def altered(self):
            print('CHILD before PARENT altered')
            # 改变继承使用 parent 的 altered
            # 使用 super 函数调用基类的方法,调用 Child 类的基类,参数的类名必须是
            # 当前类的 __mro__ 成员中的内容
            super(Child, self).altered()
            # python3 支持直接使用 super 函数调用基类的方法,不用加额外的参数
            super().altered()
            print('CHILD after PARENT altered')

    dad = Parent()
    son = Child()

    dad.altered()
    son.altered()
    ```
38. 多态继承
    ``` python
    class Fruit(object):
        def altered(self):
            print('FRUIT altered')

    class AFruit(object):
        def altered(self):
            print('AFRUIT altered')

    # 多态继承
    class Apple(Fruit, AFruit):
        def altered(self):
            print('CHILD before altered')
            super(Apple, self).altered()
            super().altered()
            print('CHILD after FRUIT altered')

    f0 = Fruit()
    a0 = Apple()

    f0.altered()
    a0.altered()
    ```
	多态继承时,如果父类包含有同名的方法.这就涉及到如何让查找父类方法的问题,即 MRO(method resoluthion order).不同 python 版本使用不同的算法实现 MRO.
	* 在 python2 中存在两种类,一种是经典类,经典类在基类的根如果什么都不写,表示继承 xxx. 另一种是新式类,新式类的特点是基类的根是 object.在 python3 中不存在经典类了.经典类中采用的是深度优先原则.
	* 新式类的 MRO 采用的是 C3 算法,
	``` python
	class A:
		pass
	class B(A):
		pass
	class C(A):
		pass
	class D(B, C):
		pass
	class E(C, A):
		pass
	class F(D, E):
		pass
	class G(E):
		pass
	class H(G, F):
		pass
	# C3 算法,可以通过类的 __mro__ 变量获取类对应的 MRO 成员变量,类型是 tuple
	# + 表示的是 merge . merge 的原则是用每个院的头一项和后面元组的除头一项外的其他元素进行比较,看是否存在.如果存在,就从下一个元组的头一项继续找,如果找不到,就拿出来.作为 merge 的结果的一项.以此类推,直到元组之间的元素都相同了,也就不用再找了.
	# L(H) = H + L(G) + L(F) + (G,F)
	# L(G) = G + L(E)
	# L(F) = F + L(D) + L(E) + (D,E)
	# L(D) = D + L(B) + L(C) + (B,C)
	# L(E) = E + L(C) + L(A) + (C,A)
	# L(B) = B + L(A)
	# L(C) = C + L(A)
	# L(A) = A
	#
	# L(C) = C + A
	# L(B) = B + A
	# L(E) = E + (C,) + (A,) + (C,A) = E.C,A
	# L(D) = D + (B,A) + (C,A) + (B,C) = D,B,A
	# L(F) = F + (D,B,A) + (E,C,A) + (D,E) = F + D + (B,A) + (E,C,A) + (E) = 
	# F + D + B + (A) + (E,C,A) + (E)
	# F + D + B + (E,C,A) + (E)
	# F + D + B + E + (C,A)
	# F D B E C A
	# L(G) = G + (E,) = G + (F,D,B,E,C,A) = G F D B E C A
	# L(H) = H + (G,F,D,B,E,C,A) + (F,D,B,E,C,A) + (G,F) = H G F D B E C A
	```
39. 使用 numpy 包进行数据拟合
	* numpy.polyfit 函数可以对给定的数据进行拟合,并且可以指定拟合的阶数
	* numpy.poly1d 函数可对给定的对象进行格式化,打印出来拟合的数据格式
	``` python
	x=[1,2]
	y=[10, 90]
	func=numpy.polyfit(x, y, 1) # 一阶拟合
	func_format=numpy.poly1d(func)
	```
测试结果:
``` bash
▸ ./test.py
funcp=
80 x - 70
```
40. dearpygui 包
	* viewport 是传统意义上的 window 的概念,在 start_dearpygui() 函数之前,必须执行: create_viewport()/setup_viewport()/show_viewport()
	* 一旦这个 viewport 创建之后,可以使用 configure_viewport 或者其他的 set_viewport_*** 函数去配置这个 viewport
	* primary window 会填充 viewport, 并且会随着 viewport 的 size 变化而变化, 以及会一直保持在其他 window 之后
41. python 中文件夾想作爲一個模塊被引用，該文件夾必須要包含 __init__.py 文件，即使該文件爲空。如果此模塊想要運行，則必須要包含一個 __main__.py 文件。
	* __init__.py 文件中一般包含了所要引用的模塊
	``` python
	 from robot.rebot import rebot, rebot_cli
	 from robot.run import run, run_cli
	 from robot.version import get_version
	
	# __all__ 和 __version__ 都是系統變量
	# __all__ 表示導出包內的模塊
	 __all__ = ['run', 'run_cli', 'rebot', 'rebot_cli']
	 __version__ = get_version()
	```
	* __main__.py 文件可以理解爲一個模塊的入口函數執行模塊
42. os.sep 是目錄的分割符
43. python a.py 表示直接運行 a.py 腳本; python -m a.py 表示將 a 作爲一個模塊運行,此時要存在這個模塊名的目錄在 sys.path 路徑下。
44. [python if __name__ == '__main__'該如何理解](https://blog.csdn.net/weixin_41923961/article/details/86616127)
	* python 屬於腳本語言，是動態諸行執行的，也就是從腳本的第一行開始運行，沒有統一的入口。
	* 一個 python 源文件除了可以被直接運行外還可以作爲模塊（也就是庫）被導入。最頂層的代碼都會被運行（python 用縮進來區分代碼層次）。實際在作爲模塊導入的時候，有一部分代碼是不希望被運行的。
	* 創建 package 的時候(一般是一個目錄)，在文件夾下會有一個 __init__.py 文件，該文件的作用是將該目錄作爲一個 python 模塊. import 的時候會執行 __init__.py 文件
45. parser.add_argument('-f', help="full code compilation", action='store_true') # store_true 表示如果帶有 -f 選項參數，那麼 image 爲真，否則爲假.
46. from collections import defaultdict， 該函數使用一個工廠函數作爲參數創建一個字典。
``` python
A=defaultdict(list) # 如果之後在方位 A 字典的 b key， 但是 b 並不存在時會返回一個空的 list 而不是返回 KeyError
A={} # 創建空字典，如果後續在方位 A 字典的 b key, 但是 b 不存在時，會返回 KeyError
```
47. python 的修飾器
	* @property 創建只讀屬性函數，可以使用調用類參數的方法調用方法
	* @out_path.setter # out_path 屬性可以直接調用，並且具有設置屬性
48. 有多種方法可以修改 sys.path 變量。
	* 導出環境變量 PYTHONPATH
	* 在已經搜索的目錄下創建 .pth 文件，該文件中記錄搜索的路徑
	* 直接在源碼中修改 sys.path 這個 list 變量
49. python 有单例模式，即一个类只有对象在内存中。 Singleton
59. 打印具体异常的方法：
```python
try:
     print('abc')
# 打印异常的具体信息
except Exception as ex:
    print("error : %s" %ex)
```
60. 如果安装了多个版本的 python, 希望给指定版本的 python 安装软件包，命令为：``python3.6 -m pip install <package name>`` 给指定的 python3.6 安装软件包
61. Module 模块, module 主要是为了一个相对较大的工程，涉及到多个文件之间互相调用。如果将所有的代码写到一个文件中，可能成千万行，阅读起来并不友善，更好的方法是将大项目拆分为多个模块，用文件夹和文件的方式管理起来，方便后期维护，这就有了 module 模块的程序代码管理方式。
	* module 的涉及和 class 有异曲同工之处
	* 正规的 module 中，常会看到一个 __init__.py 文件，这个文件其实就类似 class 中的 def __init__(self) 函数
	* from 包名 import 函数集合 # 如果有多个函数时，函数名之间使用 , 隔开
	* from 包名 import * # 表示引入指定包中的所有函数
	* module 类似字典
		* module 就是一个 python 的文件，包含了一些函数和变量
		* 然后你需要 import 那个文件
		* 最后你可以使用 . 符号引用这个 module 中的函数和变量
	* 类又像一个 mini-module
	* 使用类替换 module 可以根据一个类创造出多个对象
	* 引用类又出现一个概念，叫做实例化，当你实例化一个类的时候，你就获得这个类的对象，当你实例化一个类的时候，会获得一个这个类的对象
		1. python 寻找这个类查看是否有这个你定义的类
		2. python 创建一个空的对象包含这个类使用 def 定义的所有函数
		3. python 查看是否存在一个你定义的 __init__ 初始化函数，如果有调用这个函数初始化定义的空对象
		4. 在定义的 __init__ 函数会有一个 self 形式参数，初始化这个对象有关的变量、字典等内容
		5. 最后就会将这个对象返回
62. 读写文件
	* 按照行一次性读完， readlines()
	* 每次只读取一行，readline()
	* with open("chinese.txt", "r", encoding="gbk") as f: open 函数使用 ecoding 参数指定编码格式

|模式|意义|
|---|---|
|w|（创建）写文本|
|r|读文本，文件不存在会报错|
|a|在文本最后添加|
|wb|写二进制 binary|
|rb|读二进制 binary|
|ab|添加二进制|
|w+|又可以读又可以（创建）写|
|r+|又可以读又可以写, 文件不存在会报错|
|a+|可读（创建）写，在文本最后添加|
|x |创建|

63. with 模式
``` python
with open("a.txt", "w") as f:
    f.writelines("abc \n def \n")
```
	* 紧跟 with 后面的语句被求值后，返回对象的 __enter__() 方法被调用，这个方法的返回值将被赋值给as后面的变量。当with后面的代码块全部被执行完之后，将调用前面返回对象的 __exit__()方法。
	* 特别地， __exit__ 函数原型是 __exit__(self, type, value, trace)
64. 文件目录管理, 如果做一些系统性的东西，要处理文件输入输出等问题，大概率会用到 python 在带的 os 库
	* 文件目录操作
		1. os.getcwd()
		2. os.listdir()
		3. os.makedirs() # 该函数有一个 exist_ok 参数，默认是 False, 如果设置为 True, 那么当指定的目录存在时，不会报错，默认为 False 时，如果要创建的目录已经存在，那么再次尝试创建时就会报错
	* 文件管理系统
		1. os.removedirs() # 如果尝试删除的目录中不为空，那么执行这个函数时就不会报错,这个时候可以使用另一个库 shutil，shutil.rmtree() 强力删除！！！
		2. shutil.rmtree()
		3. os.rename()
	* 文件目录多种检验
		1. os.path.isfile()
		2. os.path.exists()
		3. os.path.isdir()
		4. os.path.basename() # 获取文件的名字，不包含目录
		5. os.path.dirname() # 获取文件的目录
		6. os.path.split() # 可以将一段内容以最后一个 / 为分割符号拆分开,以 tuple(元组的形式返回)
		7. os.path.join(str1, str2, str3 ...) # 将 str1 和 str2 拼接起来, 字符串之间会自动填充 "/" 符号, 如果有不会多填充，如果没有会填充，最后一个不会填充,如果哪一个 str 包含了一个绝对路径的符号，那么之前的内容都会舍弃，从这个绝对路径开始拼接 ！！！
65. 正则表达式 **import re** 库
	* test_pattern = re.compile(r"正则表达式") # r 表示原生字符串
	* test_match = test_pattern.search("待搜索的内容")
	* test_match.group() 可以返回匹配的到内容 # grep() 方法可以返回匹配的字符串
	* re.search(r"f(ou|i)nd", "I find you") # pattern 表示匹配 found 或者 find
	* "中".encode("unicode-escape") #中文的 unicode 查询
	* re.match() # 从字符的最开头匹配，找到第一个模式匹配的，简单来说，如果开头都无法匹配，那么返回的就是 None。 re.match(r"run", "I run for you") > None
	* re.findall("返回一个不重复的 pattern 匹配列表") # re.findall(r"red|blue", "red man blue sky") -> ['red', 'blue']
	* re.finditer() # 和 findall 的方式一样，只是用迭代器的方法使用， for item in re.finditer(r"red|blue", "red man blue sky"): print(item) -> <re.Match object; span=(0, 3), match='red'> <re.Match object; span=(8, 12), match='blue'>
	* re.split() # 用正则分开字符串
	* re.sub(r"a", "b", "ared") # 用正则进行替换，将 a 替换为 b 返回 bred
	* re.subn(r"a", "b", "ared") # 用正则进行替换，将 a 替换为 b 返回结果和替换的次数 ('bred', 1) 是一个 tuple 类型的变量
	* 使用 group 配合自定义索引的使用
		``` python
		for item in re.finditer(r"(?P<a>\d+)-(?P<b>\w+)", "123-abcdef-jpg"):
			print("a:", item.group("a"), ",b:", item.group("b"))  -> 返回 a: 123 ,b: abcdef
		```
	* 在正则匹配过程中有一些特别的 flags,可以在 re.match()， re.findall() 等功能中使用,主要目的是方便编写正则表达式

|模式|说明|
|---|---|
|re.I|忽略大小写|
|re.M|多行模式，改变 '^' 和 '$' 的行为|
|re.S|点任意匹配，改变 '.' 的行为，使 '.' 可以匹配任意字符，正常是只匹配换行符之外的任意字符|
|re.L|字符类 \w \W \b \B \s \S 取决当前区域设定|
|re.U|字符类 \w \W \b \B \s \S \d \D 取决 unicode 定义的字符属性有关系|
|re.X|详细模式|

		如果想用多个 flag, 需要将他们 ``|`` 起来 re.search(r"Red.", "red\n", re.S | re.I) -> <re.Match object; span=(0, 4), match='red\n'> 如果没有 ``re.I | re.S`` 是匹配不到的

66. 更快地执行
	* 如果要重复判断一个正则表达式，通常不会直接在 re.search() 函数中写 pattern, 而是先定义并使用 re.compile() 解析这个 pattern, 获取这个 ptn, 然后使用 ptn 去执行 search() 方法查找目标字符串
67. pickle/json 序列化
	* pickle # pickle 可以将字典，类等内容进行打包，打包后的内容是经过编码的，人直接是看不懂的。
		* pickle.dumps(对象) # 对文件进行打包编码
		* pickle.dump(对象，文件) # 可以将对文件的打包写入到文件中保存起来,文件对应的文件的后缀名必须是 pkl
		* pickle.load(文件) # 从文件中加载并解析出原始的数据
		* 除了常见的字典，元组，列表这类数据，pickle 可以打包 python 的功能和类。在反序列化的时候，如果是打包的类的实例，那么类的原型必须存在。
		* 有些类型（打开的文件，网络链接，线程，进程，栈帧等）是不能被 pickle 的，如果硬要 pickle 这个类,需要自己手动编写 ``__getstate__`` 和 ``__setstate__`` 方法来绕过 pickle 这些限制
	* json
		* json.dumps()
		* json.dump()
		* json.load()
		* json 不能打包类，只能打包列表和字典

|对比|Pickle|Json|
|---|---|---|
|存储格式|Python 特定的 Bytes 格式 |通用 JSON text 格式，可用于常用的网络通讯中|
|数据种类|类，功能，字典，列表，元组等 |基本和 Pickle 一样，但不能存类，功能|
|保存后可读性 |不能直接阅读 |能直接阅读|
|跨语言性|只能用在 Python |可以跨多语言读写|
|处理时间|长（需编码数据） |短（不需编码）|
|安全性|不安全（除非你信任数据源）不同版本的python编码后的数据可能不一样 |相对安全|
68. 异常检查和处理，一般情况，只要报错了就会终止代码执行
	* try except 来捕捉错误
	``` python
	try:
		do sth
	except xxx as e:
	```
	* 使用 try except 处理多个异常， 
	``` python
	# 如果我们处理多种异常的方法的都是一样的，可以使用一种方法来处理多种异常，比如
	d = {"a":123}
	l = [1,2]

	try:
		v = d["b"]
		l[2] = 3
	except (KeyError, IndexError) as e: # 分别捕获字典键值不存在，以及 list 索引无效的错误
		print("key or index error for:", e)
	```
	* 分开处理不同的异常
	``` python
	d = {"a":123}
	l = [1,2]

	try:
		v = d["b"]
		l[2] = 3
	except KeyError as e: # 分别捕获字典键值不存在，以及 list 索引无效的错误
		print("key error for:", e)
	except IndexError as e: # 分别捕获字典键值不存在，以及 list 索引无效的错误
		print("index error for:", e)
	```
	* try-except-else 没有报错的时候会执行到 else 分支
	* try-except-finally 不管有没有报错，都会执行到 finally 分支
	* raise 手动触发异常,能被 raise 触发的异常是有限的

|异常名称|描述|
|---|---|
|BaseException|所有异常的基类|
|SystemExit|解释器请求退出|
|KeyboardInterrupt|用户中断执行(通常是输入^C)|
|Exception|常规错误的基类|
|StopIteration|迭代器没有更多的值|
|GeneratorExit|生成器(generator)发生异常来通知退出|
|StandardError|所有的内建标准异常的基类|
|ArithmeticError|所有数值计算错误的基类|
|FloatingPointError|浮点计算错误|
|OverflowError|数值运算超出最大限制|
|ZeroDivisionError|除(或取模)零 (所有数据类型)|
|AssertionError|断言语句失败|
|AttributeError|对象没有这个属性|
|EOFError|没有内建输入,到达EOF 标记|
|EnvironmentError|操作系统错误的基类|
|IOError|输入/输出操作失败|
|OSError|操作系统错误|
|WindowsError|系统调用失败|
|ImportError|导入模块/对象失败|
|LookupError|无效数据查询的基类|
|IndexError|序列中没有此索引(index)|
|KeyError|映射中没有这个键|
|MemoryError|内存溢出错误(对于Python 解释器不是致命的)|
|NameError|未声明/初始化对象 (没有属性)|
|UnboundLocalError|访问未初始化的本地变量|
|ReferenceError|弱引用(Weak reference)试图访问已经垃圾回收了的对象|
|RuntimeError|一般的运行时错误|
|NotImplementedError|尚未实现的方法|
|SyntaxError|Python 语法错误|
|IndentationError|缩进错误|
|TabError|Tab 和空格混用|
|SystemError|一般的解释器系统错误|
|TypeError|对类型无效的操作|
|ValueError|传入无效的参数|
|UnicodeError|Unicode 相关的错误|
|UnicodeDecodeError|Unicode 解码时的错误|
|UnicodeEncodeError|Unicode 编码时错误|
|UnicodeTranslateError|Unicode 转换时错误|
|Warning|警告的基类|
|DeprecationWarning|关于被弃用的特征的警告|
|FutureWarning|关于构造将来语义会有改变的警告|
|OverflowWarning|旧的关于自动提升为长整型(long)的警告|
|PendingDeprecationWarning|关于特性将会被废弃的警告|
|RuntimeWarning|可疑的运行时行为(runtime behavior)的警告|
|SyntaxWarning|可疑的语法的警告|
|UserWarning|用户代码生成的警告|

69. 单元测试 **unittest** 组件, 单元测试就是将你的小功能模块拆开一个个测试，这样做的目的非常明确，只有你每一小步都做好，整体才不容易出错。
70. 字符串的高级玩法
	* % 百分号模式 (d：整数 i： 整数 f：小数 s：字符)
		* print("hello %s!" %"china")
		* print("%(man)s say hello %(country)s!" %{"man":"red", "country":"china"})
		* print("%s say hello %s!" %("red", "china"))
	* format 功能更多, format 是在 % 后发明的
		* print("{} say hello {}!".format("red", "china")) # 简单使用 {} 作为占位符号， format 中的内容按照顺序填写
		* print("{0} say hello {1}!  -- by {0}".format("red", "china"))
		* print("{0} say hello {1}!  -- by {0}".format("red", "china"))
		* print("{name} say hello {country}!  -- by {name}".format(name="red", country="china"))
		* print("{:%} eq with {:}".format(123, 123)) # {:%} 对数据进行百分比模式格式化，{:,} 每 3 个 0就用逗号隔开，{:b} 该数字的二进制，{:d} 整形，{:f}小数模式，{:%} 百分比模式
	* f 格式化字符串, python 3.6 之后的模式，和 format 类似
		``` python
		name = "red"
        country = "china"
		print(f"{name} say hello {country}!  -- by {name}")
		print(f"0b11:d") # 前缀 0b 表示二进制，0x 表示 16 进制，d 表示转换为 10 进制，x 表示转换为 16 进制
		```
	* 修改字符串
		* string.strip() # 去除两断的空白符
		* string.replace() # 替换字符
		* string.lower() # 全部小写
		* string.upper() # 全部大写
		* string.title() # 仅开头字母大写
		* string.split() # 按要求分割, 根据 split 函数传入的符号对字符串进行拆分到 list 中返回
		* ".".join([]) # 按要求合并, 在指定的 list 中加入 "." 符号
		* string.startswith() # 判断是否为某字段开头
		* string.endswith() # 判断是否为某字段结尾
71. python 的偷懒用法
	* Lambda # 当你希望定义一个功能简单，并且调用次数不多的函数的时候，可以考虑使用 lambda
	``` python
	add = lambda a, b: a + b
	print(add(1, 2))
	```
	* for 简单循环
	``` python
	l = [i * 2 for i in range(10)]
	# 等价
	l = []
	for i in range(10):
		l.append(i * 2)
	# 创造字典
    d = {"index" + str(i): i * 2 for i in range(10)}
	```
	* if-else 判断 # a = 1 if true else 2
	* for 配合 if-else 判断 # l = [i * 2 for i in range(10) if i % 2 == 0]
	* enumerate 自动加 index
	``` python
	l = [1,2,3,4]
	# count 从 5 开始自动加 1
	for count, data in enumerate(l, start = 5):
		print("index:%d data:%d" %(count, data))

	# count 从 0 开始自动加 1
	for count, data in enumerate(l):
		print("index:%d data:%d" %(count, data))
	```
	* zip 让你同时迭代
	``` python
    name = ["a", "b"]
    score = [1, 2]
    age = [1, 2]
    d = {}
    
    for i in range(2):
        d[name[i]] = score[i]
    
    print(d)
    
	# 等价
    for n, s in zip(name, score):
        d[n] = s
    
    print(d)

	# 支持同时迭代更多
    for n, s, a in zip(name, score, age):
        d[n] = [s, a]
    
    print(d)
	```
72. reverse & reversed # 翻转列表
	* lista = [1,2,3] lista.reverse() # 就地翻转列表
	* lista = [1,2,3] for i in reversed(lista): print(i) # reversed 可以用在 for 循环的翻转迭代器中
	* lista = [1,2,3] \_lista = lista[::] # 拷贝出来一给副本进行翻转
73. 复制的**玄学**
	* 深拷贝，deep copy 会对原始内容进行再造,特别地针对数值和字符，是直接复制, deepcopy() 方法是深拷贝
	* 浅拷贝，shallow copy 只是拷贝原始内容的分身,比如对 class，list，字典, copy 方法就是浅拷贝,速度快
74. 生成器，首先，循环是一个用简短语句表示重复执行过程的概念。生成器就是为循环设计的。考虑到在循环中，一般都是每次从循环中拿特定的一些数据做处理，但是无可避免的会在内存中记录这些数据，当记录的数值很多时，内存可能就吃不消了。而生成器，即现做现吃的意思。生成器的目的就是避免在内存中记录这样的一个大数据，避免将内存撑爆。生成器，只会在需要的时候生成它，生成之后就不用了，也不用再记录。
	* yield 方法
	``` python
	def need_return():
		for item in range(5):
			if item % 2 == 0:
				print("send item:%d out" %item)
				yield item
				print("came back")
	for i in need_return():
		print(f"catch some data:{i}")
	```
	* 生成器是一个函数，所以它能做函数能做的事情，比如传参数。
	``` python
	def need_return(ini):
		for item in range(ini):
			if item % 2 == 0:
				print("send item:%d out" %item)
				yield item
				print("came back")
	for i in need_return(10):
		print(f"catch some data:{i}")
	```
	* 定义生成器类, 用一个类可以表示迭代器和生成器。用在生成器的两个 method： ``__iter__`` 和 ``__next__``
	``` python
	# 一个简单的迭代器类示例 
    class NeedReturn(object):
    	def __init__(self, ini = 0):
    		self.tmp = ini
    		self.item = 0
    
    	def __iter__(self):
    		return self
    
    	def __next__(self):
    		while True:
    			if self.item == self.tmp:
    				self.tmp *= 2
    				return self.item
    			self.item += 1
    			if self.item == 300:
    				raise StopIteration
    
    for i in NeedReturn(10):
    	print(f"index:{i}")
	```
75. 装饰器 Decorator, 用来装饰 python 函数的东西。装饰器的好处是，给批量的函数做同样的事情。比如有一批函数都要做些前置或者后置的工作，可以统一给他们“装饰”， 用一个装饰器统一处理。
	``` python
    def pre_func1(fn):
        def wrapper(name):
			# 前向处理
            print(f"{name} say coming.")
			# 待修饰的函数本体执行
            fn(name)
			# 后向处理
            print(f"{name} say outing.")
			return
        return wrapper
	# @ 装饰器
    @pre_func1
    def outer_fn1(name):
        print(f"{name} say out2")
    
    outer_fn1("red")
	```
76. python 安装和依赖管理
	* conda 是 python 的一个管理器，它可以管理多个版本的 python, 安装 conda 有两种方式
		1. 直接安装裸的 miniconda, 安装 conda， python， base packages 
		2. 安装 anaconda, 在 conda 之外还要安装很多一些其他的包
	* pip 是 python 的库管理工具，安装一个 python 就会自带一个 pip。
		* pip install numpy==1.19.4 # 强制安装特定的版本
		* 一般地，pip2 对应的是 python2+ 的版本， pip3 对应的是 python3+ 版本
		* pip install -i url路径 软禁包名 # 通过执行的网址去下载指定的库
		* pip uninstall 库名称 # 删除指定的库
	* conda 是 pip/python 之上，想要隔离 pip 和 python 环境的组件，用 conda 来管理不同的 python
	* conda 比 pip 更进一步，可以分项目来管理依赖和 python 版本，比如有很多项目，里面的 python 和依赖都不相同，可以用 conda 为这些项目单独管理一个 python 并隔离他们的依赖
		* ``conda ceate --name red python=3.10.2`` # 创建一个 redman 的 python 环境
		* ``conda env list`` # 可以查看当前有哪些环境
		* ``conda activate redman`` # 切换到指定的环境
	* 很多项目都会存放 ``requirements.txt`` 文件，这是一个最基础的 pip 依赖列表。可以通过 ``pip freeze > requirements.txt`` 生成这个文件
	* 在有了 ``requirements.txt`` 这个依赖文件的条件下，可以使用 ``pip install -r requirements.txt`` 指令一次安装这些依赖.
		* -r 表示安装根据指定的依赖文件列表中的内容那些依赖
77. python 编辑器
	* **Jupter Notebook** 不像一般的编辑器，这个编辑器可以将你阶段性的结果保存下来
78. 多线程， threading 是一种让程序拥有分身效果，能处理多件事情。
79. 多进程，针对多核处理器，多进程 multiprocessing 可以让电脑更有效率的分配人物给每一个处理器。
80. 窗口界面开发
	* Tkinter 是使用 python 进行界面开发的库,简单适合入门
81. 数据三剑客
	1. numpy # 科学运算模块
	2. pandas # 和 numpy 类似都是科学运算模块
	3. matplotlib # 数据可视化的好帮手
82. 数据采集，爬虫技术
83. Matplotlib, 可以绘制：
	* 相关函数接口
		1. plt.figure(num=1, figsize=(4,3)) # 明确画布的编号和大小
		2. plt.xticks() # 设置 x 轴刻度
		3. plt.yticks([1, 2, 3], [r'$red$', r'$blue$', r'$green$']) # 设置 y 轴刻度及对应的刻度名称
		4. plt.xlim((-1, 1)) # 设置 x 轴的范围
		5. plt.ylim((-1, 1)) # 设置 y 轴的范围
		6. plt.gca() 获取当前坐标轴的信息
		7. legend 图例就是帮助我们展示每一个数据对应的图像名称
			* plt.legend(loc='upper right') # plt.legend(loc='best') 特别地 best 会自动分配最佳位置
		8. Annotation 标注
		9. 
	* 线图
	``` python
    #!/bin/python
    import matplotlib.pyplot as plt
    import numpy as np
    x = np.linspace(-1, 1, 50)
    y = 2 * x + 1
    # 定义一个画布
    plt.figure()
    # 使用 plt.plot 绘制 (x, y) 曲线
    plt.plot(x, y)
    # 显示图像
    plt.show()
	```
	* 散点图
	* 等高线图
	* 条形图
	* 柱状图
	* 3D 图
	* 图形动画
84. CSV 文件是以每行使用 , 隔开作为分割符号的文件，读取 csv 文件的方法：
	* 使用 csv 库(一般 python 自带这个库)
	``` python
	import csv

	raw_file_list = []
	# 渲染之后每一行都是 list 类型的
	# 如果没有使用 csv.reader 处理，那么每一行的内容是 str 类型的
	csvf = csv.reader(open(csv文件))
    for line in csvf:
        raw_file_list.append(line)
	# 将每一行的 list append 成一个大的 list 列表

    # 配合 pandas 可以将这些数据处理为一个更加可视化的类型
	import pandas as pd
	df = pd.DataFrame(raw_file_list)
	print(df) # 可以看到了类似矩阵的数据结构
	```
85. [pandas](https://pandas.pydata.org/) 科学计算的软件包
	* pandas.set_option('display.max_rows', None) # 设置取消显示的最大行的限制
	* pandas.set_option('display.max_info_rows', None) # 设置取消每一列的显示内容的限制
	* sort_values() # 根据指针的编号对 pandas 格式的数据进行重排
	* df = pd.DataFrame(raw_list) df[0] 表示这个矩阵的第一列，可以使用  df[0].tolist() 函数将第一列转换为 list 类型
86. **eval()** 函数计算一个表达式的结果
87. pillow 是 python 的图形库，``pip3 install pillow``, PIL，全称 Python Imaging Library，是 Python 平台一个功能非常强大而且简单易用的图像处理库。但是，由于 PIL 仅支持到Python 2.7，加上年久失修，于是一群志愿者在 PIL 的基础上创建了兼容 Python 3 的版本，名字叫 Pillow.
88. random 随机数
	* random.randrange(start, stop[, step]) # 设置 range 范围
	* random.randint(a, b) # 返回 [a, b] 之间一个整数
89. 无穷大的表示方法: float("inf")
90. 集合, set, 每一个元素只能出现一次
91. print(导入的包名称)，可以查看包路径
92. slice 即 : 符号,表示列表截取
	* a[start:stop] start->stop-1
	* a[start:]     start->最后
	* a[:stop]      0->stop-1
	* a[:]          0->最后
93. bytes 类
	* 打印 print(xxx)
		* print 中以16进制打印, 以 abc 列表为例, print("%02X"%abc[0])
	* bytes 转换为 list -> abc=list(xxx) 直接使用 list 进行转换,或者说构造
	* list 转换为 bytes -> xxx=bytes(abc) 直接使用 bytes 进行转换 abc
94. python 的 venv 包可以方便创建虚拟环境，比较好用
``` bash
python -m venv test # 创建虚拟环境
source ./test/bin/activate # 激活虚拟环境
```
95. python 查看包所在路径
``` python
import pcbnew
print(pcbnew.__file__) # 可以打印出来包所在的路径
```
96. 字符串大小写转换
	1. "abc".upper() 转换为大写
	2. "DEF".lower() 转换为小写
