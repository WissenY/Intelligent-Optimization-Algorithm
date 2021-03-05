function snnew=mut(snew,pm)

r=size(snew);
bn=r(2);
snnew=snew;
pmm=pro(pm); %根据变异概率决定是否进行变异操作
if pmm==1
    chb=round(rand*(bn-1))+1;%产生变异位点
    snnew(chb)=abs(snew(chb)-1);%利用绝对值函数巧妙实现0-1变换
end