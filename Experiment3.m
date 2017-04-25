clear all;
close all;

a=[200 180 140];                  % a,b,g are constants of cost function
b=[7 6.3 6.8];
g=[0.008 0.009 0.007];            
Pd=150; E=10^(-2);                %n=no of iterations
L=[6.5 7 7.5 8 8.5 9];            %L(lamda)=Incremental Fuel Cost                       
Pmax=[85 80 70];                  %Pmax,Pmin=Maximum and minimum generating limits respectively
Pmin=[10 10 10];                  %status=1: plant output is within generation limit in that iteration
status=[1 1 1];                   %status=0: plant output has crossed generation limit in that iteration                                   %Pd=Power Demand,E=Tolerance

B=[0.000218 0.000093 0.000028; 0.0093 0.000228 0.000017; 0.000028 0.000017 0.000179];
B0=[0.000003 0.000031 0.0000115];
B00=0.0000030523;                 %B, B0 and B00 are Loss Coefficients
for j=1:length(L)
    dP=5; n=0; 
while (abs(dP)>E)
n=n+1; C=0; status=[1 1 1];
for i=1:length(a)
    P(i)=(L(j)-b(i))/(2*g(i)+L(j)*B(i,i));
    C=C+a(i)+b(i)*P(i)+g(i)*P(i)^2;
end
for i=1:length(a)
    if P(i)>Pmax(i)
        P(i)=Pmax(i);
        status(i)=0;
    elseif P(i)<Pmin(i)
            P(i)=Pmin(i);
            status(i)=0;
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
Status(n,:)=status;
P1(n,1)=P(1);P2(n,1)=P(2);P3(n,1)=P(3);
Cost(n,1)=C;
IC(n,1)=L(j);
Iteration(n,1)=n;
dP=sum(P)-Pd-Ploss;
dLd=0;
for i=1:3
    dLd=dLd+(g(i)+B(i,i)+b(i))/(2*(g(i)+L(j)*B(i,i)));
end
dL=dP/dLd;
L(j)=L(j)-dL/2;
Pdemand(n,1)=Pd; Pgen(n,1)=sum(P); delP(n,1)=dP;
end
figure(1);plot(IC); hold on; xlabel('Iteration'); ylabel('Incremental Cost');
    title('Plot of Incremantal Cost vs Iteration'); grid; grid minor;
figure(2);plot(Cost); grid on; grid minor; hold on; xlabel('Iteration'); ylabel('Total Cost');
    title('Plot of Total Cost vs Iteration');
figure(3);plot(PowerLoss); hold on; xlabel('Iteration'); ylabel('Power Loss');
    title('Plot of Power Loss vs Iteration'); grid; grid minor;
T=table(Iteration,IC,P1,P2,P3,Pdemand,Pgen,delP,Status,Cost)
end


