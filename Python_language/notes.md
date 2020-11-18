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
