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
