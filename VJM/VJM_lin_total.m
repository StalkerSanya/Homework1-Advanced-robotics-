% Author: Alexander Osipov
% Innopolis University
% Advanced Robotic Manipulation
% Homework 1
%
% Calculate robot stiffness matrix in current position 
% for all configurations
%
% Using:
% [K] = VJM_lin_total(x,y)
% Input: x,y end-effector position
% Output: K  - 6*6 compliance matrix for all robot

function [K] = VJM_lin_total(x,y,z,L,dm)
% for 1 leg(z)
Tbase1 = eye(4);
Ttool1 = eye(4);
% for 2 leg(y)
Tbase2 = Tz(dm)*Rx(-pi/2);
Ttool2 = eye(4);
% for 3 leg(x)
Tbase3 = Ty(dm)*Rx(pi)*Ry(pi/2);
Ttool3 = eye(4);

t = zeros(1,13);

% get angles with IK
temp = HOWTO(x,y,z,L,dm);

%angulars of active joints of 1 2 3 leg  
d0 = [temp(1,1), temp(2,1), temp(3,1)];
%angulars 1 leg of 1 2 3 passive joints
q1 = [temp(1,2), temp(1,3), temp(1,4)];
%angulars 2 leg of 1 2 3 passive joints
q2 = [temp(2,2), temp(2,3), temp(2,4)];
%angulars 3 leg of 1 2 3 passive joints 
q3 = [temp(3,2), temp(3,3), temp(3,4)];

% result stiffness of robot K = K1 + K2 + K3
if  isreal(temp(1,2))&&isreal(temp(1,3))&&isreal(temp(2,2))&&isreal(temp(2,3))&&isreal(temp(3,2))&&isreal(temp(3,3))...
                &&isfinite(temp(1,2))&&isfinite(temp(1,3))&&isfinite(temp(2,2))&&isfinite(temp(2,3))&&isfinite(temp(3,2))&&isfinite(temp(3,3))
    % for 1 leg(z)
    K1 = VJM_lin_1(Tbase1,Ttool1,d0(1),q1,t,L);
    % for 2 leg(y)
    K2 = VJM_lin_2(Tbase2,Ttool2,d0(2),q2,t,L);
    % for 3 leg(x)
    K3 = VJM_lin_3(Tbase3,Ttool3,d0(3),q3,t,L);
    K = K1 + K2 + K3;
else
     K=0;
end