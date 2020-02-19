function [K] = MSA_K_total(x,y,z,L,dm)

% Function of inverse kinematic
temp = HOWTO(x,y,z,L,dm);

%angulars of 1 leg for 1 2 3 passive joints
q1 = [temp(1,2), temp(1,3), temp(1,4)];
%angulars of 1 leg for 1 2 3 passive joints
q2 = [temp(2,2), temp(2,3), temp(2,4)];
%angulars of 1 leg for 1 2 3 passive joints
q3 = [temp(3,2), temp(3,3), temp(3,4)];

% result matrix = chain1 matrix + chain2 matrix
if  isreal(temp(1,2))&&isreal(temp(1,3))&&isreal(temp(2,2))&&isreal(temp(2,3))&&isreal(temp(3,2))&&isreal(temp(3,3))...
                &&isfinite(temp(1,2))&&isfinite(temp(1,3))&&isfinite(temp(2,2))&&isfinite(temp(2,3))&&isfinite(temp(3,2))&&isfinite(temp(3,3))
    %leq 1(z)
    K1 = MSA_K1(q1,L);
    %leq 2(y)
    K2 = MSA_K2(q2,L);
    %leq 3(x)
    K3 = MSA_K3(q3,L);
    K = K1 + K2 + K3;
else
     K=0;
end
end
