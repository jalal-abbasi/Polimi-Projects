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

global A B C h theta_r gamma_g theta_dot_g gamma_dot_g theta_dotdot_g

% data


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

% Arbitrary choices

% in order to get less equation, all the equation are normalized                    
% considering h = 1

h = 100;  

% solve

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


theta_vect(xx) = theta;


Ax = real(A*exp(1i*theta));
Bx = real(B*exp(1i*gamma));
tip_disp(xx) = Ax + Bx;


transmission_angle_1 (xx) = gamma - theta;

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
figure
subplot(2,1,1); plot(theta_vect*180/pi,transmission_angle_1*180/pi)
grid on
title('transmission angle');

subplot(2,1,2); plot(theta_vect*180/pi,sin(transmission_angle_1))
title('transmitted normalize force');
xlabel('theta')

grid on

    case 2
        
close all


    end
end






%% apply the motion law

% this part of the code evaluate a motion law


if true
	MotionLaw = {'MRT' 'MRT' 'MRT' 'MRT' 'MRT'}; 
	%MotionLaw = {'Dwell' 'CIC' 'Dwell' 'CIC' 'Dwell'}; 	
    LiftH_deg = [0 -45 0 45 0];  
    LiftH = deg2rad( LiftH_deg );
    Abscissa = [5 65 130 120 40]; % duration of each phase
    Abscissa = Abscissa*pi/180;
%     Abscissa = Abscissa/360;
    precision_p = [pi/4 pi/4 0 0 pi/4];
else % Simple motion law
    MotionLaw = {'MRT'}; % Select one among TVP , ACS ,	CUB , CIC
    precision_p = 0;
    LiftH = pi;
    Time = 1; 
    Abscissa=2*pi;
%     Abscissa=1;
end




figure
plot([0 5 70 200 360],[pi/4 pi/4 0 0 pi/4],'ro--')
grid on
xlabel('tilting pad request rotation');
ylabel('master angle [°]');
ylim([-0.2 0.9]);xlim([-10 380])
xline(0,'g--');xline(360,'g--')
N = 250; % total number of discretization intervals
abscissa = linspace (0 ,sum( Abscissa ) ,N); % vector with N elements

% query the function 
data = motionlaw(MotionLaw , LiftH , Abscissa , N, precision_p);			
figure
subplot(3,1,1) ;plot(abscissa*180/pi,data.pos);
ylabel('Disp.[ ° ]');grid ;
xline(360,'r--');
title ('MotionLaw');
subplot(3,1,2); plot(abscissa*180/pi,data.vel); 
ylabel('Vel.[ °/ab ]'); grid ;
xline(360,'r--');
subplot(3,1,3); plot(abscissa*180/pi,data.acc);
ylabel('Acc.[ °/ab\^2 ]');  grid ;	
xline(360,'r--');
xlabel('Abscissa [rad]');

data.pos(end) = data.pos(end-1);
data.vel(end) = data.vel(end-1);
data.acc(end) = data.acc(end-1);




% ______________________ kinematik with motion law ______________________



angle0 = [X(4) Precision_point(2,2)]; 
angle_dot0 = [0 0];
angle_dotdot0 = [0 0];

scelta=1;

while scelta ~= 2
    
     scelta=menu('start the kinematic animated plot w/ motion law','start animation','continue');
 
switch scelta
    
    
    case 1
        

 option = optimset('Display','off');             
        
               
fig = figure(3);  
ii = 0; 
xx = 1;
for ii = 1:length(abscissa)
 
    
    
theta_r =  (-data.pos(ii) + Precision_point(2,1) + data.pos(1));
theta_dot_g = data.vel(ii);
theta_dotdot_g = data.acc(ii);

% __________________ position ___________________________


fun = @solve_K_theta;
angle = fsolve(fun,angle0,option);
angle0 = ([angle(1) angle(2)]);

C = angle(1);

C_vect(xx,2) = C;
C_vect(xx,1) = abscissa(ii);

gamma = angle(2);
gamma_g = gamma;



counter = num2str(abscissa(ii));
kinematic_plot(A, B, C, theta_r, gamma, 1)
title(['master angle =  ' counter]);


xx = xx + 1;




