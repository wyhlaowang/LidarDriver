function ptCloudDown = algorithm_downsample(ptCloud)
% 点云目标识别算法：基于欧几里得距离将点云划分为集群
%% 函数主体
gridStep = 0.01;
ptCloudDown = pcdownsample(ptCloud, 'gridAverage', gridStep);
end
