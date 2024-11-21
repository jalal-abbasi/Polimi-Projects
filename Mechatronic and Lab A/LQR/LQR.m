
% NEIGHBORING OPTIMAL CONTROL VIA LINEAR QUADRATIC FEEDBACK


clear 
close all
clc

%System parameters
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
Ts=0.02;

%Complemenentary filter
a=0.92;

%Initial condition and mean component of the motors
initial=[0,10]; % [initial velocity, initial position] (deg)
PWMs_fixed=[1619,1638]; %PWM values that determine the mean component of the two motors [PWM3,PWM4]

%% state space model (x_dot=A*x+B*u where x=[theta_dot;theta])

A=[0 0;1 0];
B=[1/J;0];

% weight on the control action
R = 1;

% weight on the state
Q = [1 0;0 1];

% weight on the final target
P = [100 0;0 100];

Ns = 2; % number of states
Nc = 1; % number of controls

% initial and final time
N=5000;
T=linspace(0,2,N);
t0 = T(1);
tf = T(end);

%% Nominal Optimal Trajectory Upload
dtheta_in=initial(1)*pi/180;
theta_in=initial(2)*pi/180;
[uopt,theta_opt,dtheta_opt]=optimalcontrol(tf,theta_in,dtheta_in);
uopt=uopt(T)';
dtheta_opt=dtheta_opt(T)';
theta_opt=theta_opt(T)';
X_opt=[dtheta_opt,theta_opt];
%% LQR - Elaboration

% Option for ODE solver
VectTol = ones(Ns^2,1)*1e-5;
options = odeset('RelTol', 1e-5, 'AbsTol',VectTol);

% boundary conditions
p0 = P(1:end)';

% Integration of the matrix riccati equation
[Tp,PP] = ode23(@(t,p) DREE(t,p,Q,R,A,B) , flip(T), p0, options);

% From backward to forward dynamics (they are stored in the reversed order)
PP = flipud(PP);

% Transformation Vector -> Matrix
PP_Matrix = zeros(Ns,Ns);

% Computation of the gain matrix in time, Uncontrolled stability matrix,
% Controlled stability matrix along the trajectory
K = zeros(N,Nc,Ns);
A = zeros(N,Ns,Ns);
Ac = zeros(N,Ns,Ns);
PolesUC = zeros(N,Ns);
PolesC = zeros(N,Ns);
for ii = 1:N 
    % transformation vector -> matrix
    PP_Matrix(1:end) = PP(ii,:)';
    % Uncontrolled system poles
    PolesUC(ii,:) = eig(squeeze(A(ii,:,:)));
    % Gain matrix C
    K(ii,:,:) = R^-1*B'*PP_Matrix; % R has to be non-null
%     % Controlled state stability matrix
%     Ac(ii,:,:) = squeeze(A(ii,:,:)) - B*squeeze(K(ii,:,:));
%     % Controlled system poles
%     PolesC(ii,:) = eig(squeeze(Ac(ii,:,:)));    
end

%% Simulink Model
T=T';
K1 = squeeze(K(:,1,:));
Omega_ref=dtheta_opt;
Theta_ref=theta_opt;
Xref=[Omega_ref,Theta_ref];

