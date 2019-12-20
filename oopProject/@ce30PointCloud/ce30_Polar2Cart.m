function ce30_Polar2Cart(obj)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_Polar2Cart；
% @Brief    将极坐标数据转化为笛卡尔坐标系；
% @Param    属性，polarDistant：极径，polarAngleHor：水平方向极角，polarAngleVer：垂直方向极角；
% @Retval	修改属性的值；
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    % 解算到xyz坐标系
    obj.cartX = obj.polarDistant * sind(90 - obj.polarAngleVer) * cosd(obj.polarAngleHor - 30);
    obj.cartY = obj.polarDistant * sind(90 - obj.polarAngleVer) * sind(obj.polarAngleHor - 30);
    obj.cartZ = obj.polarDistant * cosd(90 - obj.polarAngleVer);
end