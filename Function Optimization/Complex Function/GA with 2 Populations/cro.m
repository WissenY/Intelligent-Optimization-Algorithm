function scro=cro(s,seln,pc)
r=size (s);
inn=r(1);
bn=r(2);
pcc=pro(pc);%���ݽ�����ʾ����Ƿ���н��������1���ǣ�0���
if pcc==1
    chb=round(rand*(bn-2))+1;
    scro(1,:)=[s(seln(1),1:chb) s(seln(2),chb+1:bn)];
    scro(2,:)=[s(seln(2),1:chb) s(seln(1),chb+1:bn)]; %����
else
    scro(1,:)=s(seln(1),:);
    scro(2,:)=s(seln(2),:);%������
end