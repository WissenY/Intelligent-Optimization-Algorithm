clear
clc

%参数设置
w = [89;59;19;43;100;72;44;16;7;64];        %价值
w = -w;                                     %取负值来求最小值
c = [95;75;23;73;50;22;6;57;89;98];         %体积
v = 100;                                    %背包总容积
num = 10;                                   %10件物品数量
t0 = 100;                                   %初温
tf = 1;                                     %终温
a=0.95;                                     %退温系数

%初始化
t = t0;
sol_new = ones(1,num);                      %生成全为1的初始解，初始状态全选所有物品
sol_current = sol_new;
sol_best = sol_new;
E_current = inf;                            %E_current是当前解对应的目标函数值（即背包中物品总价值） 
E_best = inf;                               %E_best是最优解

p = 1;
while t >= tf
    for r = 1:100
        
        %产生新状态
        tmp = ceil(rand*num);%产生随机扰动
        sol_new(1,tmp) = ~sol_new(1,tmp);
        %找到一个满足容积约束的组合为止
        while 1
            q = (sol_new * c <= v);
            if ~q
                p = ~p;             %逐步从两端向中间置0
                tmp = find(sol_new == 1);%找出所有为1的元素并返回索引
                if p
                    sol_new(1,tmp(1)) = 0;
                else
                    sol_new(1,tmp(end)) = 0;
                end
            else
                break 
            end
        end
        
        %Metropolis准则
        E_new = sol_new * w;
        if E_new < E_current
            E_current = E_new;
            sol_current = sol_new;
            if E_new < E_best
                E_best = E_new;
                sol_best = sol_new;
            end
        else
            if rand < exp( -(E_new - E_current) / t)
                E_current = E_new;
                sol_surrent = sol_new;
            else
                sol_new = sol_current;
            end
        end
        
    end
    t = t * a; %退温
end

disp('最优解为:');
sol_best
disp('物品总价值等于:');
val = -E_best;
disp(val);
disp('背包中物品体积是:');
disp(sol_best * c);
