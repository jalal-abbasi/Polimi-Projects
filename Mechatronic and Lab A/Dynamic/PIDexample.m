close all 
clear all

j=6689.281*10^-6;
kd=0.4;
kp=0.4;
L=284.84*10^-3;

sys=tf(1,[j kd kp]);


SYS1=ss([-kd/j -kp/j; 1 0], zeros(2,2),eye(2),zeros(2,2));
SYS2=ss([-kd/j -kp/j; 1 0], zeros(2,2),[-kd -kp;0 0],zeros(2,2));

[Y,T,X]=initial(SYS2,[0,0.3]);

F1=Y(:,1)/(2*L);
F2=-Y(:,1)/(2*L);

PWM4=(F1+15.5)/0.01;
PWM3=(F2+15.5)/0.01;
plot(T,PWM4,T,PWM3)
% plot(T,F1)
