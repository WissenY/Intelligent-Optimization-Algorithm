function neigh_solution = gen_neigh_solu(current_solution, Distance)
%基于交换的邻域解生成方式

n = size(current_solution,2);
neigh_solution = zeros(n, n);                                              %邻域解矩阵，数据结构为交换的城市序列（a,b）及其交换后的距离增量d

for i = 1:n-1
    for j = i:n
        %计算序号i,j对应的城市a,b及其交换后的距离增量d
        d = incremental_distance(current_solution, i, j, Distance);
        a = current_solution(i);
        b = current_solution(j);
        %计入邻域解矩阵中
        neigh_solution(a,b) = d;
        %neigh_solution(b,a) = neigh_solution(a,b);                         %为对称矩阵
    end
end