function xyzPoints = rece_process(receiveAll, PRE_XYZPOINTS)
% rece_process：对接收到的数据进行处理
% receive：已接收的完整原始数据
% data：处理完成的数据
%% 函数主体
    j = 1;
    for p = 1: 1: 26
        for b = 1: 1: 12
            for s = 1: 1: 20
                [PRE_XYZPOINTS(j, 1), PRE_XYZPOINTS(j, 2), PRE_XYZPOINTS(j, 3)] = polar2xyz(p, b, s, receiveAll);
                j = j + 1;
            end
        end
    end
    for b = 1: 1: 8
        for s = 1: 1: 20
            [PRE_XYZPOINTS(j, 1), PRE_XYZPOINTS(j, 2), PRE_XYZPOINTS(j, 3)] = polar2xyz(27, b, s, receiveAll);
            j = j + 1;
        end
    end
    xyzPoints = PRE_XYZPOINTS;
end

function [x, y, z] = polar2xyz(pack_idx, block_idx, sensor_idx, data_raw)
% polar2xyz：给出数据包、数据块、感光元件位置，将极坐标转换为xyz坐标
% pack_idx：数据包（1-27），360列数据分为27个数据包发送
% block_idx：数据块（1-12），每个数据包中含有12个数据块
% sensor_idx：感光元件（1-20），每个数据块含有20个感光元件数据和一个横向偏射角
%% 函数主体
    % 解算到xyz坐标系
    [Dist, angle_hori, angle_vert] = angleDist(pack_idx, block_idx, sensor_idx, data_raw);
    x = Dist * sind(90 - angle_vert) * cosd(angle_hori - 30);
    y = Dist * sind(90 - angle_vert) * sind(angle_hori - 30);
    z = Dist * cosd(90 - angle_vert);
end