function [out] = motionlaw (MotionLaw , h , Ab, N, precision_p)


% Input parameters
%
% MotionLaw = Identifier :
% 'ACS' : constant acceleration symmetric law
% 'TVP' : trapezoidal velocity profile
% 'CUB' : cubic law
% 'CIC' : cycloidal law
% 'Dwell ' : dwell
%
% 'h' = Lift
% 'Ta' = Time of advancement
% 'N' = Total number of discretization point s
%
% REMARK: The first three input s must be of the same size
%

if length(MotionLaw) ~=length(h) || length(h) ~= length(Ab)
error ('MotionLaw , h and Ta arrays must have the same size' );
end


%calcolo di TEO
global a v s vect
      epsilon_v = 0.5;
      ratio = 1/8;
      
      ca_pi = 2/epsilon_v;
      ca_mi = -2/(1-epsilon_v);
      
      ca_p= ca_pi*epsilon_v/(epsilon_v-ratio);
      ca_m= ca_mi*epsilon_v/(epsilon_v-ratio);
     
      x = [0 ratio epsilon_v-ratio epsilon_v epsilon_v+ratio 1-ratio 1];
      y = [0 ca_p ca_p 0 ca_m ca_m 0];
      vect = [0:0.01:1];
      
      A = @(t) interp1 (x,y,t);
      a = A(vect);
      
      V = @(k) integral (A,0,k);
                
      for ii=1:length(vect)
         v(ii)=V(vect(ii));
      end 
      
      vel = @(t) interp1 (vect,v,t);
      S = @(t) integral (vel, 0 , t);
      
      for ii=1:length(vect)
          s(ii)=S(vect(ii));
      end
                         
%calcolo di MRT
global a1 v1 s1 
      epsilon_v = 1/3;
      ratio = 1/8;
      ev = epsilon_v;
      
      ca = 1/ev/(1-ev);
           
      ca_p= ca*epsilon_v/(epsilon_v-ratio);
      ca_m= -ca*epsilon_v/(epsilon_v-ratio);
     
      x = [0 ratio epsilon_v-ratio epsilon_v 1-epsilon_v 1-epsilon_v+ratio 1-ratio 1];
      y = [0 ca_p ca_p 0 0 ca_m ca_m 0];
      vect = [0:0.01:1];
      
      A = @(t) interp1 (x,y,t);
      a1 = A(vect);
      
      V = @(k) integral (A,0,k);
                
      for ii=1:length(vect)
         v1(ii)=V(vect(ii));
      end 
      
      vel = @(t) interp1 (vect,v1,t);
      S = @(t) integral (vel, 0 , t);
      
      for ii=1:length(vect)
          s1(ii)=S(vect(ii));
      end



% Discretization
t = linspace (0,sum(Ab),N);


% Memory allocation 
out . pos = zeros (1 ,N);
out . vel = zeros (1 ,N); 
out . acc = zeros (1 ,N);


% Set of instructions at each discretization point 
for k = 1:N
	% we need to know on which stage we are by returning the index of the 
	% abscissa	vector
	CurInt = find(cumsum(Ab)>=t(k),1,'first');
    PP = precision_p(CurInt);
    % we need to calculate epsilon
    epsilon = (t(k) - sum(Ab(1:(CurInt-1)))) / Ab(CurInt);
    % switch case statement to select the needed law 
    switch char (MotionLaw(CurInt))
    case {'ACS'}
        AdimLaw = ACS(epsilon, PP);
    case {'TVP'}
        AdimLaw = TVP(epsilon, PP); 
    case {'CUB'}
        AdimLaw = Cubic(epsilon, PP);
    case {'CIC'}
        AdimLaw = Cycloidal(epsilon, PP); 
    case {'Dwell'}
        AdimLaw = Dwell(epsilon, PP); 
    case {'ModTVP'}  
        AdimLaw = ModTVP(epsilon, PP);
    case {'CAC'}  
        AdimLaw = CAC(epsilon ,PP);    
    case {'TEO'}  
        AdimLaw = TEO(epsilon ,PP);  
    case {'MRT'}  
        AdimLaw = MRT(epsilon ,PP); 
    otherwise
            error('s  motion law not recognized',char(MotionLaw(CurInt)));
    end
    
% Output in terms of position , velocity and acceleration
 out.pos(k) = AdimLaw.s*h(CurInt) + precision_p(CurInt);
 out.vel (k) =AdimLaw.v*h(CurInt)/Ab(CurInt);
 out.acc(k) =AdimLaw.a*h(CurInt)/Ab(CurInt)^2;


end
end










function [out] = TVP(epsilon, PP)

 ev = 1/5;
 cv = 1/(1-ev);
 ca = 1/ev/(1-ev);
 

if 0 <= epsilon && epsilon <=ev	
    out.a =  ca;
    out.v =  ca*epsilon;
    out.s =  1/2*ca*epsilon^2;  
elseif ev < epsilon && epsilon <=(1-ev)
     out.a = 0;
     out.v = ca*ev;
     out.s = ca*ev*epsilon-1/2*ca*ev^2;
else
     out.a = -ca;
     out. v = ca*(1-epsilon);
     out. s = ca*(epsilon-epsilon^2/2+ev-ev^2-1/2);
end
end


function [out] = Cycloidal(epsilon, PP)
        
       
       out.a = 2*pi*sin(2*pi*epsilon);
       out.v = 1 - cos(2*pi*epsilon);
       out.s = epsilon - 1/2/pi*sin(2*pi*epsilon);


end




function [out] = Cubic(epsilon, PP)
        
       
       out.a = 6*(1 - 2*epsilon);
       out.v = 6*epsilon*(1 - epsilon);
       out.s = epsilon*(3*epsilon - 2*epsilon^2);


end


function [out] = CAC(epsilon, PP)
        
       epsilon_v = 1/3;
       
       if 0 <= epsilon && epsilon <=epsilon_v
       out.a = 2 / epsilon_v;
       out.v = 2*epsilon / epsilon_v
       out.s = 0.5*(2/epsilon_v)*epsilon^2;    
           
       else  
       out.a = -2/(1 - epsilon_v);
       out.v = (2/(1 - epsilon_v))*(epsilon - 1);
       out.s = (2/(1 - epsilon_v))*(epsilon - epsilon^2/2 - epsilon_v/2);
       
       end

end

function [out] = TEO(epsilon,PP)
global a v s vect
       
       out.a = interp1(vect,a,epsilon);
       out.v = interp1(vect,v,epsilon);
       out.s = interp1(vect,s,epsilon);

end


function [out] = MRT(epsilon,PP)
global a1 v1 s1 vect
       
       out.a = interp1(vect,a1,epsilon);
       out.v = interp1(vect,v1,epsilon);
       out.s = interp1(vect,s1,epsilon);

end
