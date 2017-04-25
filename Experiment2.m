clear
clc

a=[500 400 200];                  % a,b,g are constants of cost function
b=[5.3 5.5 5.8];
g=[0.004 0.006 0.009];            %Pd=Power Demand,E=Tolerance
Pd=800; E=10^(-3);                %n=no of iterations
L=[8.3 9 9.7 10.9 11.5 12];       %L(lamda)=Incremental Cost                        
Pmax=[350 200 350];               %Pmax,Pmin=Maximum and minimum generating limits respectively
Pmin=[150 100 100];               %status=1: plant output is within generation limit in that iteration
status=[1 1 1];                   %status=0: plant output has crossed generation limit in that iteration 

for j=1:length(L)
    dP=5; n=0;
while (abs(dP)>E)
n=n+1; C=0;
for i=1:length(a)
    P(i)=(L(j)-b(i))/(2*g(i));
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
P1(n,1)=P(1);P2(n,1)=P(2);P3(n,1)=P(3);
Cost(n,1)=C;
IC(n,1)=L(j);
Iteration(n,1)=n;
Status(n,:)=status;
dP=sum(P)-Pd;
if sum(status)>=1
    dL=dP/sum(status./(2.*g));
else dL=dP/sum(1./(2.*g));
end
L(j)=L(j)-dL/2;
Pdemand(n,1)=Pd; Pgen(n,1)=sum(P); delP(n,1)=dP;
end
figure(1); hold on; plot(IC);  xlabel('Iteration'); ylabel('Incremental Cost');
    title('Plot of Incremantal Cost vs Iteration'); grid; grid minor;
figure(2);plot(Cost); grid; grid minor; hold on; xlabel('Iteration'); ylabel('Total Cost');
    title('Plot of Total Cost vs Iteration');
T=table(Iteration,IC,P1,P2,P3,Pdemand,Pgen,delP,Cost)
end
