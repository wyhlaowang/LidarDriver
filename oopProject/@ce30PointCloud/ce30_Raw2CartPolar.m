function ce30_Raw2CartPolar(obj)
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_Raw2CartPolar；
% @Brief    将全部原始数据转化为需要的类型；
% @Param    NONE
% @Retval	修改属性的值；
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    indexCartMatrix = 1;
    indexCartPolar = 1;
    for p = 1: 1: 26
        for b = 1: 1: 12
            for s = 1: 1: 20
                obj.ce30_ExtractAngleDist(p, b, s);
                obj.ce30_Polar2Cart;
                obj.ce30_DataWrite(s, indexCartMatrix, indexCartPolar);
                indexCartMatrix = indexCartMatrix + 1;
            end
            indexCartPolar = indexCartPolar + 1;
        end
    end
    
    for b = 1: 1: 8
        for s = 1: 1: 20
            obj.ce30_ExtractAngleDist(27, b, s);
            obj.ce30_Polar2Cart;
            obj.ce30_DataWrite(s, indexCartMatrix, indexCartPolar);
            indexCartMatrix = indexCartMatrix + 1;  
        end
        indexCartPolar = indexCartPolar + 1;
    end
end     