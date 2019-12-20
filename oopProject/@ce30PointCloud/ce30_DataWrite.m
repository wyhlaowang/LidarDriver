function ce30_DataWrite(obj, indexColumn, indexCartMatrix, indexCartPolar)    
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% @Func	  	ce30_DataWrite；
% @Brief    将处理的数据写入类的属性中；
% @Param    indexColumn：列索引；indexCartMatrix，笛卡尔坐标系行索引：indexCartPolar：极坐标系行索引
% @Retval	修改属性的值；
% @Date     2019/11/21；
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
%% 函数主体
    obj.preAllocatedCartMatrix(indexCartMatrix, 1) = obj.cartX; 
    obj.preAllocatedCartMatrix(indexCartMatrix, 2) = obj.cartY; 
    obj.preAllocatedCartMatrix(indexCartMatrix, 3) = obj.cartZ;                 
    obj.preAllocatedCartCell{indexColumn,indexCartPolar} = [obj.cartX, obj.cartY, obj.cartZ];
    obj.preAllocatedPolarCell{indexColumn,indexCartPolar} = [obj.polarDistant, obj.polarAngleHor, obj.polarAngleVer];
    obj.preAllocatedDistantMatrix(indexColumn,indexCartPolar) = obj.polarDistant;
end