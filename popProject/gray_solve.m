function gray = gray_solve(pack_idx, block_idx, sensor_idx, data_raw)
% angleDist：给出数据包、数据块、感光元件位置，解算极坐标中的距离和角度
% pack_idx：数据包（1-27），360列数据分为27个数据包发送
% block_idx：数据块（1-12），每个数据包中含有12个数据块
% sensor_idx：感光元件（1-20），每个数据块含有20个感光元件数据和一个横向偏射角
%% 函数主体
    % 原始数据的列，也就是第几个数据包
    table_column = pack_idx;
    % 灰度信息第一字节位置 = 数据头（43Byte） + 数据块位置（(block_idx - 1) * 64Byte) ...
    ... + 识别码(2Byte) + 横向偏射角(2Byte) + 感光元件位置(1个感光元件3Byte)
    gray1_posi = 43 + (block_idx - 1) * 64 + 4 + (sensor_idx - 1) * 3;
    gray2_posi = gray1_posi + 1;
    % 计算灰度信息
    gray1 = data_raw(gray1_posi, table_column);
    gray2 = data_raw(gray2_posi, table_column);
    % 灰度信息 = (距离信息第二字节 * 16 * 16) * 2 / 1000;
    gray = (gray2 * 16 * 16 + gray1) * 2 / 1000;
end

