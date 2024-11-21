function alpha=LinCompFunc(alphaacc, t, a, data)

gyrox=data(:,3);
dt=(t(end)-t(end-1));

% a=tau/(tau+dt);

alpha=0;
cont=0;


while cont<=10000
    prevalpha=alpha;
    alpha = a * ( prevalpha + gyrox * dt ) + ( 1 - a ) * alphaacc;
    cont=cont+1;
end
