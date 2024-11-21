clear all
close all

%System parameters
J=6689.281*10^-6;
L=284.84*10^-3;

%Control parameters
kp=50;
kd=50;
b=0.5; %Ripartition of the torque between the two motors ( value must be between 0 and 1)
%Change position and velocity directly in simulink

%Complemenentary filter
a=0.92;

%Initial condition and mean component of the motors
initial=[0,20]; % [initial velocity, initial position] (deg)
PWMs_fixed=[1619,1638]; %PWM values that determine the mean component of the two motors [PWM3,PWM4]

% sim('SystemModel')


