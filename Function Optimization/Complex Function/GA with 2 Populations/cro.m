function scro=cro(s,seln,pc)
r=size (s);
inn=r(1);
bn=r(2);
pcc=pro(pc);%根据交叉概率决定是否进行交叉操作，1则是，0则否
if pcc==1
    chb=round(rand*(bn-2))+1;
    scro(1,:)=[s(seln(1),1:chb) s(seln(2),chb+1:bn)];
    scro(2,:)=[s(seln(2),1:chb) s(seln(1),chb+1:bn)]; %交换
else
    scro(1,:)=s(seln(1),:);
    scro(2,:)=s(seln(2),:);%不交换
end