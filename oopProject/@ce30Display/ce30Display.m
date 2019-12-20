classdef ce30Display < handle
    properties(Constant)
        PCD_PLAYER_X = [0, 10];
        PCD_PLAYER_Y = [-5, 5];
        PCD_PLAYER_Z = [-1, 1];       
        DISTANT_PLAYER_MIN = 0;
        DISTANT_PLAYER_MAX = 10;
    end

    properties
        pcdPlayer;        
    end
    
    methods
        function obj = ce30Display
            obj.pcdPlayer = pcplayer(obj.PCD_PLAYER_X, obj.PCD_PLAYER_Y, obj.PCD_PLAYER_Z);
        end       
    end
    
    methods
        ce30_PointCloudDisplay(obj, cartMatrix);
        ce30_DistantDisplay(obj, distantMatrix);
    end
end