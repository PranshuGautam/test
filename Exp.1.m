lambda = input('Enter the value of lambda');
n =3;
demand =800;
a=[500 400 200];
b=[5.3 5.5 5.8];
y=[0.004 0.006 0.009];
e = 0.001; cost;
p=800; p1=1; px;
flag =0;
     if((lambda>0))
     {
         while (px>e)
         flag =flag+1;
                 for i = 1:3
                 p1 =p1+((lambda-p)/(2*lambda));
           px = p1-p;
           lambdax = px/(1/2*lambda);
           lambda =lambda-lambdax;
           cost =  a[i]+(b[i]*p1)+(y[i]*p1*p1);
                 end
         cost_flag[flag]= cost;
         lambda1_flag[flag]= lambda;
         end
         plot(cost_flag,lambda1_flag)
         }
     else
             display('Enter a valid value of lambda');
                         
        
        
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
                  
                 
                 
                 
                 
            
                         
         
         
         