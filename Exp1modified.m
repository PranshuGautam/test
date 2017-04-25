clear
clc

a=[500 400 200];                                         %a,b,g are constants of cost function
b=[5.3 5.5 5.8];
g=[0.004 0.006 0.009];                                   %Pd=Power Demand,E=Tolerance
Pd=800; E=10^(-2)  ; L=[5.5 6.5 7.5 9.5 10.5 11.5];      %L(lamda)=Incremental Costs
                                                         %n=no of iterations
for j=1:length(L)
    dP=5; n=0; 
while (abs(dP)>E)
n=n+1; C=0;
for i=1:length(a)
    P(i)=(L(j)-b(i))/(2*g(i));
    C=C+a(i)+b(i)*P(i)+g(i)*P(i)^2;
end
P1(n,1)=P(1);P2(n,1)=P(2);P3(n,1)=P(3);
Cost(n,1)=C;
IC(n,1)=L(j);
Iteration(n,1)=n;
dP=sum(P)-Pd;
dL=dP/sum(1./(2.*g));
L(j)=L(j)-dL/2;
Pdemand(n,1)=Pd; Pgen(n,1)=sum(P); delP(n,1)=dP;

end
figure(1);plot(IC); hold on; xlabel('Iteration'); ylabel('Incremental Cost');
    title('Plot of Incremantal Cost vs Iteration'); grid; grid minor;
figure(2);plot(Cost); grid on; grid minor; hold on; xlabel('Iteration'); ylabel('Total Cost');
    title('Plot of Total Cost vs Iteration');
T=table(Iteration,IC,P1,P2,P3,Pdemand,Pgen,delP,Cost)
end

