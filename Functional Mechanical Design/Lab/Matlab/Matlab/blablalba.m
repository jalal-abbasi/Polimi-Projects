clear all
close all
clc

ciaone = xlsread('C_vect_CIAONE.xlsx');

plot(ciaone(:,1),ciaone(:,2));

ciaone_dot = diff(ciaone(:,2))/(2*pi/length(ciaone(:,1)));

hold on
plot(ciaone(1:end-1,1),ciaone_dot);

