clear all
close all
clc
L=1200;            % mm
b=40;              % mm
h=8;               % mm
A=b*h;             % mm^2
rho=2700;          % kg/m^3
df=0.02;  
E=68000;           % N/mm^2
J=b*h^3/12;        % mm^4
m=rho/10^9*b*h;    % kg/mm
syms H gamma
H=symfun([     0              -1           0             -1      ;
              -1               0           1              0      ;
          -sin(gamma*L) -cos(gamma*L) sinh(gamma*L) cosh(gamma*L);
          -cos(gamma*L) +sin(gamma*L) cosh(gamma*L) sinh(gamma*L)],gamma);
PolCar=det(H)
polcarg=@(gamma)cosh(L.*gamma).^2 - cos(L.*gamma).^2 - sin(L.*gamma).^2 - sinh(L.*gamma).^2 + 2.*sin(L.*gamma).*sinh(L.*gamma);
%polcarg=@(gamma) 2.*sin(L.*gamma).*sinh(L.*gamma);
polcarw=@(w) -polcarg((m/(E*J))^(1/4).*sqrt(w));
w=0:df:500;
%policarw=subs(PolCar,gamma,(m/(E*J))^(1/4).*sqrt(w));
plot(w,polcarw(w));
figure
plot(w,log(polcarw(w)));
zeri=ricerca_zeri(w,polcarw);
zerig=sqrt(E*J/m).*zeri.^2;
H1=[     0                   -1             0               -1      ;
        -1                    0             1                0      ;
    -sin(zerig(1)*L) -cos(zerig(1)*L) sinh(zerig(1)*L) cosh(zerig(1)*L);
    -cos(zerig(1)*L) +sin(zerig(1)*L) cosh(zerig(1)*L) sinh(zerig(1)*L)];
b=zeros(size(H1,1),1);
cost=b\H1;

