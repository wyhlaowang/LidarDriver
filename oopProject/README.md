---
typora-root-url: doc
---

# ce30-d激光雷达驱动（matlab面向对象）

## 综述
这是为面阵激光雷达ce30-d而开发的驱动代码，采用matlab的m语言，可直接显示点云图、深度图，处理速度约30fps。
作者：王宇豪@ifr（博远楼313）

## 效果

![](/Snipaste_2019-12-20_14-55-55.png)

![Snipaste_2019-12-20_14-56-35](/Snipaste_2019-12-20_14-56-35.png)

![Snipaste_2019-12-20_14-57-36](/Snipaste_2019-12-20_14-57-36.png)

## 如何开始

- 建议安装matlab2019及以上版本

- 打开工程所在目录并运行

- 工程架构如下图所示，ce30Display目录存放点云显示的相关代码，ce30PointCloud目录存放点云原始数据相关代码，ce30Sensor目录存放通信协议、通信指令等代码。

    ![](/Snipaste_2019-12-20_15-52-55.png)

- 运行main.m
## 关于处理速度和激光雷达

经测试，在此工程下，处理速度约5ps，处理速度慢有两个原因，一是生成深度图耗费了大量系统，二是代码还需优化和matlab目前不支持多线程。不过matlab计算机视觉工具箱十分简单易用，可以利用该工具箱快速验证算法。

![](/Snipaste_2019-12-20_14-58-09.png)

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

