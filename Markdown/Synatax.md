[Fedora](https://browserengine.net/wp-content/uploads/1441861327mdh-logo-new.png)
### MarkDown 笔记
[基础语法参考](https://www.markdownguide.org/basic-syntax/)
---

<a id='jump0'>作为演示锚点，待跳转的位置</a>
1. 插入图片
``` markdown
![描述](图片路径)
![Fedora](https://fedoraproject.org/w/uploads/2/2d/Logo_fedoralogo.png)
![本地图片](本地图片的相对路径)
```
2. 无序列表，使用 * 、- 、+ 作为列表标记符
``` markdown
* 行一
* 行二
- 行三
- 行四
+ 行五
+ 行六
```
3. 有序列表
``` markdown
1. 行一
2. 行二
```
如果序列很长，可以使用更加简单的写法
``` markdown
1. abc
1. def
```
4. 给文本添加超链接
``` markdown
[文本](web site 网址)
[fedora org](https://getfedora.org/)
```
5. 文本删除线和下划线
``` markdown
~~删除内容~~
<u>下划线</u>
```
6. markdown 添加锚点跳转示例：
```
extra code for demonstrate
It's never too late to learn.
```
[跳转的触发点位](#jump0)

7. todolist 列表，前面的 * 必须要
* [ ] 未选中
* [x] 选中

8. 两个反引号和单个反引号的区别，都能用来标记内联代码，两个反引号是单个反引号的增强版，可以直接包括单引号的内容。
9. markdown 中添加了段落类似这样的标记 ```json ```， 在 prettier 自动检索的时候莫名奇妙会标记为 json 格式，使用类似 ``--parser=json`` 方式去解析，就会出错
