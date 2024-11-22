
function K = solve_K_Cdot(angle_dot)  %this function is the linkage mechanism system closure equation

global A B theta_r gamma_g theta_dot_g

K(1) = -A*sin(theta_r)*theta_dot_g - B*sin(gamma_g)*angle_dot(1) - angle_dot(2);   % angle_dot(1) = gamma dot  
K(2) = A*cos(theta_r)*theta_dot_g + B*cos(gamma_g)*angle_dot(1);                   % angle_dot(2) = C dot


end