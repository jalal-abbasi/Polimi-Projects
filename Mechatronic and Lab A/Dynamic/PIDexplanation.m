%the program will take in the theta and the t vector in real time
v=(theta-thetap)/t %theta dot (angular velocity) is calculated numerically
C=-kd*v-kp*theta; %the input torque calculated by a PD controller (both reference position and velocity ae zero)

a=0.5; %relative weight of the two motors ( if 0.5 they provide the same deltaF in module)
F1=a*C/L; %L is th lenght of one arm of the drone
F2=(a-1)*C/L;

PWM4=(F1+15.5)/0.01; %the values 15.5 and 0.01 are taken from the two graphs that descrbe the relation between the thrust forces and the PWMs (listen to the audio for more informatons)
PWM3=(F2+15.5)/0.01;


