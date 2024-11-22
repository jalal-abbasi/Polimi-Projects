
load DH1.mat;
frf_module=abs(frf);
frf_phase=angle(frf);
subplot(3,1,1)
plot(freq,frf_module(:,1));
subplot(3,1,2)
plot(freq,frf_phase(:,1));
subplot(3,1,3)
plot(freq,abs(cohe(:,1)));
figure
subplot(3,1,1)
plot(freq,frf_module(:,2));
subplot(3,1,2)
plot(freq,frf_phase(:,2));
subplot(3,1,3)
plot(freq,abs(cohe(:,2)));
figure
subplot(3,1,1)
plot(freq,frf_module(:,3));
subplot(3,1,2)
plot(freq,frf_phase(:,3));
subplot(3,1,3)
plot(freq,abs(cohe(:,3)));
figure

i=1;
m=[1,8];
while i
    if freq(i)==50
        m(1)=i;
    end
    if freq(i)==100
        m(2)=i;
    end
    if freq(i)==135
        m(3)=i;
    end
    if freq(i)==145
        m(4)=i; 
    end %we are removing this domain because it's peak is not due to the natural frequency of the sytem
    if freq(i)==200
        m(5)=i;
    end
    if freq(i)==300
        m(6)=i;
    end 
    if freq(i)==400
        m(7)=i;
        break
    end
    i=i+1;
end
m(8)=25001;
max_first_domain=[0,0,0];
max_indice_first_domain=[0,0,0];
natural_freq1=zeros(1,3);%natural frequencies for the 1st measurement
natural_freq2=zeros(1,3);
natural_freq3=zeros(1,3);
%first domain
for d=1:m(1)
    if frf_module(d,1)>max_first_domain(1)
        max_first_domain(1)=frf_module(d,1);
        max_indice_first_domain(1)=d;
        natural_freq1(1)=freq(d);% first natural freq of the 1st measurement
    end
    if frf_module(d,2)>max_first_domain(2)
        max_first_domain(2)=frf_module(d,2);
        max_indice_first_domain(2)=d;
        natural_freq2(1)=freq(d);
    end
    if frf_module(d,3)>max_first_domain(3)
        max_first_domain(3)=frf_module(d,3);
        max_indice_first_domain(3)=d;
        natural_freq3(1)=freq(d);
    end
end
max_second_domain=[0,0,0];
max_indice_second_domain=[0,0,0];

%second domain
for d=m(1)+1:m(2)
    if frf_module(d,1)>max_second_domain(1)
        max_second_domain(1)=frf_module(d,1);
        max_indice_second_domain(1)=d;
        natural_freq1(2)=freq(d);
    end
    if frf_module(d,2)>max_second_domain(2)
        max_second_domain(2)=frf_module(d,2);
        max_indice_second_domain(2)=d;
        natural_freq2(2)=freq(d);
    end
    if frf_module(d,3)>max_second_domain(3)
        max_second_domain(3)=frf_module(d,3);
        max_indice_second_domain(3)=d;
        natural_freq3(2)=freq(d);
    end
end

%third domain
max_third_domain=[0,0,0];
max_indice_third_domain=[0,0,0];
for d=m(4)+1:m(5)
    if frf_module(d,1)>max_third_domain(1)
        max_third_domain(1)=frf_module(d,1);
        max_indice_third_domain(1)=d;
        natural_freq1(3)=freq(d);
    end
    if frf_module(d,2)>max_third_domain(2)
        max_third_domain(2)=frf_module(d,2);
        max_indice_third_domain(2)=d;
        natural_freq2(3)=freq(d);
    end
    if frf_module(d,3)>max_third_domain(3)
        max_third_domain(3)=frf_module(d,3);
        max_indice_third_domain(3)=d;
        natural_freq3(3)=freq(d);
    end
end

