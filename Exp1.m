clear
clc

a=[500 400 200];
b=[5.3 5.5 5.8];
g=[0.004 0.006 0.009];
Pd=800; E=10^(-4); L(1)=6

for i=1:3
    P(i)=(L(1)-b(i))/(2*g(i))
end
flag=1
dP=sum(P)-Pd
while (abs(dP)>E)

for i=1:3
    P(i)=(L(1)-b(i))/(2*g(i))
end

dP=sum(P)-Pd
dL=dP/sum(1./(2.*g))
L=L-dL/2
flag=flag+1
end

     
    

