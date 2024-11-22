
close all
clear all
load DH1.mat
frf_module=abs(frf);
%plot(freq,frf_module(:,1));
%figure
%plot(freq,frf_module(:,2),'r');
%figure
%plot(freq,frf_module(:,3));
m1=0;
incl=zeros(1,11);
for i=1:10
    for d=1:25001
        if freq(d)==50*i
          incl(1,i+1)=d;
        end
    end
end
incl(1,1)=0;
max=0;
d=1;
maximums_arrays=zeros(3,10);
maximums_freq=zeros(3,10);
 
for k=1:3
    for i=1:10
        for j=incl(1,i)+1:incl(1,i+1)
            if frf_module(j,k)>max
                max=frf_module(j,k);
                maximums_arrays(k,i)=j;
                maximums_freq(k,i)=freq(maximums_arrays(k,i));
            end
        end
         max=0;
    end
end
natural_frequencies=zeros(3,5);
natural_frequencies(:,1)=maximums_freq(:,1);
for i=2:5
    natural_frequencies(:,i)=maximums_freq(:,2*(i-1));
end
n_f_array=zeros(3,5);

n_f_array(:,1)=maximums_arrays(:,1);
for i=2:5
    n_f_array(:,i)=maximums_arrays(:,2*(i-1));
end
%%for i=1:5
   % for j=1:3
     %   for d=1:25001
         %   if freq(d)==natural_frequencies(j,i)
            %    n_f_array2(j,i)=d;
           % end
      %  end
  %  end
%end

for i=1:5
  for  j=1:3
       resonance_values(j,i)=frf_module(n_f_array(j,i),j);
  end
end

%calculating the dampings
frf_phase=angle(frf);
subplot(3,1,1)
plot(freq,frf_module(:,1));
subplot(3,1,2)
plot(freq,frf_phase(:,1));
subplot(3,1,3)
plot(freq,cohe(:,3));
figure
%the half power points
half_points_acc1=zeros(5,2);
%for the first accelometer
%the first half power point
for i=1:5
  
       for d=1:25001
           
                   if i==1
                           if frf_module(d,1)>=(square(2)/2)*resonance_values(1,i) 
                               d1=d;
                             half_points_acc1(i,1)=freq(d1,1);
                             hp_values_acc1(i,1)=frf_module(d,1);
                             break;
                           end    
                   else

                        if frf_module(d,1)>=(square(2)/2)*resonance_values(1,i) && freq(d,1)>natural_frequencies(1,i)-40 
                            d1=d;
                            half_points_acc1(i,1)=freq(d1,1);
                            hp_values_acc1(i,1)=frf_module(d,1);
                            break
                        else
                            continue
                        end


                   end
                   
                   
       end
    
end

%the second half power point
for i=1:5
    for d=1:25001
        if d>n_f_array(1,i)
            if frf_module(d,1)<=square(2)/2*resonance_values(1,i)
                      d2=d-1;
                      half_points_acc1(i,2)=freq(d2);
                      hp_values_acc1(i,2)=frf_module(d,1);
                      break
            end
        end
    end
end

%damping for accelerometer 1
damp1_acc1=zeros(5,1);
for i=1:5
    damp1_acc1(i,1)=((half_points_acc1(i,2))^2-(half_points_acc1(i,1)^2))/(4*(natural_frequencies(1,i)^2));
                    
end

%now the phase tangent method
incline=zeros(5,1); %the incline of the frequency-phase trend
damp2_acc1=zeros(5,1);

for i=1:5
    incline(i,1)=(frf_phase(n_f_array(1,i),1)-frf_phase(n_f_array(1,i)-1,1))/(freq(n_f_array(1,i),1)-freq(n_f_array(1,i)-1,1));
   damp2_acc1(i,1)= -1/(natural_frequencies(1,i).*incline(i,1));
end

half_points_acc2=zeros(5,2);

%for the second accelometer
%the first half power point
for i=1:5
  
       for d=1:25001
           
                   if i==1
                           if frf_module(d,2)>=square(2)/2*resonance_values(2,i) 
                               d1=d;
                             half_points_acc2(i,1)=freq(d1,1);
                             break;
                           end    
                   else

                        if frf_module(d,2)>=square(2)/2*resonance_values(2,i) && freq(d,1)>natural_frequencies(2,i)-40 
                            d1=d;
                            half_points_acc2(i,1)=freq(d1);
                            break
                        else
                            continue
                        end


                   end
                   
                   
       end
    
end

%the second half power point
for i=1:5
    for d=1:25001
        if d>n_f_array(2,i)
            if frf_module(d,2)<=square(2)/2*resonance_values(2,i)
                      d2=d-1;
                      half_points_acc2(i,2)=freq(d2,1);
                      break
            end
        end
    end
end

%damping for accelerometer 2
damp1_acc2=zeros(5,1);
for i=1:5
    damp1_acc2(i,1)=((half_points_acc2(i,2))^2-(half_points_acc2(i,1)^2))/(4*(natural_frequencies(2,i)^2));
                    
end

%now the phase tangent method
incline2=zeros(5,1); %the incline of the frequency-phase trend
damp2_acc2=zeros(5,1);

for i=1:5
    incline2(i,1)=(frf_phase(n_f_array(2,i),2)-frf_phase(n_f_array(2,i)-1,2))/(freq(n_f_array(2,i),1)-freq(n_f_array(2,i)-1,1));
   damp2_acc2(i,1)= -1/(natural_frequencies(2,i).*incline2(i,1));
end

%for the third accelometer
%the first half power point
half_points_acc3=zeros(5,2);
d1=25001;
for i=1:5
  
       for d=1:25001
           
                   if i==1
                           if frf_module(d,3)>=square(2)/2*resonance_values(3,i) 
                               d1=d;
                             half_points_acc3(i,1)=freq(d1,1);
                             break;
                           end    
                   else

                        if frf_module(d,3)>=square(2)/2*resonance_values(3,i) && freq(d,1)>natural_frequencies(3,i)-40 
                            d1=d;
                            half_points_acc3(i,1)=freq(d1,1);
                            break
                        else
                            continue
                        end


                   end
                   
                   
       end
    
end

%the second half power point
for i=1:5
    for d=1:25001
        if d>n_f_array(3,i)
            if frf_module(d,3)<=square(2)/2*resonance_values(3,i)
                      d2=d-1;
                      half_points_acc3(i,2)=freq(d2,1);
                      break
            end
        end
    end
end

%damping for accelerometer 3
damp1_acc3=zeros(5,1);
for i=1:5
    damp1_acc3(i,1)=((half_points_acc3(i,2))^2-(half_points_acc3(i,1)^2))/(4*(natural_frequencies(3,i)^2));
                    
end

%now the phase tangent method
incline3=zeros(5,1); %the incline of the frequency-phase trend
damp2_acc3=zeros(5,1);

for i=1:5
    incline3(i,1)=(frf_phase(n_f_array(3,i),3)-frf_phase(n_f_array(3,i)-1,3))/(freq(n_f_array(3,i),1)-freq(n_f_array(3,i)-1,1));
   damp2_acc3(i,1)= -1/(natural_frequencies(3,i).*incline3(i,1));
end
plot(freq,frf_module(:,1));
hold on
for i=1:2
plot(half_points_acc1(:,i),hp_values_acc1(:,i),'r.','markersize',10);
hold on
end

