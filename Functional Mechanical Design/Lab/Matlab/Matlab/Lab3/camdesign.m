%% MOTION LAWS
close all 
clear 
clc

if true % If	’true ’ ?> complex motion law made up of elementary	profiles .	
	% Otherwise simple motion law ( see	lines 13?15)
	MotionLaw = {'Dwell' 'CIC' 'Dwell' 'CIC' 'Dwell'}; % A cell	array	is	built	
    LiftH_deg = [0 20 0 -20 0];
    LiftH = deg2rad( LiftH_deg );
    Abscissa = [60 45 75 90 90]; % duration of each phase
    
    flag=1;
else % Simple motion law
    MotionLaw = {'ModTVP'}; % Select one among ’TVP’ ,	’ACS’ ,	’CUB’ , ’CIC’
    Abscissa=[360];
    LiftH = pi;
    Time = 1;
    
    flag=0;
end



N = 1000; % total number of discretization intervals 
abscissa = linspace (0 ,sum( Abscissa ) ,N); % vector with N elements

% query the function 
data = LeggeDiMotoV2(MotionLaw , LiftH , Abscissa , N, flag);			
figure
subplot (3 ,1 ,1) 
plot( abscissa , data.pos ); 
ylabel('Disp. [ rad ]');
title ('MotionLaw');
grid ;
subplot (3 ,1 ,2) 
plot( abscissa , data.vel ); 
ylabel('Vel.  [ rad/ab ]'); 
grid ;
subplot (3 ,1 ,3) 
plot( abscissa , data.acc ); 
ylabel('Acc.  [ rad/abˆ2 ]'); 
xlabel('Abscissa'); 
grid ;			


%% CAM DESIGN

% dati
d=30; %FRAME LENGTH
b=30; %FOLLOWER LENGTH
Rb=0.3; %BASE RADIUS
Rr=0.025; %ROLLER RADIUS



alpha=abscissa*pi/180;
beta0=acos((b^2+d^2-(Rb+Rr)^2)/(2*b*d));
answer1 = menu('Which cam?', ...
    'Positive clockwise','Negative clockwise','Positive counterclockwise',...
'Negative counterclockwise');

% Handle response
switch answer1
    case 1 
 
    case 2
 data.pos=-data.pos;
 data.vel=-data.vel;
 data.acc=-data.acc;
    case 3
alpha=-alpha;
data.vel=-data.vel;
    case 4
 data.pos=-data.pos;
 data.vel=+data.vel;
 data.acc=-data.acc;
 alpha=-alpha;
        
end


beta=beta0+data.pos;

%% Polar coordinates of the pitch curve
rc=sqrt((b.*sin(beta)).^2+(d-b.*cos(beta)).^2);
phic=alpha+atan2(b.*sin(beta),(d-b.*cos(beta)));

 [xpitch,ypitch]=pol2cart(phic,rc);

%% angle gamma
gamma=atan2((b.*sin(beta).*(1-data.vel)),(d-b.*cos(beta).*(1-data.vel)));

%% pressure angle
theta=pi/2-beta-gamma;

%% Polar coordinates of the cam profile
r=sqrt((b.*sin(beta)-Rr.*sin(gamma)).^2+(d-b.*cos(beta)-Rr.*cos(gamma)).^2);
phi=alpha+atan2(b.*sin(beta)-Rr.*sin(gamma),(d-b.*cos(beta)-Rr*cos(gamma)));
[xcam,ycam]=pol2cart(phi,r);
%% Curvature radius of the cam profile

gammaprimo=(b.*(1-data.vel).*data.vel.*cos(beta+gamma)-b.*data.acc.*sin(beta+gamma))./(d.*cos(gamma)-b.*(1-data.vel).*cos(beta+gamma));
pho0=(-b*cos(beta0+data.pos).*(1-data.vel)+d)./((1+gammaprimo).*cos(gamma));
pho=pho0-Rr;
prodottotraidue=pho.*pho0;

%% plot del pitch e cam

figure
plot(xpitch,ypitch,'Displayname','Pitch')
hold on
plot(xcam,ycam,'Displayname','cam')
grid on
legend
xlabel('X[mm]')
ylabel('Y[mm]')
title('Profili')
%% pressure angle plot
figure
plot(abscissa,theta)
title('Pressure angle')

%% undercut check
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
xlabel('\alpha [deg]')
ylabel('\rho\rho_0[mm]')

