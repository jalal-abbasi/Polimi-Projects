
% NONLINEAR OPTIMAL CONTROL 

function [uopt,theta_opt,dtheta_opt]=optimalcontrol(T_fin,theta_in,dtheta_in)

%% Dynamic system, cost function and hamiltonian definition
J=6689.281*10^-6; %[kg*m^2]
% State equations
syms x1 x2 lmb1 lmb2 u; %x1=theta_dot ; x2=theta
Dx1 = 1/J*u;
Dx2 = x1;

% Final Target
Xf1 = 0;
Xf2 = 0;

% Final time
Tf = T_fin;

% Weight on the control 
R = 1;

% weights on the final target
P1 = 10;
P2 = 10;

% Cost function J = int(L)
L = 0.5*R*u^2;

% Hamiltonian
H = L + lmb1*Dx1 + lmb2*Dx2;

%% Necessary conditions for optimality

% 2nd EL equation (Adjoint vector dynamics):
Dlmb1 = -diff(H,x1);
Dlmb2 = -diff(H,x2);

% 3rd EL equation (solve for control u):
du = diff(H,u);
sol_u = solve(du, u);

% Substitute u into the state equation
Dx1 = subs(Dx1, u, sol_u);

%% Evaluation of the optimal trajectory and control

% convert symbolic objects to strings for using 'dsolve'
eq1 = strcat('Dx1=',char(Dx1));
eq2 = strcat('Dx2=',char(Dx2));
eq3 = strcat('Dlmb1=',char(Dlmb1));
eq4 = strcat('Dlmb2=',char(Dlmb2));

% Boundary conditions (1st EL equation)
conA1 = strcat('x1(0) = ', num2str(dtheta_in));
conA2 = strcat('x2(0) = ', num2str(theta_in)); %initial angle position
conA3 = ['lmb1(',num2str(Tf),') =',num2str(P1),'*x1(2) - ',num2str(P1),'*',num2str(Xf1)];
conA4 = ['lmb2(',num2str(Tf),') =',num2str(P2),'*x2(2) - ',num2str(P2),'*',num2str(Xf2)];

sol_a = dsolve(eq1,eq2,eq3,eq4,conA1,conA2,conA3,conA4);

%% evaluation of the optimal control
uopt = subs(sol_u,lmb1,sol_a.lmb1);

%% optimal trajectory (handle functions @(t))
theta_opt=sol_a.x1;
dtheta_opt=sol_a.x2;

FigTag = figure;
ax = axes;
h1 = fplot(theta_opt,[0 Tf],'LineWidth',1);hold on; grid on;
h1.Color = 'b';
h2 = fplot(dtheta_opt,[0 Tf],'LineWidth',1);
h2.LineStyle = '--';
h2.Color = 'b';
h3 = fplot(uopt,[0 Tf],'LineWidth',1);
h3.Color = 'r';
ax.FontSize = 16;
ax.TickLabelInterpreter = 'LaTex';
xlabel('$t$ [s]','Interpreter','LaTex');
ylabel('$x,u$','Interpreter','LaTex');
h = plot(Tf,Xf1,'o');
h.LineWidth = 1;
h.Color = 'b';
h = plot(Tf,Xf2,'o');
h.LineWidth = 1;
h.Color = 'b';
legend([h1,h2,h3],{'$\dot{\theta}$','$\theta$','$u$'},'Interpreter','LaTex','Location','Best')


dtheta_opt = matlabFunction(sol_a.x1); %create an handle function @(t)
theta_opt = matlabFunction(sol_a.x2);
uopt=matlabFunction(uopt);
disp(' ')
disp(['Final state theta_dot: ',num2str(dtheta_opt(Tf))]);
disp(['Final state theta: ',num2str(theta_opt(Tf))]);
disp(' ')
 end
