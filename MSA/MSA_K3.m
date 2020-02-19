function [K] = MSA_K3(q,L)
% 3 leg (x)

Kact = 1e6; % Actuator stif
%material and shape parameters
E = 70e9; %Young's modulus
G = 25.5e9; %shear modulus

%for cylinder
d = 50e-3;
S = pi*d^2/4;
Iy = pi*d^4/64;
Iz = pi*d^4/64;

% finding Kq for link 1
K22_1 = k22(E, G, L(1), S, Iy, Iz);
K11_1 = k11(E,G,L(1),S,Iy,Iz);
K12_1 = k12(E,G,L(1),S,Iy,Iz);
K21_1 = K12_1';

K1_1 = [K11_1, K12_1;
        K21_1, K22_1];
   
Q1 = [Rx(pi)*Ry(pi/2)*Rz(q(1)),zeros(3,9);
      zeros(3,3),Rx(pi)*Ry(pi/2)*Rz(q(1)),zeros(3,6);
      zeros(3,6),Rx(pi)*Ry(pi/2)*Rz(q(1)),zeros(3,3);
      zeros(3,9),Rx(pi)*Ry(pi/2)*Rz(q(1))];
Kq_1 = Q1*K1_1*Q1';
% finding Kq for link 2 

K22_2 = k22(E, G, L(2), S, Iy, Iz);
K11_2 = k11(E,G,L(2),S,Iy,Iz);
K12_2 = k12(E,G,L(2),S,Iy,Iz);
K21_2 = K12_2';

K1_2 = [K11_2, K12_2;
        K21_2, K22_2];

Q2 = [Rx(pi)*Ry(pi/2)*Rz(q(1))*Rz(q(2)),zeros(3,9);
      zeros(3,3),Rx(pi)*Ry(pi/2)*Rz(q(1))*Rz(q(2)),zeros(3,6);
      zeros(3,6),Rx(pi)*Ry(pi/2)*Rz(q(1))*Rz(q(2)),zeros(3,3);
      zeros(3,9),Rx(pi)*Ry(pi/2)*Rz(q(1))*Rz(q(2))];
Kq_2 = Q2*K1_2*Q2'; 

% useful matrices 
o5x6(1:5,1:6) = 0;
I6x6 = eye(6);
o1x6(1,1:6) = 0;
o6x6(1:6,1:6) = 0;

% for rigit base
r_base = [zeros(6,6),I6x6];

% for elastic joint
lre = [0,1,0,0,0,0;
       0,0,1,0,0,0;
       0,0,0,1,0,0;
       0,0,0,0,1,0;
       0,0,0,0,0,1];
    
le = [1,0,0,0,0,0];

el_j = [o5x6,o5x6,lre,-lre;
      I6x6,I6x6,o6x6,o6x6;
      le,o1x6,Kact*le,-Kact*le];

% for passive joints
lrp = [1,0,0,0,0,0;
        0,1,0,0,0,0;
        0,0,1,0,0,0;
        0,0,0,0,1,0;
        0,0,0,0,0,1];
    
lp = [0,0,0,1,0,0];

ps_j = [o5x6,o5x6,lrp,-lrp;
       lrp,lrp,o5x6,o5x6;
       lp,o1x6,o1x6,o1x6;
       o1x6,lp,o1x6,o1x6];

% for flexible link 1 and 2
f_link_1 = [[-I6x6,o6x6;o6x6,-I6x6],Kq_1];
f_link_2 = [[-I6x6,o6x6;o6x6,-I6x6],Kq_2];
   
% Agregation matrix
Gen = [r_base(:,1:6),zeros(6,36), r_base(:,7:12), zeros(6,36);
       el_j(:,1:12),zeros(12,30), el_j(:,13:24), zeros(12,30);
       zeros(12,6),ps_j(:,1:12),zeros(12,24),zeros(12,6),ps_j(:,13:24),zeros(12,24);
       zeros(12,18),ps_j(:,1:12),zeros(12,12),zeros(12,18),ps_j(:,13:24),zeros(12,12);
       zeros(12,30),ps_j(:,1:12),zeros(12,30),ps_j(:,13:24);
       zeros(12,12),f_link_1(:,1:12),zeros(12,18),zeros(12,12),f_link_1(:,13:24),zeros(12,18);
       zeros(12,24),f_link_2(:,1:12),zeros(12,6),zeros(12,24),f_link_2(:,13:24),zeros(12,6);
       zeros(6,36),I6x6,zeros(6,42)];

% check size agregation matrix
size(Gen);

A = Gen(1:sh(Gen)-6,1:sv(Gen)-6);
B = Gen(1:sh(Gen)-6,sv(Gen)-5:sv(Gen));
C = Gen(sh(Gen)-5:sh(Gen),1:sv(Gen)-6);
D = Gen(sh(Gen)-5:sh(Gen),sv(Gen)-5:sv(Gen));

% check obtained matrices
size(A);
rank(A);
size(B);
size(C);
size(D);

K = D - C*inv(A)*B;
end