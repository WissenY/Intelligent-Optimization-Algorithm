clear all;      %清除所有变量
close all;      %清图
clc;            %清屏

%基本参数
num_pop = 100;
num_gen = 20;
prob_cr = 0.8;
prob_mu = 0.1;
max_gen = 10000;
x_l = 10;
x_s = 0;

%调用遗传算法
[max_y, max_x, mean_y] = Genetic_Algorithm(num_pop, num_gen, prob_cr, prob_mu, ...
    max_gen, x_l, x_s);

%绘图
subplot(2,1,1);
plot(1:max_gen,[max_y';mean_y']);
title('历代适应度变化');
legend('最大适应度','平均适应度');
string1=['最终适应度',num2str(max_y(max_gen))];
gtext(string1);
subplot(2,1,2);
plot(1:max_gen,max_x','r-');
legend('自变量');
string2=['最终自变量',num2str(max_x(max_gen))];
gtext(string2);