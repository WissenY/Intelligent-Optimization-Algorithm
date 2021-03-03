function [max_y, max_x, mean_y] = Genetic_Algorithm(num_pop, num_gen, prob_cr, prob_mu, max_gen, x_l, x_s)
%遗传算法主函数

%初始化
population = round(rand(num_pop, num_gen));
generation = 1;
max_y = zeros(num_pop,1);
max_x = zeros(num_pop,1);
mean_y = zeros(num_pop,1);

%遗传迭代
while generation <= max_gen
    children_cr = zeros(2, num_gen);
    children_mu = zeros(num_pop, num_gen);
    %每次选出两个个体进行遗传操作
    for g = 1:2:num_pop
        children = select(population, x_l, x_s);
        children_cr = crossover(children, prob_cr, num_gen);
        children_mu(g,:) = mutate(children_cr(1,:), prob_mu, num_gen);
        children_mu(g+1,:) = mutate(children_cr(2,:), prob_mu, num_gen);
    end
    population = children_mu;
    
    %记录每代优化结果
    x = decode(population, x_l, x_s);
    fit = fit_func(x);
    [max_fit, max_index] = max(fit);
    max_y(generation) = max_fit;
    max_x(generation) = x(max_index,:);
    mean_y(generation) = mean(fit);
    generation = generation + 1;
end