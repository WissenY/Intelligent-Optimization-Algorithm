function fit = fit_func(x)
%适应度函数直接采用目标函数

%fit = x + 10 * sin(5*x) + 7 * cos(4*x);
fit = -(x + 10 * sin(5*x) + 7 * cos(4*x));      %标准型—求最小值
end

