function [Best_Distance,Best_Solution] = Tabu_Search(City_loc, Tabu_Length, Iteration_Num)
%禁忌搜索算法

%初始化
City_Num = size(City_loc,1);
Best_Distance = zeros(Iteration_Num,1);
Best_Solution = zeros(Iteration_Num,City_Num);

%计算城市间距离的矩阵
Distance = zeros(City_Num,City_Num);
for i = 1:City_Num-1
    for j = i:City_Num
        Distance(i,j) = ( ( City_loc(i,1) - City_loc(j,1) )^2 + ( City_loc(i,2) - City_loc(j,2) )^2 )^0.5;
        Distance(j,i) = Distance(i,j);
    end
end

%生成初试解
Init_Solution = randperm(City_Num);
Init_Distance = 0;
for i = 1:City_Num-1
    j = i+1;
    a = Init_Solution(i);
    b = Init_Solution(j);
    Init_Distance = Init_Distance + Distance(a,b);
end

%迭代
iter = 1;
%设置最优解
Best_Solution(iter,:) = Init_Solution;
Best_Distance(iter) = Init_Distance;
%初始化禁忌表
Tabu_List = zeros(City_Num,City_Num);

Current_Solution = Init_Solution;
Current_Distance = Init_Distance; 
while iter <= Iteration_Num
    Tabu_List = update_tabu_length(Tabu_List);                              %更新禁忌长度
    Neighborhood_Solution = gen_neigh_solu(Current_Solution, Distance);     %生成所有邻域解
    [Best_Distance(iter+1),Best_Solution(iter+1,:),...                      %根据禁忌表及特赦准则选择当前解
     Current_Distance,Current_Solution,Tabu_List] = ...
     select_can_solu( Best_Distance(iter),Best_Solution(iter,:),...
                      Current_Distance,Current_Solution, ...
                      Neighborhood_Solution, Tabu_List, Tabu_Length);
    iter = iter + 1;
end