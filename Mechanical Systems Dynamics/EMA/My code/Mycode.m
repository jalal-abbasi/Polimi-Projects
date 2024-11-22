clear all
close all
clc
frf_module=abs(frf);
frf_phase=angle(frf);
[pks,locs] = findpeaks(frf_module);