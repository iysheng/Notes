## 记录 html 和 css 的学习笔记
---

### 基础知识
1. 关键概念：structure、tags、elements，每一组 html、body、h1 这些都叫做 elements，<html> </html>，<body> </body> 等叫做 tags，带 / 的为 close tag，不带 / 的为 open tag，在 p 这个 tag，lang 表示属性名字，en-US 表示这个属性的值， atg 的 attribute 描述了 elements 的内容的附加属性
``` html
<html>
	<body>
		<h1>
			Hello china
		</h1>
		<p lang="en-US">
			it's the body of the headline.
		</p>
	</body>
</html>
```

2. tag 描述
	--- structural 标记
	1. <h1> </h1> 1 级标题 tag
	2. <h2> </h2> 2 级标题 tag
	3. <h3> </h3> 3 级标题 tag
	4. <h4> </h4> 4 级标题 tag
	5. <h5> </h5> 5 级标题 tag
	6. <h6> </h6> 6 级标题 tag
	7. <p> </p> 段落 tag
	8. <b> </b> 加粗 tag
	9. <i> </i> 斜体 tag
	10. <sup> </sup> 右上角 tag
	11. <sub> </sub> 右下角 tag
	12. 内容两个及以上的空格，也会只显示一个空格
	13. </br> 换行
	14. </hr> 分割，相比换行，还有一根分割线
	--- semantic 标记
	15. <strong> </strong> 强调重要性，一般也是加粗效果
	16. <em> </em> 画重点，一般是斜体效果
	17. <blockquote> </blockquote> 长引用，一般使用在一个段落，也就是 <p> </p> tag
	17. <q> </q> 短引用
	18. <abbr title="somethin"> a </abbr> a 缩写内容的全称
	19. <cite> </cite> 引用书籍或者论文时，一般是斜体
	20. <dfn> </dfn> 定义新的术语
	21. <address> </address> 描述这个 page 的作者信息
	22. <ins> </ins> 下滑线，表示这个内容已经在其他文档添加了
	23. <del> </del> 删除线
	24. <s> </s> 表示内容不再精确，但是也不能删除，效果是中线删除
	25. <u> </u> 下划线，不建议使用
