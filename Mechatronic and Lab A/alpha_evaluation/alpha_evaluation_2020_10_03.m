%% Lab 1
clear
close all
clc

% Data import, alpha evaluation
%% Datas (wrong because the starting was not levelled!)

Data1=importdata('ArduCopterLOG 30-Sep-2020 23-12-21.txt');


Data2=importdata('ArduCopterLOG 30-Sep-2020 23-35-31.txt');

%hits y x z
Data3=importdata('ArduCopterLOG 30-Sep-2020 23-36-47.txt');

%% Data starting from horizontal equilibrium 

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
% ch 9: IMU-TMP T [�C]
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
    "Acceleration x axis [g]","Acceleration y axis [g]","Acceleration z axis [g]","Temperature [�C]",...
    "PWM ch 1 [us]","PWM ch 2 [us]","PWM ch 3 [us]", "PWM ch 4 [us]","Safe mode"];
legend(legen(ch_to_plot))

%% Alpha ?

alphax=real(asin(data(:,6)/9.81)*180/pi); %[deg]
alphay=real(asin(data(:,7)/9.81)*180/pi); %[deg]
alphaz=real(acos(data(:,8)/9.81)*180/pi); %[deg]

% plot of alpha detected by x and alpha detected by y
figure(2)
plot(t,alphax,t,alphay,t,alphaz)
legend('Alpha detected by x','Alpha detected by y','Alpha detected by z')

alpha2=sqrt(alphax.^2+alphay.^2);
sign=find(alphax<0);     % Pay MUCH MUCH aattentiom!!!!! For 2D this has to be done for both axis
alpha2(sign)=-alpha2(sign);
xlim([t(1);t(end)])
figure (3)
plot(t,alpha2,t,alphax)
legend ('x and y acc component','x only')
title('Angle alpha')
xlim([t(1);t(end)])

% � piu giusto alphax o alpha2?

%oppure
figure(4)
alphaacc=atan2(data(:,6),data(:,8))*180/pi;
plot(t,alphaacc,t,alphax)
legend ('alphaacc')
title('Angle from acceleration')
xlim([t(1);t(end)])




%% Linear Complementary Filter

% Formula: angle = a * ( angle + gyro * dt) + ( a - 1 ) * angle_atg_accelerometer 

a=0.9; % Va fatta variare ma non funziona
alpha=LinCompFunc(alphaacc, t, a, data);
figure(5)
plot(t,alpha,t,alphaacc); 
xlim([t(1);t(end)])
legend('Comp filter','From acc')