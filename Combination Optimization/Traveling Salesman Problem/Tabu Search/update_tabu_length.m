function new_tabu_list = update_tabu_length(tabu_list)
%更新禁忌表中各非零项的禁忌长度
%随迭代过程减少

new_tabu_list = tabu_list;

index = find(tabu_list);                                                    %找非零项的线性序列
m = size(index,1);                                                          %非零项个数，即当前禁忌表中存储的禁忌项个数
n = size(tabu_list,1);                                                      %城市数

incremental_length = zeros(n,n);                                            %禁忌长度增量
for i = 1:m
    incremental_length(index(i)) = -1;
end
new_tabu_list = tabu_list + incremental_length;