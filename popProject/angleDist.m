function [Dist, angle_hori, angle_vert] = angleDist(pack_idx, block_idx, sensor_idx, data_raw)
%angleDist：给出数据包、数据块、感光元件位置，解算极坐标中的距离和角度
% pack_idx：数据包（1-27），360列数据分为27个数据包发送
% block_idx：数据块（1-12），每个数据包中含有12个数据块
% sensor_idx：感光元件（1-20），每个数据块含有20个感光元件数据和一个横向偏射角
%% 函数主体
    % 原始数据的列，也就是第几个数据包
    table_column = pack_idx;
    % 横向偏射角位置 = 数据头（43Byte） + 数据块位置（(block_idx - 1) * 64Byte) + 识别码(2Byte)
    angle_hori1_posi =  43 + (block_idx - 1) * 64 + 2;
    angle_hori2_posi =  43 + (block_idx - 1) * 64 + 2 + 1;
    % 计算横向偏射角
    angle_hori1 = data_raw(angle_hori1_posi, table_column);
    angle_hori2 = data_raw(angle_hori2_posi, table_column);
    % 横向偏射角 = (横向偏射角第二字节 * 16 * 16 + 横向偏射角第一字节) / 100;
    angle_hori = (angle_hori2 * 16 * 16 + angle_hori1) / 100;
    % 纵向偏射角 = 最大值 - 实物行 * 0.2
    angle_vert = 2.1 - sensor_idx * 0.2;
    % 距离信息第一字节位置 = 数据头（43Byte） + 数据块位置（(block_idx - 1) * 64Byte) ...
    ... + 识别码(2Byte) + 横向偏射角(2Byte) + 感光元件位置(1个感光元件3Byte)
    dist1_posi = 43 + (block_idx - 1) * 64 + 4 + (sensor_idx - 1) * 3;
    dist2_posi = dist1_posi + 1;
    % 计算距离信息
    dist1 = data_raw(dist1_posi, table_column);
    dist2 = data_raw(dist2_posi, table_column);
    % 距离信息 = (距离信息第二字节 * 16 * 16) * 2 / 1000;
    Dist = (dist2 * 16 * 16 + dist1) * 2 / 1000;
    if(Dist < MacroDefine.DIST_MIN)
        Dist = 0;
    elseif(Dist > MacroDefine.DIST_MAX)
        Dist = 0;
    end
    % 标识位 = 距离信息第二字节位置 + 1；
    sig = data_raw(dist2_posi + 1, table_column);
    if sig ~= 0
        Dist = 0;
    end
end

