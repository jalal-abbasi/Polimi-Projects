function [zeri] = ricerca_zeri(x,fun)
L=length(x);
zeri=[];
for i=1:L-1
    if fun(x(i))*fun(x(i+1))<0
       m=(fun(x(i+1))-fun(x(i)))/(x(i+1)-x(i));
       k=x(i+1)-fun(x(i+1))/m;
        zeri=[zeri;k];
    end
        
end

