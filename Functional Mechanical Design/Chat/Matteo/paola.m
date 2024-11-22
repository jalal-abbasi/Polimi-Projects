clear
clc

a = @(t) spline([0,0.1,0.4,0.5,0.6,0.9,1],[0,1,1,0,-1,-1,0],t);
time = 0:0.01:1;
plot(time,a(time))
grid on

v = @(x) integral(a,0,x);
for ii = 1:length(time)
    V(ii) = integral(a,0,time(ii));
end
figure
plot(time,V)
grid on

v = @(x) spline(time,V,x);
for ii = 1:length(time)
    S(ii)=integral(v,0,time(ii));
end
figure
plot(time,S)
grid on
