

function K = solve_K_C(angle)  %this function is the linkage mechanism system closure equation

global A B C h

K(1) = A*cos(angle(1)) + B*cos(angle(2)) + C;
K(2) = A*sin(angle(1)) + B*sin(angle(2)) - h;

end