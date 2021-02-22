## kicad 出问题的解决方法

1. 问题：
Pin connected to some other pins but no pin to drive it
@(...): Pin 1 (Power input) of component #PWR001 is not driven (Net 24)  
解决办法：
通过在出问题的地方放置 PWR_FLAG 这个特殊的符号

2. kicad 安装插件的目录
```
/usr/share/kicad/scripting/plugins
安装 kicad 的目录 scripting/plugins
```

3. [Kicad 插件](https://github.com/xesscorp/kicad-3rd-party-tools.git)
	1. https://github.com/openscopeproject/InteractiveHtmlBom.git 动态 bom 插件
	2. https://github.com/NilujePerchut/kicad_scripts.git 泪滴插件
	3. https://github.com/xesscorp/HierPlace.git 布局插件

4. 编辑器件符号时候，在修改器件的引脚列表时，可以通过选择分组名称，批量的修改引脚的类型
5. 画总线的命名方式是 Net_name[0..5]，如果两个总线直接连在一起，比如 A[0..5] 和 B[0..5]，那么默认的是 A0 连接的 B0，以此类推，如果是 A[5..9] 和 B[0..6]，那么只有 A5 和 B5 连接、A6 和 B6 连接 在一起
6. 原理图通过点选**批注**原理图符号可以批量给器件添加编号
7. 在画器件封装的时候，[如果焊盘只显示轮廓](https://gitee.com/KiCAD-CN/kicad-cn-forum/issues/I1JQ0U)，可以去查看下**视图->绘图模式**，是否勾选了焊盘草图，如果勾选，取消就可以了
8. 在**编辑->编辑文本和图形属性**可以批量修改文本和器件的编号丝印大小
9. 批量修改器件的封裝，可以使用 tools->Edit Symbols Fields，eg:效果如圖: ![批量修改封裝](figures/modify_footprint.png)
10. 選中一個位置，然後點擊**空格**，可以切換爲相對坐標，選中的點位就是相對原點
11. kicad pcbnew 的快捷鍵
---
|快捷鍵|功能|
|---|---|
|-|切換底層和頂層|
|v(布線中)|添加過孔|
|x|開始布線|
|q|布線時打開線寬編輯|
12. [庫文件搜索](https://componentsearchengine.com)，支持下載符號、封裝庫和 3D 模型
13. kicad 不同後綴名文件類型
	* .lib 文件， 符號文件
	* .pretty 文件， 封裝庫文件
14. l 按鍵在 PCB 設計中可以鎖定某一個器件
15. 可以通過創建陣列的方式，快速放置安裝孔
16. 覆銅時如果出現覆銅重疊，可以是使用覆銅優先級解決這個問題，優先級數值越大，優先級越高
17. 如果希望只删除链接线、或者其他某一类的对象，可以[首先全选所有的内容，然后右键鼠标，然后打开选择过滤器，勾选需要选择的内容](https://forum.kicad.info/t/how-to-delete-all-tracks-in-pcbnew/27844)，也可以 Pcbnew -> Edit -> Global Deletions。
