clear all
close all
clc
[filename, pathname]=uigetfile;
cd(pathname);
load(filename);
[filename1, pathname1]=uigetfile;
cd(pathname1);
load(filename1);
x_mode=getfield(modes,'x');
y_mode=getfield(modes,'y');
FNT=10;
module_frf=abs(frf);
phase_frf=angle(frf);
plot(freq,module_frf(:,1));
xlabel('frequency [Hz]','FontSize',FNT);
ylabel('magnitude, acc 1 [m/s^2/N]','FontSize',FNT);
figure
plot(freq,module_frf(:,2),'r');
xlabel('frequency [Hz]','FontSize',FNT);
ylabel('magnitude, acc 2 [m/s^2/N]','FontSize',FNT);
figure
plot(freq,module_frf(:,3),'g');
xlabel('frequency [Hz]','FontSize',FNT);
ylabel('magnitude, acc 3 [m/s^2/N]','FontSize',FNT);
figure
plot(freq,phase_frf(:,1));
figure
plot(freq,phase_frf(:,2),'r');
figure
plot(freq,phase_frf(:,3),'g');
figure
plot(freq,cohe(:,1));
figure
%% evaluation of the natural frequencies
% 2) magnitude=peaks (even if w0=wmax*sqrt(1-2h^2))
df=0.02;
vect1=0+df:df:50; vect2=50+df:df:100;  
vect3=100+df:df:200; vect4=200+df:df:300;  vect5=300+df:df:500;
l1=length(vect1); l2=l1+length(vect2); l3=l2+length(vect3);
l4=l3+length(vect4); l5=l4+length(vect5); 
v1=1:l1; v2=l1+1:l2;
v3=l2+1:l3; v4=l3+1:l4;
v5=l4+1:l5;
nw=5; %n w_nat founded
w_nat=zeros(nw,size(frf,2));
m_max=zeros(nw,size(frf,2));
ii=zeros(nw,size(frf,2));
for i=1:3
m_frf1=module_frf(v1,i); [mm1,w1,i1]=massimo(m_frf1,vect1);
m_frf2=module_frf(v2,i); [mm2,w2,i2]=massimo(m_frf2,vect2);
m_frf3=module_frf(v3,i); [mm3,w3,i3]=massimo(m_frf3,vect3);
m_frf4=module_frf(v4,i); [mm4,w4,i4]=massimo(m_frf4,vect4);
m_frf5=module_frf(v5,i); [mm5,w5,i5]=massimo(m_frf5,vect5);
w_nat(:,i)=[w1;w2;w3;w4;w5];
m_max(:,i)=[mm1;mm2;mm3;mm4;mm5];
ii(:,i)=[i1;i2+l1;i3+l2;i4+l3;i5+l4];
end

%since the accelerometer 3 is positioned at the center and the system is
%symmetric, all the antisymmetric modes (even modes) are not visible 
%because at the center there is a node, and the accelerometer doesn't measure
%any acceleration (no amplification)

%w_nat([2,4],3)=0; %0=without meaning, they are not w_nat
w_nat(4,3)=w_nat(4,2);
ii(4,3)=ii(4,2);
%% evaluation of the damping ratio h and of the correct w_nat, half power
%points
n=0.5; df=0.01;
wr_1=-n+w_nat(1,1):df:n+w_nat(1,1);
wr_2=-n+w_nat(2,1):df:n+w_nat(2,1);
wr_3=-n+w_nat(3,1):df:n+w_nat(3,1);
wr_4=-n+w_nat(4,1):df:n+w_nat(4,1);
wr_5=-n+w_nat(5,1):df:n+w_nat(5,1);
wr=[wr_1;wr_2;wr_3;wr_4;wr_5;];
mfrf_1=@(x)interp1(freq,module_frf(:,1),x);
mfrf_2=@(x)interp1(freq,module_frf(:,2),x);
mfrf_3=@(x)interp1(freq,module_frf(:,3),x);
h=zeros(nw,size(frf,2));

%evaluation of the h with the phase method
%since I don't have the analitical expression of the phase I cannot do its
%derivative. I try to make a straight in the neighboroud of -pi/2

p_frf1=@(x)interp1(freq,phase_frf(:,1),x);
p_frf2=@(x)interp1(freq,phase_frf(:,2),x);
p_frf3=@(x)interp1(freq,phase_frf(:,3),x);
r=pi/6;
h_phase=zeros(nw,size(freq,2));
plot(freq,p_frf1(freq),'b');
W12=[];
for i=1:nw
        for k=wr(i,:)-df
            if k<w_nat(i,1)
         if mfrf_1(k)<=sqrt(2)/2*m_max(i,1)
                w1=k;
         end
            else 
                if mfrf_1(k)>=sqrt(2)/2*m_max(i,1)
                    w2=k;
                end
            end
            if p_frf1(k)>0
            if p_frf1(k)>=pi/2+r && p_frf1(k+df)<=pi/2+r
                y1=p_frf1(k); x1=k;
            end
            if p_frf1(k)>=pi/2-r && p_frf1(k+df)<=pi/2-r
                y2=p_frf1(k+df); x2=k+df;
            end
            else
             if p_frf1(k)>=-pi/2+r && p_frf1(k+df)<=-pi/2+r
                y1=p_frf1(k); x1=k;
            end
            if p_frf1(k)>=-pi/2-r && p_frf1(k+df)<=-pi/2-r
                y2=p_frf1(k+df); x2=k+df;               
            end
            end
        end
        h(i,1)=(w2^2-w1^2)/(4*w_nat(i,1)^2);
        der=(y1-y2)/(x1-x2);
        y=@(x) y2+der.*(x-x2);
        h_phase(i,1)=-1/(w_nat(i,1)*der);
        hold on
        plot(wr(i,:),y(wr(i,:)),'k','lineWidth',2);
        W12=[W12;w1 w2];
        w1=0; w2=0; y1=0; y2=0; x1=0; x2=0;      
