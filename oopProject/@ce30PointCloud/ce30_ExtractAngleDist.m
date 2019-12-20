function ce30_ExtractAngleDist(obj, packIdx, blockIdx, sensorIdx)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_ExtractAngleDist；
% @Brief    从原始数据中提取角度和距离信息；
% @Param    angleDist：给出数据包、数据块、感光元件位置，解算极坐标中的距离和角度
%           pack_idx：数据包（1-27），360列数据分为27个数据包发送
%           block_idx：数据块（1-12），每个数据包中含有12个数据块
%           sensor_idx：感光元件（1-20），每个数据块含有20个感光元件数据和一个横向偏射角
% @Retval	NONE；
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    % 原始数据的列，也就是第几个数据包
    table_column = packIdx;
    % 横向偏射角位置 = 数据头（43Byte） + 数据块位置（(block_idx - 1) * 64Byte) + 识别码(2Byte)
    angleHor1Pos =  43 + (blockIdx - 1) * 64 + 2;
    angleHor2Pos =  43 + (blockIdx - 1) * 64 + 2 + 1;
    % 计算横向偏射角
    angleHor1 = obj.preAllocatedDataFrame(angleHor1Pos, table_column);
    angleHor2 = obj.preAllocatedDataFrame(angleHor2Pos, table_column);
    % 横向偏射角 = (横向偏射角第二字节 * 16 * 16 + 横向偏射角第一字节) / 100;
    obj.polarAngleHor = (angleHor2 * 16 * 16 + angleHor1) / 100;
    % 纵向偏射角 = 最大值 - 实物行 * 0.2
    obj.polarAngleVer = 2.1 - sensorIdx * 0.2;
    % 距离信息第一字节位置 = 数据头（43Byte） + 数据块位置（(block_idx - 1) * 64Byte) ...
    ... + 识别码(2Byte) + 横向偏射角(2Byte) + 感光元件位置(1个感光元件3Byte)
    dist1Posi = 43 + (blockIdx - 1) * 64 + 4 + (sensorIdx - 1) * 3;
    dist2Posi = dist1Posi + 1;
    % 计算距离信息
    dist1 = obj.preAllocatedDataFrame(dist1Posi, table_column);
    dist2 = obj.preAllocatedDataFrame(dist2Posi, table_column);
    % 距离信息 = (距离信息第二字节 * 16 * 16) * 2 / 1000;
    obj.polarDistant = (dist2 * 16 * 16 + dist1) * 2 / 1000;
    if(obj.polarDistant < obj.DIST_MIN)
        obj.polarDistant = 0;
    elseif(obj.polarDistant > obj.DIST_MAX)
        obj.polarDistant = 0;
    end
    % 标识位 = 距离信息第二字节位置 + 1;
    sig = obj.preAllocatedDataFrame(dist2Posi + 1, table_column);
    if sig ~= 0
        obj.polarDistant = 0;
    end
end    

