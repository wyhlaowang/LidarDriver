function ce30_ClosePort(obj)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_ClosePort；
% @Brief    关闭ce30的端口；
% @Param    NONE
% @Retval	修改属性的值；
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    flushinput(obj.ce30_udp_obj); 
    fclose(obj.ce30_udp_obj); 
end  