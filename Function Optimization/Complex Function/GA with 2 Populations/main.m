clear

bn=33; %个体串长度，精度为8位小数
inn=50; %初始种群大小
gnmax=200; %最大代数
pc=0.75; %交叉概率
pm=0.1; %变异概率
s=round(rand(inn,bn)); %产生50*33的随机数矩阵，即初始种群
[f,p]=objf(s); %计算适应度，返回适应度f和累计概率p

gn=1;   %代数
while gn<gnmax+1 %循环200次
    
    %一次更新
    for j=1:2:inn %奇数循环
        %选择
        seln=sel(s,p); %s初始种群,p累计概率
        %交叉
        scro=cro(s,seln,pc);
        scnew(j,:)=scro(1,:);
        scnew(j+1,:)=scro(2,:);
        %变异
        smnew(j,:)=mut(scnew(j,:),pm);
        smnew(j+1,:)=mut(scnew(j+1,:),pm);
    end
    
    s=smnew; %产生新种群
    [f,p]=objf(s);%计算新种群的适应度
    %记录当代最好和平均的适应度
    [fmax,nmax]=max(f); %namx返回最大值的索引，fmax为最大值
    fmean=mean(f);
    %记录每一代最好和平均适应度
    ymax(gn)=fmax;
    ymean(gn)=fmean;
    %记录当前代的最佳个体
    x=s(nmax,:)*2.^[bn-1:-1:0]';%二进制转化为十进制
    xx=-32+x*64/(power(2,bn)-1);%将基因型变为表现型
    xmax(gn)=xx;
    
    gn=gn+1;
end
gn=gn-1; %实际代数
    
%绘制图像
    subplot(2,1,1); %2*1个图像显示在一个窗口，当前绘制在第一个窗口
    plot(1:gn,[ymax;ymean]); %构造适应度的2*1矩阵，并逐代绘制
    title('历代适应度变化'); 
    legend('最大适应度','平均适应度变化'); %图例
    string1=['最终适应度',num2str(ymax(gn))];
    gtext(string1);
    subplot(2,1,2);%在第二个窗口绘制
    plot(1:gn,xmax,'r-');
    legend('自变量');%使用红色-号标注自变量图例
    string2=['最终自变量',num2str(xmax(gn))]; %将数字转化为字符串
    gtext(string2);%鼠标点选相应图上点后，该位置即被标记为string2的内容