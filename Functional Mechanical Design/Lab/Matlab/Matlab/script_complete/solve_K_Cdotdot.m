
function K = solve_K_Cdotdot(angle_dotdot)  %this function is the linkage mechanism system closure equation

global A B theta_r gamma_g gamma_dot_g theta_dot_g theta_dotdot_g


K(1) = -A*cos(theta_r)*theta_dot_g^2 - A*sin(theta_r)*theta_dotdot_g -...
     B*cos(gamma_g)*gamma_dot_g^2 - B*sin(gamma_g)*angle_dotdot(1) - angle_dotdot(2);
 
K(2) = -A*sin(theta_r)*theta_dot_g^2 + A*cos(theta_r)*theta_dotdot_g -...
        B*sin(gamma_g)*gamma_dot_g^2 + B*cos(gamma_g)*angle_dotdot(1); 
    
    
 % angle_dotdot(1) = gamma dotdot
 % angle_dotdot(2) = C dotdot


 


end