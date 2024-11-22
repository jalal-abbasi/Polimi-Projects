clear
close all
clc

%% Structure properties
E = 2.06e11;
rho = 7800;
%blue
A1 = 3.912e-3;
J1 = 3.892e-5;

%red
A2 = 0.01155;
J2 = 4.82e-4;

EA1 = E*A1;
EA2 = E*A2;

EJ1= E*J1;
EJ2= E*J2;

m1= rho*A1;
m2= rho*A2;

% Maximum length of finite element
fmax = 20;
coef = 1.5;
om = coef*(fmax*2*pi);
Lmax_fe1 = sqrt(pi^2/om*sqrt(EJ1/m1))
Lmax_fe2 = sqrt(pi^2/om*sqrt(EJ2/m2))

%% Load Structure Data

[file_name,xy,nnod,sizew,idf,ndof,incidence,l,gamma,m,EA,EJ,position,nbeam] = MeccFEM2_loadstructure;


%% Plot undeformed structure

figure
MeccFEM2_plotStructure(position,l,gamma,xy)
xlabel('x [m]'); ylabel('y [m]')


% Check IDB and ndof

MeccFEM2_DoFsTable(idf)


%% Assembly of Mass and Stiffness Matrices

ndof_total = 3*nnod;
[M,K] = MeccFEM2_assem(incidence,l,m,EA,EJ,gamma,ndof_total);

%% Partitioning of "FF" Mass and Stiffness Matrices
MFF = M(1:ndof,1:ndof);
KFF = K(1:ndof,1:ndof);

MFC=M(1:ndof,ndof+1:end);
KFC=K(1:ndof,ndof+1:end);
%% Analysis of Natural Frequencies and Mode Shapes

[modes, Om2] = eig(MFF\KFF);
om2 = diag(Om2);
frq = sqrt(om2)/2/pi;

% Sort in ascending order frequencies and mode shapes
[frqord,ordmode] = sort(frq);
modes = modes(:,ordmode);

% Plot of mode shapes
scaleFactor = 2;
for ii = 1:5
    mode = modes(:,ii);
    figure
    MeccFEM2_plotDeformedStructure(mode,scaleFactor,incidence,l,gamma,position,idf,xy);
    xlabel('x [m]'); ylabel('y [m]')
    title(['Mode ', num2str(ii) ': Freq [Hz]=' num2str(frqord(ii))])
end  
 

%% Damping Matrix

alfah = 0.8 ;
betah = 3e-5 ;

R = alfah*M + betah*K;
RFF = R(1:ndof,1:ndof);


RFC=R(1:ndof,ndof+1:end);

%% Frequency Response Function

% Force applied in A
freq = [0:0.01:20] ;
Om = 2*pi*freq;

f0 = zeros(ndof,1);
f0(idf(6,2)) = 1;

for ii=1:length(freq)    
    A = -Om(ii)^2*MFF+sqrt(-1)*Om(ii)*RFF+KFF;
    xx(:,ii)=A\f0;
end
FRF_F_YC = xx(idf(20,2),:);
figure
subplot(211)
plot(freq,abs(FRF_F_YC))
grid on
title('FRF: Vertical Displacement in C vs Vertical Force in A')
ylabel(['|Y_C/F_A|'])
subplot(212)
plot(freq,angle(FRF_F_YC))
ylabel(['[rad]'])
xlabel('Freq [Hz]')
grid on

% Force applied in B
freq = [0:0.01:20] ;
Om = 2*pi*freq;

f0 = zeros(ndof,1);
f0(idf(4,1)) = 1;

for ii=1:length(freq)    
    A = -Om(ii)^2*MFF+sqrt(-1)*Om(ii)*RFF+KFF;
    xx(:,ii)=A\f0;
end
FRF_F_XC = xx(idf(20,1),:);
figure
subplot(211)
plot(freq,abs(FRF_F_XC))
grid on
title('FRF: Horizontal Displacement in C vs Horizontal Force in B')
ylabel(['|Y_C/F_B|'])
subplot(212)
plot(freq,angle(FRF_F_XC))
ylabel(['[rad]'])
xlabel('Freq [Hz]')
grid on

%% Response to Earthquake
freq = [0:0.01:20] ;
Om = 2*pi*freq;

xc = zeros(3*nnod-ndof,1);
xc(idf(1,1)-ndof) = 1;
xc(idf(15,1)-ndof) = 1;
for k=1:length(freq)
    D = -Om(k)^2*MFF+sqrt(-1)*Om(k)*RFF+KFF;
    F = -(-Om(k)^2*MFC+sqrt(-1)*Om(k)*RFC+KFC);
    xfc(:,k)=(D\F)*xc; % displacement
end

FRF_E_XC = xfc(idf(20,1),:);
figure
subplot(211)
plot(freq,abs(FRF_E_XC))
grid on
title('Horizontal Displacement in C due to earthquake')
ylabel(['|X_C|'])
subplot(212)
plot(freq,angle(FRF_E_XC))
ylabel(['[rad]'])
xlabel('Freq [Hz]')
grid on

%% Modal Approach

for jj= 1:2
    phi(:,jj) = modes (:,jj);
end
M_mod = phi'*MFF*phi;
K_mod = phi'*KFF*phi;
C_mod = phi'*RFF*phi;

Ff=zeros(ndof,1);
Ff(idf(6,2))= 1;

F_mod = phi'*Ff;
for kk=1:length(freq)    
    B = -Om(kk)^2*M_mod+sqrt(-1)*Om(kk)*C_mod+K_mod;
   q(:,kk)=B\F_mod;
end
X_mod = phi*q;

FRF_mod_YC = X_mod(idf(20,2),:);
figure
subplot(211)
plot(freq,abs(FRF_F_YC),'b',freq,abs(FRF_mod_YC),'r')
grid on
title('Vertical Displacement in node C (Unitary & Modal)')
ylabel(['|Y_C/F_A|'])
subplot(212)
plot(freq,angle(FRF_F_YC),'b',freq,angle(FRF_mod_YC),'r')
ylabel(['[rad]'])
xlabel('Freq [Hz]')
grid on

for jj= 1:2
    phi(:,jj) = modes (:,jj);
end
M_mod = phi'*MFF*phi;
K_mod = phi'*KFF*phi;
C_mod = phi'*RFF*phi;

Ff=zeros(ndof,1);
Ff(idf(4,2))= 1;

F_mod = phi'*Ff;
for kk=1:length(freq)    
    B = -Om(kk)^2*M_mod+sqrt(-1)*Om(kk)*C_mod+K_mod;
   q(:,kk)=B\F_mod;
end
X_mod = phi*q;

FRF_mod_XC = X_mod(idf(20,1),:);
figure
subplot(211)
plot(freq,abs(FRF_F_XC),'b',freq,abs(FRF_mod_XC),'r')
grid on
title('Horizontal Displacement in C (Unitary & Modal)')
ylabel(['X_C/F_B'])
subplot(212)
plot(freq,angle(FRF_F_XC),'b',freq,angle(FRF_mod_XC),'r')
ylabel(['[rad]'])
xlabel('Freq [Hz]')
grid on
