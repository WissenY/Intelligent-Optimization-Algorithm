clear

bn=33; %���崮���ȣ�����Ϊ8λС��
inn=50; %��ʼ��Ⱥ��С
gnmax=200; %������
pc=0.75; %�������
pm=0.1; %�������
s=round(rand(inn,bn)); %����50*33����������󣬼���ʼ��Ⱥ
[f,p]=objf(s); %������Ӧ�ȣ�������Ӧ��f���ۼƸ���p

gn=1;   %����
while gn<gnmax+1 %ѭ��200��
    
    %һ�θ���
    for j=1:2:inn %����ѭ��
        %ѡ��
        seln=sel(s,p); %s��ʼ��Ⱥ,p�ۼƸ���
        %����
        scro=cro(s,seln,pc);
        scnew(j,:)=scro(1,:);
        scnew(j+1,:)=scro(2,:);
        %����
        smnew(j,:)=mut(scnew(j,:),pm);
        smnew(j+1,:)=mut(scnew(j+1,:),pm);
    end
    
    s=smnew; %��������Ⱥ
    [f,p]=objf(s);%��������Ⱥ����Ӧ��
    %��¼������ú�ƽ������Ӧ��
    [fmax,nmax]=max(f); %namx�������ֵ��������fmaxΪ���ֵ
    fmean=mean(f);
    %��¼ÿһ����ú�ƽ����Ӧ��
    ymax(gn)=fmax;
    ymean(gn)=fmean;
    %��¼��ǰ������Ѹ���
    x=s(nmax,:)*2.^[bn-1:-1:0]';%������ת��Ϊʮ����
    xx=-32+x*64/(power(2,bn)-1);%�������ͱ�Ϊ������
    xmax(gn)=xx;
    
    gn=gn+1;
end
gn=gn-1; %ʵ�ʴ���
    
%����ͼ��
    subplot(2,1,1); %2*1��ͼ����ʾ��һ�����ڣ���ǰ�����ڵ�һ������
    plot(1:gn,[ymax;ymean]); %������Ӧ�ȵ�2*1���󣬲��������
    title('������Ӧ�ȱ仯'); 
    legend('�����Ӧ��','ƽ����Ӧ�ȱ仯'); %ͼ��
    string1=['������Ӧ��',num2str(ymax(gn))];
    gtext(string1);
    subplot(2,1,2);%�ڵڶ������ڻ���
    plot(1:gn,xmax,'r-');
    legend('�Ա���');%ʹ�ú�ɫ-�ű�ע�Ա���ͼ��
    string2=['�����Ա���',num2str(xmax(gn))]; %������ת��Ϊ�ַ���
    gtext(string2);%����ѡ��Ӧͼ�ϵ�󣬸�λ�ü������Ϊstring2������