function [UDP_obj] = udp_open(varargin)
% udp_open：打开UDP端口并清除输入缓存
%% 默认端口配置
    p = inputParser;
    DEFAULT_REMOTE_HOST = MacroDefine.REMOTE_HOST;
    DEFAULT_REMOTE_PORT = MacroDefine.REMOTE_PORT;
    p.addOptional('remote_host', DEFAULT_REMOTE_HOST, @isstring);
    p.addOptional('remote_port', DEFAULT_REMOTE_PORT);
    parse(p, varargin{:});
%% 建立连接
    % 寻找UDP目标
    UDP_obj = instrfind('Type', 'udp', 'RemoteHost', p.Results.remote_host, 'RemotePort', p.Results.remote_port, 'Tag', '');
    % 建立UDP目标
    if isempty(UDP_obj)
        UDP_obj = udp(p.Results.remote_host, p.Results.remote_port);
    % 否则关闭端口重新建立
    else
        fclose(UDP_obj);
        UDP_obj = UDP_obj(1);
    end
    % 打开端口
    UDP_obj.InputBufferSize = MacroDefine.IN_BUFF_SIZE;
    UDP_obj.InputDatagramPacketSize = MacroDefine.IN_DATAPACK_SIZE;
    UDP_obj.TimerPeriod = MacroDefine.TIMER_PERIOD;
    fopen(UDP_obj);
    % 清除输入缓存
    flushinput(UDP_obj);
end