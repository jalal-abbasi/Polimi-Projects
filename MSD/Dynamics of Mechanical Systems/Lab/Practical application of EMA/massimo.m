function [m,x_val,k] = massimo(y,x)
% given the y vector and the x vector find the max of y in x and
% the value of x for which I have the maximum
m=0;
n=length(x);
for i=1:n
    if y(i)>m
        m=y(i);
        k=i;
    end
    x_val=x(k);
end

