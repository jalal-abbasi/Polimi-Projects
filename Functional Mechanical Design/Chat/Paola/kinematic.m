clc 
clear all

%% data
theta2=deg2rad(20);
theta3=deg2rad(10);

%% Arbitrary choices
gamma2=deg2rad(10);
gamma3=deg2rad(5);

%% solve
matrix=[ 1 1 -1; exp(j*theta2) exp(j*gamma2) -1; exp(j*theta3) exp(j*gamma3) -1];
vector=[exp(j*(pi/2)) exp(j*(pi/2)) exp(j*(pi/2))]';
%vector=[1 1 1]';
unknowns=matrix\vector;
a=unknowns(1);
b=unknowns(2);
c=unknowns(3);

%% plot positions
figure 
hold on
theta=[0 theta2 theta3];
gamma=[0 gamma2 gamma3];

colour=["b","r","g"];

for i=1:3
 ax=real(a*exp(j*theta(i)));
 ay=imag(a*exp(j*theta(i)));
 bx=real(b*exp(j*gamma(i)));
 by=imag(b*exp(j*gamma(i)));
 cx=c;
 cy=0;
plot([0,ax],[0,ay],char(colour(i)))
plot([ax,ax+bx],[ay,ay+by],char(colour(i)))
plot([ax+bx,ax+bx-cx],[ay+by,ay+by-cy],char(colour(i)))
end