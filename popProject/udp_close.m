function udp_close(obj, varargin)
% udp_close：关闭已建立的UDP连接
% obj：UDP目标
%% 默认配置
    p = inputParser;
    DEFAULT_CMD = MacroDefine.STOP_DIST;
    p.addOptional('cmd', DEFAULT_CMD, @isstring);
    parse(p, varargin{:});
%% 关闭UDP连接
    fprintf(obj, p.Results.cmd);
    flushinput(obj);
    fclose(obj);
end

