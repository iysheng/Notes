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

3. Kicad 插件
	1. https://github.com/openscopeproject/InteractiveHtmlBom.git 动态 bom 插件
	2. https://github.com/NilujePerchut/kicad_scripts.git 泪滴插件

4. 编辑器件符号时候，在修改器件的引脚列表时，可以通过选择分组名称，批量的修改引脚的类型
5. 画总线的命名方式是 Net_name[0..5]，如果两个总线直接连在一起，比如 A[0..5] 和 B[0..5]，那么默认的是 A0 连接的 B0，以此类推，如果是 A[5..9] 和 B[0..6]，那么只有 A5 和 B5 连接、A6 和 B6 连接 在一起