3. lists 列表
	1. 有序列表 ordered list
	``` html
	<ol>
		<li> something </li>
		<li> something </li>
	</ol>
	```
	2. 符号列表
	``` html
	<ul>
		<li> sumething </li>
		<li> sumething </li>
	</ul>
	3. 定义列表 definition-lists
	<dl>
		<dt> something name </dt>
		<dd> something name 的详细描述 </dd>
	</dl>
	4. 嵌套列表，将其他列表放到 li element 中
4. links 链接
	1. <a href="网址">名字</a> ， href 描述的路径可以是绝对路径、相对路径、目录
	2. <a href="mailto:sth@google.com">sth email</a> ， mailto 可以直接打开 email 客户端发信息给 sth@google.com
	3. <a target="_blank"> </a>  target="_blank" 表示会重新开一个 window
	4. <a href="#id_num"> </a> 跳转到当前页面的其他位置，id 指示的位置，在其他的 element 处定义使用 id 属性定义 id， 在 href 属性处使用 # 索引这个 id
	5. <a href="www.baidu.com#bottom"> </a> 跳转到其他页面对应的 id 标号处
5. image 显示图片
	1. <img src="image source" alt="some decription">
	2. <img src="image source" alt="some decription" width="" height="">
	3. <figure> 这个 element 可以包含图片和图片的字幕，标题
		<img src="image source" alt="some description">
		<figcaption> 描述图片的字幕
		image caption 图片字幕、描述
		</figcaption>
	</figure>
6. table 表格
``` html
<table> 表格 element
<tr> 行 element
<td> 列 element
</td>
</tr>
</table>
```
	1. <th> </th> 这个 element 和 <td> 类似，但是目的是表示，一行或者一列的标题
	``` html
	<table>
	<tr>
	<th></th>
	<th scope="col">Saturday</th>
	<th scope="col">Sunday</th>
	</tr>
	<tr>
	<th scope="row">Tickets sold:</th>
	<td>120</td>
	<td>135</td>
	</tr>
	<tr>
	<th scope="row">Total sales:</th>
	<td>$600</td>
	<td>$675</td>
	</tr>
	</table>
	```
	2. 表格列合并 spanning columns <td colspan="2"> </td> 给 <td> element 添加 colspan attribute
	3. 表格行合并 spanning rows <td rowspan="2"> </td> 给 <td> element 添加 rowspan attribute
	4. long tables
		1. <thead> </thead> element
		2. <tbody> </tbody> element
		3. <tfoot> </tfoot> element
7. form ：文档包含一些空间，提供用户输入内容
``` html
<form action="地址"> 每一个 form element 都要有一个 action attribute，这个属性表示哪个页面可以收到这个窗体的信息
</form>
```
	1. <input /> 创建不同的窗体控件， type attribute 可以决定这个类型
	2. <input type="text" name="username" size="15" maxlength="30" /> type 表示是一个 text 的窗体控件，name 表示这个内容会赋值给变量 username，size 是在旧版的 html 描述这个控件的宽度， maxlength 用来限制输入变量的长度
	3. <input type="password" name="passwd" />  password 类型的窗体控件，键入的内容不会显示明文
	4. <textarea name="textinfo" cols="20" row="5"> Enter your comments </textarea> textarea 类型的窗体控件，可以输入很多行的文本
	5. radio button 单选按钮
	``` html
	表示一个可选的 radio buttion 组，其中 checked attribute 表示开始打开界面选中的那个，value 表示如果选中了这个 item，那么这个 radio button 组的值就是改 value，当前状态表示 food 变量的值就是 milk
	<input type="radio" name="food" value="milk" checked="checked" /> Milk
	<input type="radio" name="food" value="water" /> Water
	<input type="radio" name="food" value="apple" /> Apple
	```
	6. checkbox 复选框
	``` html
	<input type="checkbox" name="food" value="milk" checked="checked" /> Milk
	<input type="checkbox" name="food" value="water" /> Water
	<input type="checkbox" name="food" value="apple" /> Apple
	```
	7. drop down list box 下拉列表框
	``` html
	<p>What device do you listen to music on?</p>
	<select name="devices">
	<option value="ipod" selected="selected">iPod</option>
	<option value="radio">Radio</option>
	<option value="computer">Computer</option>
	</select>
	```
	通过给 <select> element 添加 multiple 的 attribute 可以实现多选框
	8. 文件输入框
	<input type="file" name="song" />
	9. 提交按钮
	<input type="submit" name="upload" value="up"/> value attribute 是显示在提交按钮的文字
	10. 带有图片的提交按钮
	<input type="image" value="subs" src="图片路径" width="图片宽度" height="图片高度">
	11. 隐藏类的窗体控件
	<input type="hidden" name="secret" value="whatis">
	12. button element 可以允许用户更多地添加内容到 button，可以包含其他的 element，比如 <img src="" alt=""> 添加背景图片
	13. label element 窗体控件，可以额外给 input 控件添加标题
	``` html
	<label for="food">food</label>
	<input type="radio" name="food" id="food" value="apple" />
	14. form groups 窗体控件组
	``` html
	<fieldset>
		<legend>通讯信息</legend>
		<label for="email">email</label>
		<input type="text" name="email" id="email" value="" />
	</fieldset>
	```
	15. 窗口有效检测，需要添加 required attribute
	16. date input form <input type="date" name="DATE">
	17. email input form <input type="email" name="DATE">
	18. url input form <input type="url" name="DATE">
8. extra markup ： 额外的标记

### Jekyll 笔记
1. liquid 模板语言，包含了三个重要的元素：
	* objects {{ 对象 }}
	* tags {% 标签 %} ，这个一般用来处理控制和逻辑流程
	* filters {{ 原始内容 | 过滤器 }}
2. Front Matter 是 YAML 的一个片段
---
可以填写一些内容
number: 5 **冒号后面有一个空格很重要**
---
在页面引用这个 number 时，需要添加 page，比如 page.number
3. layout
	* content 变量，调用的 page 提供的内容
