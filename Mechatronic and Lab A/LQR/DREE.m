function [OutVect] = DREE(t,p,Q,R,A,B)

Nstates = length(A);
% transformation vector -> matrix
P = zeros(Nstates,Nstates);
P(1:end) = p(1:end);

% DRE
Out = -(A.'*P + P*A - P*B*R^-1*B.'*P + Q);

% transformation matrix -> vector
OutVect = Out(1:end)';