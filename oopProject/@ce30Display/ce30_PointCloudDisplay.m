function ce30_PointCloudDisplay(obj, cartMatrix)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_PointCloudDisplay
% @Brief    显示点云图
% @Param	激光散点矩阵；属性，pcdPlayer：点云播放器；
% @Retval	NONE  
% @Date     2019/11/21
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    view(obj.pcdPlayer, cartMatrix); 
end  