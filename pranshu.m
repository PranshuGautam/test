a = [1:3;4:6;7:9]
b = [11:13;14:16;17:19]
a(2,3)
a(3,:)
sort(a,'descend')
sort(b,'descend')
c = a+b
s = a-b
m = a*b
m2 = a.*b
w = size(a)
x = length(a)
z1 = det(a)
z2 = det(b)
z3 = inv(a)
z4 = inv(b)
for i = 1:3
    for j = 1:3
        q(i,j) = input('Enter the element of the matrix');
    end
end
q

    
