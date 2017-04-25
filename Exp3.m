clear
clc

a=[200 180 140];                  % a,b,g are constants of cost function
b=[7 6.3 6.8];
g=[0.008 0.009 0.007];            %Pd=Power Demand,E=Tolerance
Pd=150; E=10^(-2)  ; L=9;         %L(lamda)=Incremental Fuel Cost
dP=5; n=0;                        %n=no of iterations
Pmax=[85 80 70];
Pmin=[10 10 10];
B=[0.000218 0.000093 0.000028; 0.0093 0.000228 0.000017; 0.000028 0.000017 0.000179];
B0=[0.000003 0.000031 0.0000115];
B00=0.0000030523;

while (abs(dP)>E)
n=n+1; C=0;
for i=1:length(a)
    P(i)=(L-b(i))/(2*g(i)+L*B(i,i));
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
Ploss=0;
for i=1:3
    for k=1:3
        Ploss=Ploss+P(i)*B(i,k)*P(k)+B0(i)*P(i)+B00;
    end
end
PowerLoss(n,1)=Ploss;
P1(n,1)=P(1);P2(n,1)=P(2);P3(n,1)=P(3);
Cost(n,1)=C;
IFC(n,1)=L;
Iteration(n,1)=n;
dP=sum(P)-Pd-Ploss;
dLd=0;
for i=1:3
    dLd=dLd+(g(i)+B(i,i)+b(i))/(2*(g(i)+L*B(i,i)));
end
dL=dP/dLd;
L=L-dL/2;

end

figure(1);plot(IFC)
figure(2);plot(Cost)
figure(3);plot(PowerLoss)

T=table(Iteration,IFC,Cost,P1,P2,P3,PowerLoss)
