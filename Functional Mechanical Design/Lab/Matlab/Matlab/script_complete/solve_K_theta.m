
function K = solve_K_theta(angle)  %this function is the linkage mechanism system closure equation

global A B C h theta_r

K(1) = A*cos(theta_r) + B*cos(angle(2)) + angle(1);
K(2) = A*sin(theta_r) + B*sin(angle(2)) - h;

end