### vim 命令
1. :1,$ s/abc/&def/gc 备注：& 符号会替换为 abc，执行该命令，会将 abc 变为 abcdef
2. :e 重新加载当前打开的文件
3. 无需到命令行，gU转换为大写 gu转换为小写
4. eg：1gU 从光标所在行往下 1 行全部转换为大写
5. gu0：从光标所在位置到改行的行首全部转换为小写
6. gu$：从光标所在位置到该行的行尾部全部转换为小写
7. gUG：从光标所在位置到文章的最后一个字符全部转换为大写
8. gu1G：从光标所在位置到文章的第一个字符全部转换为小写
9. guw、gue、gUw、gUe，光标后面的单词会进行大小写转换
10. gu5w、gu5w、gU5w、gU5e，转换光标后的 5 个单词
11. :命令行 source % 刷新配置
12. 无需到命令行，添加书签 ma：添加 a 书签 mb：添加 b 书签、、、、mz：添加 z 书签，跳转到 a 书签 'a 跳转到 a 书签这一行的行首； \`a 跳转到 a 书签的位置
13. 命令行： marks 查看所有书签
14. v 到 visual 模式，通过 hjkl 选择任意字符串， y 复制、 d 删除、^ 跳转到当前行首、$ 跳转到当前行尾
15. ctrl+v 块模式，通过 hjkl 选中字符块，同样 d 删除、y 复制；shift+i 块模式下到命令行
16. f + 一个字母，跳转到当前行第一个出现该字母的地方
17. 命令行下 :e 表示重新打开当前文件；:e + 文件名，打开对应文件
18. 输入 unicode 字符方法：**输入模式、ctrl-V、u + 4个 hex 进制的数据**，其中 u 是可变的，具体描述
---
|符号|描述|
|---|---|
|a|3 个 10 进制字符（0-255）|
|o|3 个 8 进制字符（0-255）|
|x|2 个 16 进制字符（00-ff）|
|u|4 个 16 进制字符（0000-ffff）|
|U|8 个 16 进制字符（00000000-ffffffff）|
19. help [command] 命令的帮助文档
20. vim unicode 相关的命令 digraphs
21. ctrl+] 是 vim 内置的跳转到 tag 的快捷键， ctrl + t 是内置的向后跳转， ctrl + o 是内置的向前跳转
22. vim 查看启动时间
``` bash
vim --startuptime start.log # 查看 vim 启动时间的细节信息
```
23. vim 匹配空行，然后删除： \s 表示空字符
``` vimrc
:g/^\s*$/d
```
24. ctrl+w n 新建一个 window， ctrl+w x 交换两个窗口的位置， ctrl+w c 关闭这个窗口
25. :copen 打开一个 quickfix window
26. vimdiff 可以方便的对比两个文件的差异以及修改： vim a.c b.c
	1. do 或者 :diffget 以对方的修改为准，覆盖自己的修改
	2. dp 或者 :diffput 以自己的修改为准，覆盖对方的修改
	3. [c 向后跳转到下一个不一样的地方，]c 向前跳转到下一个不一样的地方
	4. :%diffget 全部以对方窗口文件内容为标准覆盖自己修改
	5. :%diffput 全部以自己窗口文件为标准覆盖对方
	6. vimdiff 支持多个文件的比较，这时候使用 diffput 和 diffget 命令，需要指定 buffer 信息
	7. **vimdiff 作为 git 的 mergetool** ，配置
	``` bash
	git config --global merge.tool vimdiff
	git mergetool # 执行冲突合并
	```
