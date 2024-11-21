%% Lab 1
clear
close all
clc

% Data starting from horizontal equilibrium 

% starting from horizontal equilibrium and then one inclination 
Data4=importdata('ArduCopterLOG 30-Sep-2020 23-36-47.txt');

% starting from horizontal equilibrium and then slow motion 
Data5=importdata('ArduCopterLOG 01-Oct-2020 00-27-05.txt');

% starting from horizontal equilibrium and then fast motion 
Data6=importdata('ArduCopterLOG 01-Oct-2020 00-27-53.txt');

%% Plots 

% CHOOSE channel(s) to plot:

ch_to_plot = [3:5];

% ch 1: time elapsed [ms]
% ch 2: realtime [bool]
% ch 3: IMU-GYRO p [deg/s]
% ch 4: IMU-GYRO q [deg/s]
% ch 5: IMU-GYRO r [deg/s]
% ch 6: IMU-ACC x [g]
% ch 7: IMU-ACC y [g]
% ch 8: IMU-ACC z [g]
% ch 9: IMU-TMP T [°C]
% ch 10: PWM ch 1 [us]
% ch 11: PWM ch 2 [us]
% ch 12: PWM ch 3 [us]
% ch 13: PWM ch 4 [us]
% ch 14: safe mode [bool]

datasss = Data5; % INSERT the proper Data number (1 to 6)
fprintf('Cut of the first %d seconds of the signal \n',datasss(27,1)*1e-3)
data=datasss(28:end,:); % Cut for the first part of the signal


t=data(:,1)*1e-3; % [s]
figure(1)
for i=1:size (ch_to_plot,2)
    plot(t,data(:,ch_to_plot(i)))
    hold on
end
xlim([t(1);t(end)])

legen=["Time ellapsed","Real time","Angular velocity x axis [deg/s]","Angular velocity y axis [deg/s]","Angular velocity z axis [deg/s]",...
    "Acceleration x axis [g]","Acceleration y axis [g]","Acceleration z axis [g]","Temperature [°C]",...
    "PWM ch 1 [us]","PWM ch 2 [us]","PWM ch 3 [us]", "PWM ch 4 [us]","Safe mode"];
legend(legen(ch_to_plot))

%% Alpha ACCELERATION
figure(2)
alphaacc=rad2deg(atan2(data(:,6),data(:,8)));
plot(t,alphaacc)
legend ('alphaacc')
title('Angle from acceleration')
xlim([t(1);t(end)])

%% Filter
a=1; 
alpha=LinCompFuncV2(alphaacc, t, a, data);
figure(3)
% plot(t,alpha,t,alphaacc);
plot(t,alpha);
xlim([t(1);t(end)])
legend('Complementary filter')

%% a choiche

alpha=LinCompFuncV2(alphaacc, t, 0.7, data);
figure(4)
% plot(t,alpha,t,alphaacc);
plot(t,alpha);
xlim([t(1);t(end)])
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.8, data);
plot(t,alpha);
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.9, data);
plot(t,alpha);
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.95, data);
plot(t,alpha);
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.99, data);
plot(t,alpha);
legend ('a=0.7','a=0.8','a=0.9','a=0.95','a=0.99')


alpha=LinCompFuncV2(alphaacc, t, 0.93, data);
figure(5)
% plot(t,alpha,t,alphaacc);
plot(t,alpha);
xlim([t(1);t(end)])
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.94, data);
plot(t,alpha);
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.95, data);
plot(t,alpha);
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.96, data);
plot(t,alpha);
hold on
alpha=LinCompFuncV2(alphaacc, t, 0.97, data);
plot(t,alpha);
legend ('a=0.93','a=0.94','a=0.95','a=0.96','a=0.97')

