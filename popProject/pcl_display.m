function pcl_display(obj_ce30, PRE_DATAPACK, PRE_RECEIVE, PRE_XYZPOINTS, PCDPLAYER)
    receiveAll = read_data(obj_ce30, PRE_DATAPACK, PRE_RECEIVE);
%     if(receiveAll(17, :) == 0)
        xyzPoints = rece_process(receiveAll, PRE_XYZPOINTS);             
%         xyzPointsFilter = filter_r(xyzPoints);
        ptCloud = pointCloud(xyzPoints);
%         ptCloudB = pcdenoise(ptCloud); 
        view(PCDPLAYER, ptCloud);        
%     elseif(receiveAll(17, :) == 3)
%         img = rece2depth(receiveAll);
%         imshow(img);
%     end    
end

function pcd_index()
pack_num = 26;
block_num = 12;
block_last_num = 8;
sensor_num = 20;
sensor_index = repmat((1: 1: sensor_num)', block_num * pack_num + block_last_num, 1);
block_index = [repmat(reshape(repmat((1: 1: block_num)', 1, sensor_num)', [], 1), pack_num, 1); ...
    reshape(repmat((1: 1: block_last_num)', 1, sensor_num)', [], 1)];
pack_index = [reshape(repmat((1: 1: pack_num)', 1, block_num * sensor_num)', [], 1); ...
    27 * ones(8 * sensor_num, 1)];
end