4. include tag 可以让你引用到 \_include 目录文件的内容，使用 tags 标签
``` html
{% include filename under \_includes 目录 %}
```
5. 数据文件, Jekyll 支持 YAML，JSON，CVS 这些类型的文件，这些文件需要存放在 \_data 目录，数据文件可以将内容和代码分开存放，很好维护，引用这些数据时使用变量 **site.data.文件名（不用后缀）**
``` yaml
YAML 的格式要规范，空格
- name: Home
  link: /
- name: About
  link: /about.html
```
6. sass 是 css 的一个扩展
7. blogging 博客，存放在目录 \_posts，可以通过变量 sites.posts 变量引用到所有的 posts 内容，可以通过 for 循环遍历所有的 posts
``` html
	{% for post in site.posts %}
	<li>
		<h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
# 备注 posts.excerpt 是每一个 post 的第一段内容
		<p>{{ post.excerpt }}</p>
	</li>
	{% endfor %}
```
8. [Jekyll 支持的变量](https://jekyllrb.com/docs/variables/)
9. Collections 馆藏，集合，收藏集，通过根目录的配置文件 \_config.yml
10. css 给 html 的 elements 关联 rules。这些 rules 管理指定的 elements 的内容如何显示。一个 css rule 包含两部分： selector 和 declaration。 selector 指示这些规则适用的 elements，declarations 指示这些 selector 的 elements 会如何显示。 declarations 可以分为两个部分，一部分是属性，另一部分是值，通过冒号隔开。
```html
p {font-family:Arial;} 这就是一个 css 规则， p 是 selector，表示这个 rule 适用 p 也就是段落 element， font-family 是 declaration 的 selector， Arial 是 declaration 的 value
h1, h2, h3 {font-family:Arial;color:yellow;} 这个 css 规则适用 h1 h2 h3 elements，表示适用 一级、二级、三级标题
```
11. <link > 这个 element 在 html 文件来指示去哪里查找在当前页面的 css 文件，放在 head 这个 element 这里，应该具有三个 attributes：
	1. href ： 指示这个 css 文件的路径
	2. type ： 指定这个被 link 的文档类型，这个值应该是 text/css
	3. rel ： 指定被 link 的文件和当前 html 的关系，这个值应该是 stylesheet
12. 一个 html 页面可以有超过一个的 css 风格 sheet，每一个都要有一个对应的 link element
13. style element 是 html 内部的 css，需要有一个 attribute type="text/css"
``` html
<head>
<style type="text/css">
body {
    font-family: arial;
}
</head>
```
14. 一般的 selector 选择器类型：
	* universal selector ： 通用选择器 * {}
	* type selector ： 类型选择器 h1, h2, h3 {}
	* class selector ： 类选择器，类名前需要加. .note {}
	* ID selector ： ID 选择器，ID 前需要加 # #ID {}
15. 如果有多个规则适用同一个 element
	1. 如果有多个 css 规则适用同一个 element，那么优先使用后者
	2. 如果有多个 css 规则适用同一个 element，那么优先使用范围最准确的
	3. 可以通过在 css 的 declaration 的 value 地方添加 !important 强制这个规则的优先级高
16. 可以直接通过给 child element 的 css 规则对应的 declaration 赋值 inherit 强制继承 parent 的 css 规则
17. @import 可以导入外部的 css 格式文件
``` html
@import url(https://fonts.googleapis.com/css?family=Montserrat|Montserrat+Alternates|Raleway);
```
18. [产生格式字体的网站][https://www.fontsquirrel.com/tools/webfont-generator]
19. 字体
``` html
font-famliy:"Courier New", Courier; /* 字体名字中间有空格需要用双引号扩起来，可以罗列很多字体，一次向后搜索 */
font-size:12px; /* 描述字体大小 */
font-size:50%; /* 描述字体大小，浏览器默认的字体大小是 16px */
font-size:1em; /* 描述字体大小，等价一个小写字母 m 的宽度 */
```
20. @font-face 可以让用户使用一个“不存在的”字体，只要指定这个字体的路径就可以
``` html
@font-face {
font-family: testfont; /* 命名自定义的名称 */
src: url('字体路径') format('truetype'),
    url('字体路径备选') format('woff');
}

p1 {
    font-family: testfont; /* 就可以使用自定义的字体 */
}
```
21. 字体格式
``` html
p1 {
font-weight: normal; /* bold */
font-style: normal; /* italic \ oblique：字体倾斜 */
text-transform: uppercase; /* 大写、lowercase：小写、capitalize：首字母大写 */
text-decoration: underline; /* 下划线、overline：上划线、line-through：删除线、none：无、blink：闪烁 */
line-height: 1.4em; /* 行高 */
letter-spacing: 0.2em; /* 字母间距 */
word-spacing: 1em; /* 单词间距 */
text-align: left; /* 文本对齐， justify：占满屏幕、center：居中对齐、right：右对齐 */
vertical-align: text-top; /* 上对齐 */
text-indent: 20px; /* 文本缩进 */
}
```
