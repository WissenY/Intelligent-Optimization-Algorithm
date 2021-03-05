function d = incremental_distance(s, i, j, Distance)
%计算当前解s在序号i,j互换的情况下路径长度的增量
%互换方式为是s(i,j) -> s(j,i)

d = 0;
n = size(Distance,1);
if (j-i == 1) && j ~= n && i ~= 1                                           %判断i,j是否是相邻城市
    d = d + Distance(s(j),s(i-1)) + Distance(s(i),s(j+1)) ...
          - Distance(s(i),s(i-1)) - Distance(s(j),s(j+1)) ;
end
if i == 1 || j == n                                                         %判断i,j是否处在序列s首尾
    if i == 1 && j == n
        d = d + Distance(s(i),s(n-1)) + Distance(s(j),s(2)) ...
              - Distance(s(j),s(n-1)) - Distance(s(i),s(2)) ; 
    end
    elseif i ~= 1
        d = d + Distance(s(i),s(n-1)) + Distance(s(i),s(1)) + Distance(s(j),s(i-1)) + Distance(s(j),s(i+1)) ...
              - Distance(s(j),s(n-1)) - Distance(s(j),s(1)) - Distance(s(i),s(i-1)) - Distance(s(i),s(i+1)) ;
    elseif j ~= n
        d = d + Distance(s(j),s(n)) + Distance(s(j),s(2)) + Distance(s(i),s(j-1)) + Distance(s(i),s(j+1)) ...
              - Distance(s(i),s(n)) - Distance(s(i),s(2)) - Distance(s(j),s(j-1)) - Distance(s(j),s(j+1)) ;
else
    d = d + Distance(s(j),s(i-1)) + Distance(s(j),s(i+1)) + Distance(s(i),s(j-1)) + Distance(s(i),s(j+1)) ...
          - Distance(s(i),s(i-1)) - Distance(s(i),s(i+1)) - Distance(s(j),s(j-1)) - Distance(s(j),s(j+1)) ;
end
