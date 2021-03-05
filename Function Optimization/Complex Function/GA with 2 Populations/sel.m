function seln=sel(s,p)
inn=size(p,1); %累计概率矩阵的行数
%从种群中选择两个个体
for i=1:2
    r=rand;
    prand=p-r;
    j=1;
    while prand(j)<0 %选择第一个不小于0的累计概率的个体
        j=j+1;
    end
    seln(i)=j;
end