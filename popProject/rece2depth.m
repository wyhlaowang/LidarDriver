function [data] = rece2depth(receive)
% rece_process：对接收到的数据进行处理
% receive：已接收的完整原始数据
% data：处理完成的数据
%% 函数主体
    data = zeros(20, 320);
    i = 1;
    j = 1;
    for p = 1: 1: 26
        for b = 1: 1: 12
            for s = 1: 1: 20
                data(i, j) = gray_solve(p, b, s, receive);
                i = i + 1;
            end
            i = 1;
            j = j + 1;
        end
        i = 1;
    end 
    
    for b = 1: 1: 8
        for s = 1: 1: 20
            data(i, j) = gray_solve(27, b, s, receive);
            i = i + 1;
        end
        i = 1;
        j = j + 1;
    end
end
