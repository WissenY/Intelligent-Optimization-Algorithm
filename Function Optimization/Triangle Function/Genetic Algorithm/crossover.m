function children_cr = crossover(children, prob_cr, num_gen)
%基于概率的交叉操作
%将选择后的两子代进行3点交叉

if prob_cr > rand
    loc = randi((num_gen-1));   %loc取值在[1,num_gen-1]内
    children_cr(1,:) = [children(1, 1:loc) children(2, (loc+1) : end)];
    children_cr(2,:) = [children(2, 1:loc) children(1, (loc+1) : end)];
else
    children_cr = children;
end