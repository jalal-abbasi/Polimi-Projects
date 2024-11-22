%Best MRT
clc
clear all
close all
global a1 v1 s1 

ii=1;
X = [1/6:0.01:1/2];

for epsilon_v = X
   
      vect = [0:0.01:1];

      %epsilon_v = 1/3;
      ratio = 1/16;
      
      
      ca = 1/epsilon_v/(1-epsilon_v);
           
      ca_p(ii)= ca*epsilon_v/(epsilon_v-ratio);
      ca_m(ii)= -ca*epsilon_v/(epsilon_v-ratio);
     
      x = [0 ratio epsilon_v-ratio epsilon_v 1-epsilon_v 1-epsilon_v+ratio 1-ratio 1];
      y = [0 ca_p(ii) ca_p(ii) 0 0 ca_m(ii) ca_m(ii) 0];
            
      A = @(t) interp1 (x,y,t);
      a1 = A(vect);
      
      V = @(k) integral (A,0,k);
                
      for jj=1:length(vect)
         v1(jj)=V(vect(jj));
      end 
      
      vel = @(t) interp1 (vect,v1,t);
      S = @(t) integral (vel, 0 , t);
      
      for kk=1:length(vect)
          s1(kk)=S(vect(kk));
      end
      
      cv(ii) = max(v1);
      cw(ii)=max(abs(v1.*a1));
   ii=ii+1;
   
end

plot(X,cw, X, ca_p, X, cv)
legend ('cw','ca','cv')
