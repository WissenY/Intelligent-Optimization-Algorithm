function [f,p]=objf(s)

r=size(s); %��ȡ��Ⱥ��С
inn=r(1);%��inn������
bn=r(2);%���峤��Ϊbn
for i=1:inn
    t=s(i,:);
    x=t*2.^[bn-1:-1:0].';%��������ת��Ϊʮ����
    xx=-32+x*64/(power(2,bn)-1);
    f(i)=ft(xx);%���㺯��ֵ������Ӧ��
end
f=f';%����fת��
fsum=0;

%����ѡ����ʣ�����������Ӧ�ȷ��䣬����Ӧ�ȵ�ƽ����ƽ���ܺ͵�ռ��
for i=1:inn
    fsum=fsum+f(i)*f(i);
end
for i=1:inn
    ps(i)=f(i)*f(i)/fsum;
end

%�����ۼƸ���
p(1)=ps(1);
for i=2:inn
    p(i)=p(i-1)+ps(i);%�����ۼ�
end
p=p';