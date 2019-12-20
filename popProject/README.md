---
typora-root-url: doc
---

# ce30-d激光雷达驱动（matlab面向过程）

## 综述
这是为面阵激光雷达ce30-d而开发的驱动代码，采用matlab的m语言，可直接显示点云图，处理速度约30fps。
作者：王宇豪@ifr（博远楼313）

## 效果

![](/Snipaste_2019-12-20_15-01-22pop.png)

![](/Snipaste_2019-12-20_15-02-04pop.png)

## 如何开始

- 建议安装matlab2019及以上版本
- 打开工程所在目录并运行
- 相关配置写在MacroDefine.m文件中，可修改显示样式、通信IP等参数

![](/Snipaste_2019-12-20_15-06-11pop.png)

![Snipaste_2019-12-20_15-06-35pop](/Snipaste_2019-12-20_15-06-35pop.png)

## 关于处理速度和激光雷达
经测试，在此工程下，处理速度约30fps，实时性较好，基本可以满足观测使用，如果加上滤波、分割等算法，速度有较为明显的下降，matlab在2018版本之后，计算机视觉工具箱变得十分丰富，可以利用该工具箱快速验证算法。

![](/Snipaste_2019-12-20_15-03-57pop.png)

激光雷达相关参数
参数表 Parameter | 典型值
- | -
测距方式 Method | 时间飞行法 Time of flight
工作波长 Peak Wavelength | 850nm
探测视场角 FoV | 60*4°
分辨率 Pixel Resolution | 320*20
角分辨率（垂直） Angular Resolution (vertical) | 0.2°
刷新速率 Frame Rate | 30fps
响应时间 Response Time | ≤167ms
距离分辨力 Ranging Resolution | 1cm
探测距离 Detecting Range | 0.4~28m@90%反射率
非模糊量程 Unambiguity Range | 28m
距离重复精度 Repeatability（1σ） |  ≤5cm

