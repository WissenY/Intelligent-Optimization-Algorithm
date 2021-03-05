function y=ft(x)
r=size(x);
n=r(2);
a=0;
b=0;
for i=1:n
    a=a+x(i)^2;
    b=b+cos(2*pi*x(i));
end
a=(a/50)^0.5;
b=b/50;
y=-20*exp(-0.2*a)-exp(b)+20+exp(1);