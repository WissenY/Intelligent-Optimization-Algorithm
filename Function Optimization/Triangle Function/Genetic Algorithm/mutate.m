function children_mu = mutate(children_cr, prob_mu, num_gen)
%基于概率的变异操作
%对二进制编码采用换位变异

children_mu = children_cr;
if prob_mu> rand
    loc = randi(num_gen,1,2);
    children_mu(1,loc(1)) = children_cr(1,loc(2));
    children_mu(1,loc(2)) = children_cr(1,loc(1));
end

