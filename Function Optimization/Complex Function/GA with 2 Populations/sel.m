function seln=sel(s,p)
inn=size(p,1); %�ۼƸ��ʾ��������
%����Ⱥ��ѡ����������
for i=1:2
    r=rand;
    prand=p-r;
    j=1;
    while prand(j)<0 %ѡ���һ����С��0���ۼƸ��ʵĸ���
        j=j+1;
    end
    seln(i)=j;
end