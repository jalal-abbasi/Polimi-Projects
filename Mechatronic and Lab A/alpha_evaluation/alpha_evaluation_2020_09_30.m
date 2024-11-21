
%% Lab 1
clear
close all
clc

%% fake datas

Data1=importdata('ArduCopterLOG 30-Sep-2020 23-12-21.txt');
xacc1=Data1(:,6);
yacc1=Data1(:,7);
zacc1=Data1(:,8);


Data2=importdata('ArduCopterLOG 30-Sep-2020 23-35-31.txt');
xacc2=Data2(:,6);yacc2=Data2(:,7);
zacc2=Data2(:,8);

%hits y x z
Data3=importdata('ArduCopterLOG 30-Sep-2020 23-36-47.txt');
xacc3=Data3(:,6);
yacc3=Data3(:,7);
zacc3=Data3(:,8);

%% Data starting from horizontal equilibrium 

% starting from horizontal equilibrium and then one inclination 
Data4=importdata('ArduCopterLOG 30-Sep-2020 23-36-47.txt');
xacc4=Data4(:,6);
yacc4=Data4(:,7);
zacc4=Data4(:,8);

% starting from horizontal equilibrium and then slow motion 
Data5=importdata('ArduCopterLOG 01-Oct-2020 00-27-05.txt');
xacc5=Data5(:,6);
yacc5=Data5(:,7);
zacc5=Data5(:,8);


% starting from horizontal equilibrium and then fast motion 
Data6=importdata('ArduCopterLOG 01-Oct-2020 00-27-53.txt');
xacc6=Data6(:,6);
yacc6=Data6(:,7);
zacc6=Data6(:,8);

%% plot of the x,y,z accelerations
t=Data4(:,1)*1e-3; % [s]
figure(1)
plot(t,xacc4,t,yacc4,t,zacc4)
legend('x acc','y acc','z acc')
xlim([20 t(end,1)])

%% Alpha
alpha=acos(zacc4/9.81)*180/pi; %[deg]

%plot of alpha
figure(2)
plot(t,alpha)
xlim([20 t(end,1)])




