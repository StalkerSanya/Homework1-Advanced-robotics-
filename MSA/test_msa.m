%% TEST OF FUNCTIONS for finding stiffness and deflection map
clc;
close all;
clear all;
x=0.25;
y=0.25;
z=0.25;
%lengths of legs
L1=0.36;
L2=0.36;
L = [L1, L2];
% limit movement of active joints
dm=0.5;
% Function of inverse kinematic
temp = HOWTO(x,y,z,L,dm);
%angulars 1 leg of 1 2 3 passive joints
q1 = [temp(1,2), temp(1,3), temp(1,4)];
%angulars 2 leg of 1 2 3 passive joints
q2 = [temp(2,2), temp(2,3), temp(2,4)];
%angulars 3 leg of 1 2 3 passive joints rats
q3 = [temp(3,2), temp(3,3), temp(3,4)];
% functions for calcualtion stiffness for 1 2 3 legs
MSA_K1(q1,L);
MSA_K2(q2,L);
MSA_K3(q3,L);
MSA_K_total(x,y,z,L,dm);
%% Deflection MAP 
%lengths of legs
L1=0.36;
L2=0.36;
L = [L1, L2];
% limit movement of active joints
dm=0.0;
F = [100;100;100;0;0;0];
showDef_map(F,L,dm);

