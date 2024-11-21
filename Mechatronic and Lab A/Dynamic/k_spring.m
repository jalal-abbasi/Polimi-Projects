close all
clear all
clc

P1=9.81*0.2; %N
P3=9.81*0.49;
P2=9.81*0.389;
P5=9.81*(0.49+0.17);
P4=9.81*(0.14+0.49);
P6=P1+P3;

delta_l1=3.31;%mm
delta_l3=18.7; 
delta_l6=32.6;
delta_l2=6.4;
delta_l5=23.8;
delta_l4=22.9;

k1=P1/delta_l1;
k3=P3/delta_l3;
k6=P6/delta_l6;
k2=P2/delta_l2;
k5=P5/delta_l5;
k4=P4/delta_l4;

P=[P1,P2,P3,P4,P5,P6];
delta_l=[delta_l1,delta_l2,delta_l3,delta_l4,delta_l5,delta_l6];
figure (1)
plot(delta_l,P,'r')

hold on

POLY=polyfit(delta_l,P,1);
xdis=linspace(delta_l1,delta_l6);
PODIS=polyval(POLY,xdis);
plot(xdis,PODIS)
title('Stifness')
xlabel('Elongation [mm]')
ylabel('Weight [N]')

K=POLY(1); % Actual medium stifness

% k=0.1538 (All values)
% k=0.1235 (Removing P1) 
% k=0.1291 (Only with P2 P3 P4)
% k=0.0806 (Only P2 and P3)



