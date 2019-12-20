function ce30_StopDistant(obj)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_StopDistant；
% @Brief    发送停止测距命令；
% @Param    属性，CMD_STOP_DISTANT：停止测距命令；
% @Retval	修改属性的值；
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    flushinput(obj.ce30_udp_obj);            
    fprintf(obj.ce30_udp_obj, obj.CMD_STOP_DISTANT);
end