end




    case 2

        
 option = optimset('Display','off');         
 f = waitbar(0,'kinematic evaluation','Name','kinematic',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');                 
        
 
xx = 1;

close all       
        
        
for ii = 1:length(abscissa)

theta_r =  (-data.pos(ii) + Precision_point(2,1) + data.pos(1));
theta_dot_g = data.vel(ii);
theta_dotdot_g = data.acc(ii);   
    
    
% __________________ position ____________________________


fun = @solve_K_theta;
angle = fsolve(fun,angle0,option);
angle0 = ([angle(1) angle(2)]);

C = angle(1);

C_vect(xx,2) = C;
C_vect(xx,1) = abscissa(ii);

gamma = angle(2);
gamma_g = gamma;

transmission_angle_link (ii) = gamma - theta_r;
    
    
% __________________ velocity ___________________________



fun_vel = @solve_K_Cdot;
angle_dot = fsolve(fun_vel, angle_dot0, option);

gamma_dot(ii) = angle_dot(1);
gamma_dot_g = gamma_dot(ii);
C_dot(ii) = angle_dot(2);


% __________________ acceleration ___________________________


fun_acc = @solve_K_Cdotdot;
angle_dotdot = fsolve(fun_acc, angle_dotdot0, option);

gamma_dotdot(ii) = angle_dotdot(1);
C_dotdot(ii) = angle_dotdot(2);
        
        
xx = xx + 1;


waitbar(xx/length(abscissa),f)


end        
        
        



    end
end
delete(f)

C_vect(:,2)= C_vect(:,2) - min(C_vect(:,2));



figure
plot(abscissa*180/pi,transmission_angle_link);
xlabel('master angle [°]');
yline(pi/2,'r--'); 
xline(360,'r--');
legend('pressure angle on the links','pi / 2');

%% Cam Design


clc;

% dati

% Rb0=min(C_vect(:,2)); %BASE RADIUS
Rb0 = 100;
Rr=25; %ROLLER RADIUS

alpha = abscissa;
answer1 = menu('Which cam?', ...
    'Positive clockwise','Negative clockwise','Positive counterclockwise',...
'Negative counterclockwise');

% Handle response
switch answer1
    case 1 
 
    case 2
 C_vect=-C_vect;
 C_dot=-C_dot;
 C_dotdot=-C_dotdot;
    case 3
alpha=-alpha;
C_dot=-C_dot;
    case 4
 C_vect=-C_vect;
 C_dot=+C_dot;
 C_dotdot=-C_dotdot;
 alpha=-alpha;
        
end

% Polar coordinates of the pitch curve

OC = [C_vect(:,2)]' + Rb0 ;

% pressure angle

theta =  atan ( C_dot ./ ( OC ));

% Curvature radius of the pitch profile

rho0 = ( C_dot.^2 + (OC).^2).^(1.5) ./ ( (OC).^2 - (OC).*C_dotdot + 2*C_dot.^2 ) ;

% Curvature radius of the cam profile

rho = rho0 - Rr ;

% Polar coordinates of the cam profile

r = sqrt( Rr^2 + (OC).^2 - 2*Rr*(OC).*cos(theta) );
phi = alpha + asin( Rr*sin(theta)./r ) ;

[xcam,ycam]=pol2cart(phi,r);

[xpitch,ypitch]=pol2cart(alpha,OC);

prodottotraidue=rho.*rho0;

% plot del pitch e cam
abscissa = abscissa*180/pi;


figure
plot(xpitch,ypitch,'Displayname','Pitch')
hold on
plot(xcam,ycam,'Displayname','cam')
axis equal
grid on
legend
xlabel('X[mm]')
ylabel('Y[mm]')
title('Profili')

% pressure angle plot
figure
plot(abscissa,theta*180/pi)
xlabel('master angle [°]')
title('Pressure angle on the cam')
xline(360,'r--');
grid on

% undercut check
sottotaglio=0;
for i=1:length(prodottotraidue)
    if prodottotraidue(i)<0
        sottotaglio=1;
    end
end



figure
plot(abscissa,prodottotraidue)
if sottotaglio==0
    title('\rho e \rho_0 have the same sign: NO UNDERCUT')
else
    title('\rho e \rho_0 have different sign: UNDERCUT')
end
legend('\rho\rho_0')
xlabel('\alpha [°]')
ylabel('\rho\rho_0[mm]')
xline(360,'r--');
grid on


figure
polarplot(phi,r); 
hold on
polarplot(alpha,OC) 
legend('cam profile','pitch profile')
grid on


% figure
% plot(abscissa,OC); title('OC')
% figure
% plot(abscissa,phi-alpha); title('alpha - theta')

% figure
% plot(abscissa,OC- Rb0); legend('C')
% grid on
% figure
% plot(abscissa,C_dot); legend('C_dot')
% grid on
% figure
% plot(abscissa,C_dotdot); legend('C_dotdot')
% grid on

 %%

% close all
% ciaone = data.pos;
% ciaone_dot = diff(data.pos)/(2*pi/length(C_vect(:,1)));
% ciaone_dotdot = diff(ciaone_dot)/(2*pi/length(C_vect(1:end,1)));
% 
% figure
% plot(abscissa,C_vect(:,2),'g');
% hold on
% plot(abscissa,ciaone,'r');
% title('pos')
% figure
% plot(abscissa,C_dot,'g')
% hold on
% plot(abscissa(1:end-1),ciaone_dot,'r');
% title('vel')
% figure
% plot(abscissa,C_dotdot,'g')
% hold on
% plot(abscissa(1:end-2),ciaone_dotdot,'r');
% title('acc')



%% motor/reductor dimensioning
clc

torque_nom = 7000;  % [Nmm]
torque_max = 37000; % max abs [Nmm]

motor_torque_nom = 0.36e3;   % [Nmm]
motor_torque_max = 1.44e3; % [Nmm]

% tau_min = motor_torque_nom / torque_nom; % adimensional trasmission ratio
tau_min = 1/105;

if motor_torque_nom / tau_min > torque_max
    
    display('the gear ratio');
     display([num2str(tau_min) '   1:' num2str(1/tau_min)]);
      display('is sufficient');
    display('the max torque of motor is ')
     display(num2str(motor_torque_max / tau_min));
     display('the nomilan torque of motor is ')
     display(num2str(motor_torque_nom / tau_min));
else
    
    display('the gear ratio ');
     display([num2str(tau_min) '   1:' num2str(1/tau_min)]);
      display('is NOT sufficient');
    display('the max torque of motor is ')
     display([num2str(motor_torque_max / tau_min) ' while it should be grater then ' num2str(torque_max)]);
     
     display('the nomilan torque of motor is ')
     display(num2str(motor_torque_nom / tau_min));
end







