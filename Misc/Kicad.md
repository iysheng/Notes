## kicad 出问题的解决方法

1. 问题：
Pin connected to some other pins but no pin to drive it
@(...): Pin 1 (Power input) of component #PWR001 is not driven (Net 24)  
解决办法：
通过在出问题的地方放置 PWR_FLAG 这个特殊的符号
