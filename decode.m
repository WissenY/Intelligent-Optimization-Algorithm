function x = decode(population, x_l, x_s)
%将2进制转化为10进制
%普适性2进制解码方法

[num_pop,num_gen] = size(population);
x = zeros(num_pop, 1);
x = population * (2 .^ [num_gen-1:-1:0])';
x = x_s + x * (x_l - x_s) / (2^num_gen-1);