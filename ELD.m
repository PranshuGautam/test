ll=[20, 15, 10, 4, 2, 0.5]
for ii=1:length(ll)
    l=ll(ii);
a=[500 400 200];
b=[5.3 5.5 5.8];
y=[0.004 0.006 0.009];
e = 0.001; 
pd=800; 
dp=1;
flag =0;
    while(abs(dp)>e)
        flag = flag+1;        
        for i=1:length(a)
            p(i) =(l-b(i))/(2*y(i));
            cost(i)=  a(i)+(b(i)*p(i))+(y(i)*p(i)*p(i));
        end
        s=sum(p);
        dp = s-pd;
        x=0;
        for i = 1:length(a)
            x=x+(1/(2*y(i)));
        end
        l_itr(flag)=l;
        dl = dp/x;
        l = l-dl/2;
        Total(flag)=sum(cost);
    end
Total_final(ii,1:length(Total))=Total;
l_itr_fnal(ii,1:length(Total))=l_itr;
plot(Total)
hold on
end        
Total_final        
   l_itr_fnal         
                        
           
           
                  
                 
                 
                 
                 
            
                         
         
         
         