%forth domain
max_forth_domain=[0,0,0];
max_indice_forth_domain=[0,0,0];
for d=m(5)+1:m(6)
    if frf_module(d,1)>max_forth_domain(1)
        max_forth_domain(1)=frf_module(d,1);
        max_indice_forth_domain(1)=d;
        natural_freq1(4)=freq(d);
    end
    if frf_module(d,2)>max_forth_domain(2)
        max_forth_domain(2)=frf_module(d,2);
        max_indice_third_domain(2)=d;
        natural_freq2(4)=freq(d);
    end
    if frf_module(d,3)>max_forth_domain(3)
        max_forth_domain(3)=frf_module(d,3);
        max_indice_forth_domain(3)=d;
        natural_freq3(4)=freq(d);
    end
end

%fifth domain
max_fifth_domain=[0,0,0];
max_indice_fifth_domain=[0,0,0];
for d=m(6)+1:m(7)
    if frf_module(d,1)>max_fifth_domain(1)
        max_fifth_domain(1)=frf_module(d,1);
        max_indice_fifth_domain(1)=d;
        natural_freq1(5)=freq(d);
    end
    if frf_module(d,2)>max_fifth_domain(2)
        max_fifth_domain(2)=frf_module(d,2);
        max_indice_fifth_domain(2)=d;
        natural_freq2(5)=freq(d);
    end
    if frf_module(d,3)>max_fifth_domain(3)
        max_fifth_domain(3)=frf_module(d,3);
        max_indice_fifth_domain(3)=d;
        natural_freq3(5)=freq(d);
    end
end

%sixth domian
max_sixth_domain=[0,0,0];
max_indice_sixth_domain=[0,0,0];
for d=m(7)+1:m(8)
    if frf_module(d,1)>max_sixth_domain(1)
        max_sixth_domain(1)=frf_module(d,1);
        max_indice_sixth_domain(1)=d;
        natural_freq1(6)=freq(d);
    end
    if frf_module(d,2)>max_sixth_domain(2)
        max_sixth_domain(2)=frf_module(d,2);
        max_indice_sixth_domain(2)=d;
        natural_freq2(6)=freq(d);
    end
    if frf_module(d,3)>max_sixth_domain(3)
        max_sixth_domain(3)=frf_module(d,3);
        max_indice_sixth_domain(3)=d;
        natural_freq3(6)=freq(d);
    end
end
plot(freq,abs(cohe(:,1)));

%now calculating the damping ratio with the fisrt method: half power point
max_values=zeros(5,3);
max_values(1,:)=max_first_domain;
max_values(2,:)=max_second_domain;
max_values(3,:)=max_third_domain;
max_values(4,:)=max_forth_domain;
max_values(5,:)=max_fifth_domain;
max_indices=zeros(5,3);
max_indices(1,:)=max_indice_first_domain;%the firce indice is domain, the second indice is the accelometer
max_indices(2,:)=max_indice_second_domain;
max_indices(3,:)=max_indice_third_domain;
max_indices(4,:)=max_indice_forth_domain;
max_indices(5,:)=max_indice_fifth_domain;


d=1;
k=0;
w=1;
m=zeros(2,15);
p=1;
for i=1:5 %defining each domain where each peak lays in it
    for j=1:2 %defining the number of the output points we have
        for d=max_indices(i,j)-50:max_indices(i,j)+50
            if frf_module(d,j)>sqrt(2)/2*max_values(i,j)||frf_module(d,j)==sqrt(2)/2*max_values(i,j)
                k=k+1;
                if k==1
                    m(1,p)=freq(d);
                end 
               m(2,p)=freq(d);
            end
            p=p+1;
        end
    end
end


%%
%for i=1:5
   %for max_indice_first_domain
    %%if frf_module(d,1)>=sqrt(2)/2*max_first_domain(1) && d<max_indice_first_domain
        %damping_indice_first_domain_zeros(1,1)=d;
       % damping_value_first_domain_zeros(1,1)
      %  break
   % end
%%

    
