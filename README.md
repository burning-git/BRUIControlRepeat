# BRUIControlRepeat

设置按钮的点击间隔时间！


<img src="http://77g6dx.com1.z0.glb.clouddn.com/BRUIControlRepeatDemo.gif" />

###使用方法

1.如果是 UIButton，导入 #import "UIBarButtonItem+Repeat.h"  并且设置  br_controllAcceptEventInterval 间隔时间

2:如果是 UIBarButtonItem，导入  #import "UIBarButtonItem+Repeat.h"  并设置 br_barItemAcceptEventInterval 间隔时间 (ps 目前 UIBarButtonItem 出现了问题，作者正在寻找方法中...)

3: 设置全局默认 间隔时间 +(void)setDefualtInterval:(NSTimeInterval)interval;
