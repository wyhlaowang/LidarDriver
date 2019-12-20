function ce30_GetDistant(obj)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_GetDistant；
% @Brief    发送获取数据的命令；
% @Param    属性，CMD_GET_DISTANT：获取数据命令；
% @Retval	NONE
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    fprintf(obj.ce30_udp_obj, obj.CMD_GET_DISTANT);
    flushinput(obj.ce30_udp_obj);
end