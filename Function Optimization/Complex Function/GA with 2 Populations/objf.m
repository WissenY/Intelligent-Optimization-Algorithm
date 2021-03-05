function [f,p]=objf(s)

r=size(s); %读取种群大小
inn=r(1);%有inn个个体
bn=r(2);%个体长度为bn
for i=1:inn
    t=s(i,:);
    x=t*2.^[bn-1:-1:0].';%将二进制转换为十进制
    xx=-32+x*64/(power(2,bn)-1);
    f(i)=ft(xx);%计算函数值，即适应度
end
f=f';%向量f转置
fsum=0;

%计算选择概率，按比例的适应度分配，即适应度的平方在平方总和的占比
for i=1:inn
    fsum=fsum+f(i)*f(i);
end
for i=1:inn
    ps(i)=f(i)*f(i)/fsum;
end

%计算累计概率
p(1)=ps(1);
for i=2:inn
    p(i)=p(i-1)+ps(i);%概率累加
end
p=p';