end
figure
plot(freq,mfrf_1(freq),'b');
hold on
V=linspace(0,800,2);
for i=1:nw
    plot(W12(i,1).*ones(2,1),V,'k');
    plot(W12(i,2).*ones(2,1),V,'k');
end

figure
plot(freq,p_frf2(freq),'r');
W12=[];
for i=1:nw
        for k=wr(i,:)-df
            if k<w_nat(i,2)
         if mfrf_2(k)<=sqrt(2)/2*m_max(i,2)
                w1=k;
         end
            else 
                if mfrf_2(k)>=sqrt(2)/2*m_max(i,2)
                    w2=k;
                end
            end
                    
            if p_frf2(k)>0
             if p_frf2(k)>=pi/2+r && p_frf2(k+df)<=pi/2+r
                y1=p_frf2(k); x1=k;
            end
            if p_frf2(k)>=pi/2-r && p_frf2(k+df)<=pi/2-r
                y2=p_frf2(k+df); x2=k+df;
            end
            else 
             if p_frf2(k)>=-pi/2+r && p_frf2(k+df)<=-pi/2+r
                y1=p_frf2(k); x1=k;
            end
            if p_frf2(k)>=-pi/2-r && p_frf2(k+df)<=-pi/2-r
                y2=p_frf2(k+df); x2=k+df;
            end
            end
           
        end
        h(i,2)=(w2^2-w1^2)/(4*w_nat(i,2)^2);
        der=(y1-y2)/(x1-x2);
        y=@(x) y2+der.*(x-x2);
        hold on
        plot(wr(i,:),y(wr(i,:)),'k','LineWidth',2);
        h_phase(i,2)=-1/(w_nat(i,2)*der);
        W12=[W12;w1 w2];
        w1=0; w2=0; y1=0; y2=0; x1=0; x2=0;
end 
figure
plot(freq,mfrf_2(freq),'r');
hold on
for i=1:nw
    plot(W12(i,1).*ones(2,1),V,'k');
    plot(W12(i,2).*ones(2,1),V,'k');
end

figure
plot(freq,p_frf3(freq),'g');
W12=[];
for i=1:nw
        for k=wr(i,:)-df
            if k<w_nat(i,3)
         if mfrf_3(k)<=sqrt(2)/2*m_max(i,3)
                w1=k;
         end
            else 
                if mfrf_3(k)>=sqrt(2)/2*m_max(i,3)
                    w2=k;
                end
            end
            if p_frf3(k)>0
             if p_frf3(k)>=pi/2+r && p_frf3(k+df)<=pi/2+r
                y1=p_frf3(k); x1=k;
            end
            if p_frf3(k)>=pi/2-r && p_frf3(k+df)<=pi/2-r
                y2=p_frf3(k+df); x2=k+df;
            end
            else
             if p_frf3(k)>=-pi/2+r && p_frf3(k+df)<=-pi/2+r
                y1=p_frf3(k); x1=k;
            end
            if p_frf3(k)>=-pi/2-r && p_frf3(k+df)<=-pi/2-r
                y2=p_frf3(k+df); x2=k+df;
            end
            end
           
        end
        h(i,3)=(w2^2-w1^2)/(4*w_nat(i,3)^2);
        der=(y1-y2)/(x1-x2);
        y=@(x) y2+der.*(x-x2);
        hold on
        plot(wr(i,:),y(wr(i,:)),'k','LineWidth',2);
        h_phase(i,3)=-1/(w_nat(i,3)*der);
        W12=[W12;w1 w2];
        w1=0; w2=0; y1=0; y2=0; x1=0; x2=0;
end 
figure
plot(freq,mfrf_3(freq),'g');
hold on
for i=1:nw
    plot(W12(i,1).*ones(2,1),V,'k');
    plot(W12(i,2).*ones(2,1),V,'k');
end
%h([2,4],3)=0; %as I did for w_nat
%h_phase([2,4],3)=0;
w_nat_real=w_nat.*sqrt(1-2.*h.^2);

%% evaluation of mode shapes
% to find the indices of w_nat_real

%for i=1:3
 %   for j=1:nw
  %      index(j,i)=sum(freq<=(w_nat(j,i)));
   % end
%end
modes=zeros(nw,size(frf,2));
for i=1:3
    modes(:,i)=imag(frf(ii(:,i),i));
end
x=[0.105,0.415,0.600];
%div=[310,420,270,-1000,-2500];
trova2=find(x_mode==x(2)+0.005);
trova1=trova2-1;
for i=1:nw
    figure
    y_mode(:,i)=y_mode(:,i)./y_mode(end,i);
    divi(i)=modes(i,2)/((y_mode(trova1,i)+y_mode(trova2,i))/2);
    plot(x_mode,y_mode(:,i));
    hold on
    plot(x,modes(i,:)/divi(i),'o');
end
