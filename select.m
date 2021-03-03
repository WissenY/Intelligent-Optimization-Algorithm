function children = select(population, x_l, x_s)
%基于概率的选择方式
%使用轮盘赌方法

children_index = zeros(2,1);
num_pop = size(population, 1);

%由初始种群解码出随机的初始自变量
x = decode(population, x_l, x_s);
%计算由适应度而来的选择概率
fit = fit_func(x);
probability = fit.^2 ./ (sum(fit.^2));
%计算累积概率
sum_prob = zeros(num_pop, 1);
sum_temp = 0;
for i = 1:num_pop
    sum_temp = sum_temp + probability(i);
    sum_prob(i) = sum_temp;
end

%轮盘赌方式选择两个个体
for i = 1:2
    select_parents = (sum_prob - rand) > 0; %累积概率减去随机数并转为0-1向量
    children_index(i) = find(select_parents,1);  %找出第一个非0元素的索引
end
children(1,:) = population(children_index(1),:);
children(2,:) = population(children_index(2),:);

    
    

