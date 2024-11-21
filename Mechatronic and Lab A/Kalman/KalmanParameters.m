
clear 
close all
clc%System parameters
J=6689.281*10^-6;
L=284.84*10^-3;

%Control parameters
% kp=1.8583;
kp=0.4;
Td=0.5780;
Ti=1.1;
n=1/100;
b=0.5; %Ripartition of the torque between the two motors ( value must be between 0 and 1)
%Change position and velocity directly in simulink



%Initial condition and mean component of the motors
initial=[10,10]; % [initial velocity, initial position] (deg)
PWMs_fixed=[1619,1638]; %PWM values that determine the mean component of the two motors [PWM3,PWM4]

%% state space model (x_dot=A*x+B*u where x=[theta_dot;theta])

A=[0 0;1 0];
B=[1/J;0];

% % weight on the control action
% R = 1;
% 
% % weight on the state
% Q = [1 0;0 1];
% 
% % weight on the final target
% P = [100 0;0 100];
% 
% % Normalization variables
% dQpMax = 300;          %[rad/s]
% dQMax = 0.5236;              %[rad]
% dCMax = 1.1394;              %[Nm]
% 
% R=R/(dCMax^2);
% 
% Q(1,1)=Q(1,1)/(dQMax^2);
% Q(2,2)=Q(2,2)/(dQpMax^2);
% 
% P(1,1)=P(1,1)/(dQMax^2);
% P(2,2)=P(2,2)/(dQpMax^2);
% 
% 
% Ns = 2; % number of states
% Nc = 1; % number of controls
% 
% % initial and final time
% N=50000;
% T=linspace(0,2,N);
% t0 = T(1);
% tf = T(end);


%% Kalman filter

C=zeros(2,2);
C(1,1)=1;
C(2,2)=1;

D=zeros(2,3);

% Poles of the uncontrolled system
PolesUC = eig(A);

% how much the system model is reliable?
Qk = zeros(2,2);
Qk(1,1) = 1;
Qk(2,2) = 1;

% how much the measurements are reliable?
% Rk = [0.00001,0;0,0.00001];
% Rk = [0.01,0;0,0.01];
 Rk = [1,0;0,1];
 Rk=1;


InitialK=[0,0.1];
[~,~,Ko] = care(A',C',Qk,Rk);
Ko = Ko';
%%


figure(1)

plot(out.thetas.time,rad2deg(out.thetas.data))
xlabel('t [s]','Interpreter','LaTex','fontsize',18)
ylabel('$\theta$ [deg]','Interpreter','LaTex','fontsize',18)
legend ('Measured','Observed','Interpreter','LaTex','fontsize',18)
title('$Rk_2$','Interpreter','LaTex','fontsize',25)

figure(2)

plot(out.thetas.time,rad2deg(out.dthetas.data))
xlabel('t [s]','Interpreter','LaTex','fontsize',18)
ylabel('$\dot{\theta}$ [deg/s]','Interpreter','LaTex','fontsize',18)
legend ('Measured','Observed','Interpreter','LaTex','fontsize',18)
title('$Rk_2$','Interpreter','LaTex','fontsize',25)


