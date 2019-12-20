classdef MacroDefine
%%     
% MacroDefine:通过常量属性的方式实现类似宏定义
%% 
    properties (Constant)
        GRAY_EN  =  'enableGrayOutput 1                                ';
        GRAY_DIS =  'enableGrayOutput 0                                ';
        GET_DIST =  'getDistanceAndAmplitudeSorted                     ';
        STOP_DIST = 'join                                              ';
        REMOTE_HOST = '192.168.1.80';
        REMOTE_PORT = 2368;
        IN_BUFF_SIZE = 816 * 27 * 10;
        IN_DATAPACK_SIZE = 816;
        PCD_PLAYER_X = [0, 10];
        PCD_PLAYER_Y = [-5, 5];
        PCD_PLAYER_Z = [-1, 1];
        TIMER_PERIOD = 0.6 / 30;
        ANGLE2RAD = pi / 180;
        RAD2ANGLE = 180 / pi;
        FILTER_R_INTENS = 100;
        FILTER_R_NUM = 5;
        DIST_MIN = 0;
        DIST_MAX = 2;
        DATAPACK_NUM = 1;
        ANGLE_HOR = 60;
        PIXEL_HOR = 320;
        ANGLE_VER = 4;
        PIXEL_VER = 20;
    end
% GRAY_EN：CE30使能灰度信息指令
% GRAY_DIS：CE30失能灰度信息指令
% GET_DIST：CE30测距指令
% STOP_DIST：CE30停止测距指令
% REMOTE_HOST：CE30默认IP地址+
% REMOTE_PORT：CE30默认端口
% IN_BUFF_SIZE：UDP默认输入缓存
% IN_DATAPACK_SIZE：每个数据包大小
% PCD_PLAYER_X：点云显示器X轴范围
% PCD_PLAYER_Y：点云显示器Y轴范围
% PCD_PLAYER_Z：点云显示器Z轴范围
% TIMER_PERIOD：UDP采样周期
% angle2rad:弧度 = 角度 * angle2rad
% rad2angle:角度 = 弧度 * angle2rad
% FILTER_R_INTEN:半径滤波强度（半径），滤波半径 = 滤波强度 * 分辨率
% FILTER_R_NUM:半径滤波范围内的点数
% DIST_MIN:距离滤波最小值
% DIST_MAX:距离滤波最大值
% DATAPACK_NUM:一次读回数据包的数量
% ANGLE_HOR:水平开角
% PIXEL_HOR:水平像素
% ANGLE_VER:垂直开角
% PIXEL_VER:垂直像素
end

