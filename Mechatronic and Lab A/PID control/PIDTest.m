clear all
s=tf('s');

J=6689.281*10^-6;
% kp=0.1612;
kp=0.0038;
Td=2.1761/kp;
n=0;

l=284.84*10^-3;

R=(kp*(1+s*Td))/(1+n*s);
G=R/(J*s^2);
L=(G/(1+G));
OS=(1/(J*s^2))/(1+G);

[GmG,PmG,WcgG,WcpG]=margin(G);
[GmL,PmL,WcgL,WcpL]=margin(L);

figure(1)
margin(G)



figure(2)

margin(L)

F10=polyval(polyfit([1447,1792],[1,5],1),1619);
F20=polyval(polyfit([1455,1832],[1,5],1),1638);

figure(3)
step(L)
hold on
[y,t,x,ysd] = step(L)

bode(OS)
%%
figure(3)
plot(t,step(:,1))
%%


A=[-(kp*Td)/J, -kp/J; 1, 0];
B=[(kp*Td)/J, (kp)/J, l/J, -l/J; 0, 0, 0, 0];
C=[-(kp*Td)/(2*l),-(kp)/(2*l)];
D=[(kp*Td)/(2*l),(kp)/(2*l),0,0];

SYS=ss(A,B,C,D);

x0=[0,deg2rad(20)];
[Y,T,Xt]=initial(SYS,x0,60);
Xs=(l/kp)*(F10-F20);

F1=-(kp*(2*l))*(Xt(:,2)+Xs)+F10;

figure()
hold on
plot(T,rad2deg(Xt(:,2)+Xs))
plot(T,rad2deg(Xs),'--b')
plot(T,rad2deg(Xt(:,2)),'--g')

figure()
plot(T,F1)