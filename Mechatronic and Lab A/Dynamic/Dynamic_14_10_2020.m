%% Gradual step input
clear
close all
clc


% 6 gradual step input starting from the lower minimum input to the maximum
% on ch3 and ch4

CH3=importdata('CH3_STEP.txt');

CH4=importdata('CH4_STEP.txt');

%% Plots 

% CHOOSE channel(s) to plot:

ch_to_plot = [12];

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

datasss = CH3; % INSERT the proper channel (3 or 4)
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

%% Alpha evaluation with complementary filter (a=0.94)
alphaacc=rad2deg(atan2(data(:,6),data(:,8)));

%% Filter
a=0.95; 
alpha=LinCompFunc(alphaacc, t, a, data);
figure(2)
% plot(t,alpha,t,alphaacc);
plot(t,alpha);
xlim([t(1);t(end)])
title('Angle alpha')
xlabel('Time [s]')
ylabel('Alpha [deg]')

%% Force evaluation

k=0.126; % [N/mm] Look to 'k_spring.m' script % Try k=0.1235 (removing P1) or k=0.1538 (All values)
lx=226.5; % [mm] 
ly=105.1; 
F_thrust=2*lx*k*sin(alpha*pi/180);

figure(3)
plot(t,alpha,'b',t,F_thrust,'r');
legend('Alpha','Thrust Force')
xlim([t(1);t(end)])

%% Find the plateau 

N=size(data(:,12),1);
index=0; % Says where the plateau limits are
a=01;
for i=1:N-1
    if abs(data(i,12)-data(i+1,12))>=0.1
        index(a)=i;
        a=a+1;
    end
end
index=[1,index];
N=size(index,2);
% Average value of the plateau:
for i=1:N-1
    F_av=0;
    pwm_plateau(i)=data(index(i)+1,12);
    for j=index(i):index(i+1)
        F_av=F_thrust(j)+F_av;
    end
    F_plateau(i)=F_av/(index(i+1)-index(i)); % [N]
end

figure(4)
POLY=polyfit(pwm_plateau,F_plateau,2);
xdis=linspace(pwm_plateau(1),pwm_plateau(end));
PODIS=polyval(POLY,xdis);
plot(xdis,PODIS)
title('Thrust force-PWM law')
xlabel('PWM [micros]')
ylabel('Thrust Force [N]')


