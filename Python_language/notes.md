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
	3. lists: 可以表示组织任意类型, [1, 2, 3],['right', 'wrong', 'dog'], [[1,2], [2,3]] # list 可以互相嵌套
	4. 特殊的变量,无,表示 nothing: None
	5. F-strings 是新的变量类型, python3.6 引入
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

