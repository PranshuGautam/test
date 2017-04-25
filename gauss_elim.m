function gauss_elim
n = input('Enter the number of variables : ');
for i =  1:n
    for j = 1:n
        p(i,j) = input('Enter the element of the matrix p ');
    end
end
    for i =  1:n
        for j = 1
            q(i,j) = input('Enter the element of the matrix q ');
        end
    end
    r=p;
    
for i = 1:n
    for j = n+1
        r(i,j) = q(i,1);
    end
end



    
