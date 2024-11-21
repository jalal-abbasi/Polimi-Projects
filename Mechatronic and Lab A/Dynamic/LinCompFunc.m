function alpha=LinCompFunc(alphaacc, t, a, data)

gyrox=data(:,4);
dt=t;
for i= 1:(size(t,1)-1)
    dt(i)=t(i+1,1)-t(i,1);
end

alpha=zeros(size(dt,1),1);

for i=2:size(dt,1)
     alpha(i) = a * ( alpha(i-1) + rad2deg(gyrox(i)* dt(i)) ) + ( 1 - a ) * alphaacc(i);
end

end