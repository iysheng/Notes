### 读书笔记
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
