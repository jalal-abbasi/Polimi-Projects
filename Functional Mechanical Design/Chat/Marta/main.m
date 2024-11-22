close all
clc
clear all


%% choose between true and false: 
%TRUE=COMPLEX MOTION LAW MADE UP OF ELEMENTARY PROFILES
%FALSE=SIMPLE MOTION LAW

if true
	MotionLaw = {'TEO' 'CIC' 'MRT' 'TEO'}; 
	%MotionLaw = {'Dwell' 'CIC' 'Dwell' 'CIC' 'Dwell'}; 	
    LiftH_deg = [-45 0 45 0];  
    LiftH = deg2rad( LiftH_deg );
    Abscissa = [70 130 50 110]; % duration of each phase
    precision_p = [pi/4 0 0 pi/4];
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