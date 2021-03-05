clear
clc

%��������
w = [89;59;19;43;100;72;44;16;7;64];        %��ֵ
w = -w;                                     %ȡ��ֵ������Сֵ
c = [95;75;23;73;50;22;6;57;89;98];         %���
v = 100;                                    %�������ݻ�
num = 10;                                   %10����Ʒ����
t0 = 100;                                   %����
tf = 1;                                     %����
a=0.95;                                     %����ϵ��

%��ʼ��
t = t0;
sol_new = ones(1,num);                      %����ȫΪ1�ĳ�ʼ�⣬��ʼ״̬ȫѡ������Ʒ
sol_current = sol_new;
sol_best = sol_new;
E_current = inf;                            %E_current�ǵ�ǰ���Ӧ��Ŀ�꺯��ֵ������������Ʒ�ܼ�ֵ�� 
E_best = inf;                               %E_best�����Ž�

p = 1;
while t >= tf
    for r = 1:100
        
        %������״̬
        tmp = ceil(rand*num);%��������Ŷ�
        sol_new(1,tmp) = ~sol_new(1,tmp);
        %�ҵ�һ�������ݻ�Լ�������Ϊֹ
        while 1
            q = (sol_new * c <= v);
            if ~q
                p = ~p;             %�𲽴��������м���0
                tmp = find(sol_new == 1);%�ҳ�����Ϊ1��Ԫ�ز���������
                if p
                    sol_new(1,tmp(1)) = 0;
                else
                    sol_new(1,tmp(end)) = 0;
                end
            else
                break 
            end
        end
        
        %Metropolis׼��
        E_new = sol_new * w;
        if E_new < E_current
            E_current = E_new;
            sol_current = sol_new;
            if E_new < E_best
                E_best = E_new;
                sol_best = sol_new;
            end
        else
            if rand < exp( -(E_new - E_current) / t)
                E_current = E_new;
                sol_surrent = sol_new;
            else
                sol_new = sol_current;
            end
        end
        
    end
    t = t * a; %����
end

disp('���Ž�Ϊ:');
sol_best
disp('��Ʒ�ܼ�ֵ����:');
val = -E_best;
disp(val);
disp('��������Ʒ�����:');
disp(sol_best * c);
