function ce30_Config(obj)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_Config；
% @Brief    初始化ce30的通信配置；
% @Param    属性，IN_BUFF_SIZE：输入缓存大小，IN_BUFF_SIZE：一个数据包大小，SAMPLE_PERIOD：采样周期
% @Retval	NONE
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    obj.ce30_udp_obj.InputBufferSize = obj.IN_BUFF_SIZE;
    obj.ce30_udp_obj.InputDatagramPacketSize = obj.IN_DATAPACK_SIZE;
    obj.ce30_udp_obj.TimerPeriod = obj.SAMPLE_PERIOD;
end