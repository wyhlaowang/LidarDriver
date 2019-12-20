function ce30_OpenPort(obj)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_OpenPort；
% @Brief    打开数据端口；
% @Param    NONE；
% @Retval	NONE
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    fopen(obj.ce30_udp_obj);
    flushinput(obj.ce30_udp_obj);  
end