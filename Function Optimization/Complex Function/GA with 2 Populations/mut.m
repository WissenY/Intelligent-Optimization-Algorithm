function snnew=mut(snew,pm)

r=size(snew);
bn=r(2);
snnew=snew;
pmm=pro(pm); %���ݱ�����ʾ����Ƿ���б������
if pmm==1
    chb=round(rand*(bn-1))+1;%��������λ��
    snnew(chb)=abs(snew(chb)-1);%���þ���ֵ��������ʵ��0-1�任
end