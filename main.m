    for i =  1:3
    for j = 1:3
        p(i,j) = input('Enter the element of the matrix p ');
    end
    end
    for i =  1:3
    for j = 1:3
        q(i,j) = input('Enter the element of the matrix q ');
    end
    end
    for i =  1:3
    for j = 1:3
        r(i,j) = input('Enter the element of the matrix r');
    end
    end
[p1,q1,r1] = sortmat(p,q,r);
[pi1,qi1,ri1] = deter(p1,q1,r1);
p1
q1
r1
pi1
qi1
ri1

