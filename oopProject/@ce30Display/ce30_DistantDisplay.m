function ce30_DistantDisplay(obj, distantMatrix)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_DistantDisplay；
% @Brief    以图像的方式显示距离矩阵；
% @Param    距离矩阵；属性，DISTANT_PLAYER_MIN：播放器中的最小距离，DISTANT_PLAYER_MAX：播放器中的最大距离；
% @Retval	NONE；
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    distantMatrix(distantMatrix < obj.DISTANT_PLAYER_MIN) = 0; 
    distantMatrix(distantMatrix > obj.DISTANT_PLAYER_MAX) = 0; 
    image(distantMatrix, 'CDataMapping', 'scaled');
    colorbar;
    title('距离深度图')
end  