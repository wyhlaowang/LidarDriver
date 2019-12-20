classdef ce30PointCloud < handle
    properties (Constant)
        DATAPACK_NUM = 1;
        ANGLE_HOR = 60;
        PIXEL_HOR = 320;
        ANGLE_VER = 4;
        PIXEL_VER = 20;
        DIST_MIN = 0;
        DIST_MAX = 2;
    end
    
    properties
        preAllocatedDataPack = zeros(816, 1);
        preAllocatedDataFrame = zeros(816, 27);
        preAllocatedCartMatrix = zeros(6400, 3);           
        preAllocatedCartCell = cell(20, 320);
        preAllocatedPolarCell = cell(20, 320);
        preAllocatedDistantMatrix = zeros(20, 320);
        cartX;
        cartY;
        cartZ;
        polarDistant;
        polarAngleHor;
        polarAngleVer;     
    end
    
    properties(Dependent)
    end
    
    methods
        function obj = ce30PointCloud
        end
    end

    methods
        ce30_ReadData(obj, ce30_udp_obj);
        ce30_ExtractAngleDist(obj, packIdx, blockIdx, sensorIdx);        
        ce30_Polar2Cart(obj);
        cartMatrix = ce30_Raw2CartPolar(obj);
        ce30_DataWrite(obj, indexColumn, indexCartMatrix, indexCartPolar)   ;
    end       
end 