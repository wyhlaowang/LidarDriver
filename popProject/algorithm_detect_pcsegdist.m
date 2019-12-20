function algorithm_detect_pcsegdist(ptCloud)
% 点云目标识别算法：基于欧几里得距离将点云划分为集群
%% 函数主体
minDistance = 0.5;
[labels,numClusters] = pcsegdist(ptCloud, minDistance);
pcshow(ptCloud.Location, labels)
colormap(hsv(numClusters))
end

