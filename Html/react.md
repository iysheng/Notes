### React 框架开发腾讯连连 H5 面板

#### 一些基础

#### Roadmap

![h5](./assets/h5_roadmap.png)

#### 经验

* 引用 iconfont 图标字体
	* 通过 **font-class** 方式引用, 这种格式的图标都是单色的
		1. 登陆 iconfont, 将需要的图标添加到项目中，在项目下会生成的 .css 格式的代码: at.alicdn.com/t/font_3157379_rnq949pe62q.css
		2. 在 .less 文件中 import 这个 css 样式文件， ``@import "https://at.alicdn.com/t/font_3157379_rnq949pe62q.css";``
		3. 在 .jsx 文件中就可以使用对应的图标了 eg: <i class="iconfont icon-info"></i>
	* 通过 **symbol** 方式引用, 这种格式的图标是 svg 格式并且支持带彩色的
		1. 登陆 iconfont, 将需要的图标添加到项目中，在项目下会生成的 .js 格式的代码: at.alicdn.com/t/font_3157379_rnq949pe62q.js
		2. 安装 ``pnpm install --save @ant-design/icons`` 包 [https://github.com/ant-design/ant-design-icons](https://github.com/ant-design/ant-design-icons)
		3. 在 .jsx 文件中引入这个 symbol
		``` js
        const IconFont = createFromIconfontCN({
        scriptUrl: '//at.alicdn.com/t/font_3157379_rnq949pe62q.js',
        });
		```
		4. 在 .jsx 文件中使用对应的字体
		``` js
        <svg class="icon" aria-hidden="true">
        <use xlinkHref="#icon-candou"></use>
        </svg>
		```
