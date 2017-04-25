x(1) = input('Enter the value of x(0) : ');
y(1) = input('Enter the value of y(0) : ');
for i = 1:3
    h(i) = input('Enter three values of deviation : ');
end
for i = 1:3
for n = 1:10
    x(n+1) = x(n)+h(i);
    f = x(n)+2*y(n);
    y(n+1) = y(n)+h(i)*f;
end
hold on
plot(x,y,'b-');
end



