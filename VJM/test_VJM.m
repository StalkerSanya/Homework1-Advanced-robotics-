%% TEST OF FUNCTIONS for finding stiffness and deflection map
clc;
close all;
clear all; 
x=0.25;
y=0.25;
z=0.25;
%lengths of legs
L1=0.25;
L2=0.25;
L = [L1, L2];
% limit movement of active joints
dm=0.5;
% Function of inverse kinematic
temp = HOWTO(x,y,z,L,dm);
Tbase1 = eye(4);
Ttool1 = eye(4);
Tbase2 = Tz(dm)*Rx(-pi/2);
Ttool2 = eye(4);
Tbase3 = Ty(dm)*Rx(pi)*Ry(pi/2);
Ttool3 = eye(4);
t = zeros(1,13);

%angulars of active joints of 1 2 3 leg  
d0 = [temp(1,1), temp(2,1), temp(3,1)];
%angulars 1 leg of 1 2 3 passive joints
q1 = [temp(1,2), temp(1,3), temp(1,4)];
%angulars 2 leg of 1 2 3 passive joints
q2 = [temp(2,2), temp(2,3), temp(2,4)];
%angulars 3 leg of 1 2 3 passive joints 
q3 = [temp(3,2), temp(3,3), temp(3,4)];
% Forward kinematic for 1 2 3 legs
FK_1(Tbase1,Ttool1,d0(1),q1,t,L);
FK_2(Tbase2,Ttool2,d0(2),q2,t,L);
FK_3(Tbase3,Ttool3,d0(3),q3,t,L);
% functions for calcualtion stiffness for 1 2 3 legs
VJM_lin_1(Tbase1,Ttool1,d0(1),q1,t,L);
VJM_lin_2(Tbase2,Ttool2,d0(2),q2,t,L);
VJM_lin_3(Tbase3,Ttool3,d0(3),q3,t,L);
%% Deflection MAP 
%lengths of legs
L1=0.36;
L2=0.36;
L = [L1, L2];
% limit movment of active joints
dm=0.5;
F = [100;100;100;0;0;0];
showDef_map(F,L,dm);


