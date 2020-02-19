% Author: Popov Dmitry & Vladislav Berezhnoy
% Advanced Robotic Manipulation
% Homework 1
%
% Implements inverse kinematics
%
% Using:
% HOWTO(x,y,plot);
% Input: x,y - desired EE position , plot - if true than draw robot in plot
% Output: Q - 4x4 matrix with joints angles in rad


function [Q] = HOWTO(x,y,z,L,dm)
L1 = L(1);
L2 = L(2);

% 1 leg (z)
 % elbow down
d10 = z;
q12 = acos((x^2 + y^2 - L1^2 - L2^2)/(2*L1*L2));
q11 = -atan2(L2*sin(q12), L1+L2*cos(q12)) + atan2(y,x);
q13 = -q12 - q11;

% 2 leg (y)
% elbow down
x2 = x;
y2 = dm-z;
z2 = y;
d20 = y2;
q22 = acos((z2^2 + x2^2 - L1^2 - L2^2)/(2*L1*L2));
q21 = -atan2(L2*sin(q22), L1+L2*cos(q22)) + atan2(x2,z2); % elbow down
q23 = -q22 - q21;

% 3 leg (x)
% elbow down
x3 = z;
y3 = dm - y;
z3 = x;
d30 = x3;
q32 = acos((y3^2 + z3^2 - L1^2 - L2^2)/(2*L1*L2));
q31 = -atan2(L2*sin(q32), L1+L2*cos(q32)) + atan2(z3,y3); % elbow down
q33 = -q31 - q32;

d0 = [d10; d20; d30];
q1 = [q11; q21; q31];
q2 = [q12; q22; q32];
q3 = [q13; q23; q33];

Q =[d0,q1,q2,q3];
end