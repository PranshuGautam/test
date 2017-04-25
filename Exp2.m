clear
clc

a=[500 400 200];                  % a,b,c are constants of cost function
b=[5.3 5.5 5.8];
g=[0.004 0.006 0.009];            %Pd=Power Demand,E=Tolerance
Pd=800; E=10^(-2)  ; L=12;         %L(lamda)=Incremental Fuel Cost
dP=5; n=0;                        %n=no of iterations
Pmax=[350 200 350];
Pmin=[150 100 100];

while (abs(dP)>E)
n=n+1; C=0;
for i=1:length(a)
    P(i)=(L-b(i))/(2*g(i));
    C=C+a(i)+b(i)*P(i)+g(i)*P(i)^2;
end

for i=1:length(a)
    if P(i)>Pmax(i)
        P(i)=Pmax(i);
    elseif P(i)<Pmin(i)
            P(i)=Pmin(i);
        else P(i)=P(i);
    end
end

P1(n,1)=P(1);P2(n,1)=P(2);P3(n,1)=P(3);
Cost(n,1)=C;
IFC(n,1)=L;
Iteration(n,1)=n;
dP=sum(P)-Pd;
dL=dP/sum(1./(2.*g));
L=L-dL/2;

end

figure(1);plot(IFC)
figure(2);plot(Cost)

T=table(Iteration,IFC,Cost,P1,P2,P3)
