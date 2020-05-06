### Python 学习笔记

#### 数据类型
1. 数字
2. 字符和字符串
3. list
4. dict **字典** 是 pyhton 的核心


#### 函数相关
1. format 是 string 类型对象特殊的方法
2. locals() 函数可以打印出当前环境的变量和对应的值，字典是 python 的核心，当前环境变量的标识符和值以字典 key 和 value 的组合保存
3. 默认情况 print 打印的最后内容是换一个新行，可以通过关键参数 end 替换这个默认设置
``` python
print('just', ' for', ' fun', end='!')
```

#### 知识点
1. 在 python ， class 是 type 的代名词
2. python 可以做简单的计算器
3. // 除，取整(四舍五入) eg: -17 // 5 = -4
4. / 一般的除法
5. python 是区分大小写的语言
6. python 的数据都是对象，对象都有方法
7. 函数参数的字典变量前加 ** ，表示传递的参数是字典的所有内容，不仅仅是字典这个单独参数本身
8. 如果循环的变量没有用到，可以省略使用 _ 符号
9. ** 数学运算标识乘方

#### 控制和循环
1. for 循环
``` python
for item in sequence :
new value of accumulation = result of combining item with last value of accumulation
```
