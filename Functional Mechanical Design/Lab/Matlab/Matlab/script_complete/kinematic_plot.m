function kinematic_plot(A, B, C, theta, gamma, reset)

colour=["-b*","-r*","--g",'--g'];

theta = pi - theta;
gamma = pi - gamma;


Ax = real(A*exp(1i*theta));
Ay = imag(A*exp(1i*theta));

Bx = real(B*exp(1i*gamma));
By = imag(B*exp(1i*gamma));

Cx = real(C*exp(1i*0));
Cy = 0;

Hx = 0;
Hy = 1;

max_exc = sqrt( (A+B)^2 - 1 );


if reset == 1
    cla
    %clf('reset')
end

hold on

xlim([-max_exc max_exc]);

 plot([0,Ax],[0,Ay],char(colour(1)),'LineWidth',2);
 plot([Ax,Ax+Bx],[Ay,Ay+By],char(colour(2)),'LineWidth',2);
 plot([0,Cx],[0,Cy],char(colour(3)));
 plot([Cx,Cx+Hx],[Cy,Cy+Hy],char(colour(4)));
axis equal
drawnow

pause(0.005)
end