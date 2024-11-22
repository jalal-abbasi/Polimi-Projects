clc 
clear all
close all


% this program is able to find the proper kinematic of a Slider Crank
% mechanism once starting from 2 precision point (in terms of angle of the
% rotating linkage bars)




% A is the length of the follower
% B is the length of the middle bar
% C and h are rispectivly the x and y projection of the vectorial summation
% A + B

global A B C h theta_r 

%% data


% this data are nothing but the precision point evaluated as absolute
% rotation where:
% theta is the angle of A with respect to x-axis and
% gamma is the angle of B

                 %theta | gamma
Precision_point = [100    180;
                   55     175];
               
               
Precision_point = deg2rad(Precision_point);              

for ii = 1:length(Precision_point(:,1))               

    theta(ii) = Precision_point(ii,1);
    gamma(ii) = Precision_point(ii,2);
    
end
    
%     
% theta1=deg2rad(100);
% theta2=deg2rad(100-45);
% gamma1=deg2rad(150);
% gamma2=deg2rad(140);

%% Arbitrary choices

% in order to get less equation, all the equation are normalized                    
% considering h = 1

h = 1;  

%% solve

% the closure equation can be simply solved by matrix inversion (couse the
% system is linear


MM = [cos(theta(1)) cos(gamma(1)) 1 0;  % coefficient matrix
      sin(theta(1)) sin(gamma(1)) 0 0;  %
      cos(theta(2)) cos(gamma(2)) 0 1;  %
      sin(theta(2)) sin(gamma(2)) 0 0]; %
CC = [0 h 0 h]';                        % vector of constant

X = MM\CC;

%we fount A and B that are constant from now till end

A=X(1);                            
B=X(2); 

figure(1)
kinematic_plot(A, B, X(3), theta(1), gamma(1), 0)  % plot results of the previous calculation
kinematic_plot(A, B, X(4), theta(2), gamma(2), 0)  %



%% plot kinematic


% the kinematic is properly estended among any possible solution by varying
% the value of C (driver excursion) and solving the conseguent nonlinear
% system in theta and gamma

% a dynamic visualization is shown


angle0 = [theta(1) gamma(1)];  %theese are the starting point for fsolve, very important for choose the correct solution 
dt = 0.15; 
max_exc = sqrt( (A+B)^2 - h^2 );
scelta=1;

while scelta ~= 2
    
     scelta=menu('start the kinematic animated plot','start animation','continue');
 
switch scelta
    
    
    case 1
        
        
 option = optimset('Display','off');       
fig = figure(2);  
xx = 1;

for ii = X(3):-dt:X(4)

C = ii;
fun = @solve_K_C;

angle = fsolve(fun,angle0,option);
angle0 = ([angle(1) angle(2)]);
theta = angle(1);
gamma = angle(2);


Ax = real(A*exp(1i*theta));
Bx = real(B*exp(1i*gamma));
tip_disp(xx) = Ax + Bx;

kinematic_plot(A, B, C, theta, gamma, 1)
xx = xx + 1;
end

for ii = X(4):dt:X(3)

C = ii;
fun = @solve_K_C;

angle = fsolve(fun,angle0,option);
angle0 = ([angle(1) angle(2)]);
theta = angle(1);
gamma = angle(2);

kinematic_plot(A, B, C, theta, gamma, 1)

end
excursion = abs(tip_disp(end)-tip_disp(1));

    case 2
        
close all


    end
end






%% apply the motion law

% this part of the code evaluate a motion law


if true
	MotionLaw = {'MRT' 'MRT' 'MRT' 'MRT' 'CAC'}; 
	%MotionLaw = {'Dwell' 'CIC' 'Dwell' 'CIC' 'Dwell'}; 	
    LiftH_deg = [0 -45 0 45 0];  
    LiftH = deg2rad( LiftH_deg );
    Abscissa = [5 65 130 120 40]; % duration of each phase
    precision_p = [pi/4 pi/4 0 0 pi/4];
else % Simple motion law
    MotionLaw = {'MRT'}; % Select one among TVP , ACS ,	CUB , CIC
    precision_p = 0;
    LiftH = pi;
    Time = 1; 
    Abscissa=360;
end

N = 1000; % total number of discretization intervals
abscissa = linspace (0 ,sum( Abscissa ) ,N); % vector with N elements

% query the function 
data = motionlaw(MotionLaw , LiftH , Abscissa , N, precision_p);			
figure
subplot(3,1,1) ;plot(abscissa,data.pos);
ylabel('Disp.[ rad ]');grid ;
title ('MotionLaw');
subplot(3,1,2); plot(abscissa,data.vel); 
ylabel('Vel.[ rad/ab ]'); grid ;
subplot(3,1,3); plot(abscissa,data.acc);
ylabel('Acc.[ rad/ab\^2 ]');  grid ;	
xlabel('Abscissa');




%%



angle0 = [X(4) Precision_point(2,2)]; 
scelta=1;

while scelta ~= 2
    
     scelta=menu('start the kinematic animated plot w/ motion law','start animation','continue');
 
switch scelta
    
    
    case 1
        
 option = optimset('Display','off');               
fig = figure(3);  
ii = 0; 
xx = 1;
for ii = 1:6:length(abscissa)
    
theta_r =  (-data.pos(ii) + Precision_point(2,1) + data.pos(1));

fun = @solve_K_theta;
angle = fsolve(fun,angle0,option);
angle0 = ([angle(1) angle(2)]);

C = angle(1);

C_vect(xx,2) = C;
C_vect(xx,1) = abscissa(ii);

gamma = angle(2);
counter = num2str(abscissa(ii));
kinematic_plot(A, B, C, theta_r, gamma, 1)
title(['master angle =  ' counter]);


xx = xx + 1;

end

filename = 'C_vect.xlsx';
xlswrite(filename,C_vect);

    case 2
        
close all


    end
end













