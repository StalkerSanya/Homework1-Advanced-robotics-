% Author: Alexander Osipov
% Innopolis University
% Advanced Robotic Manipulation
% Homework 1
%
% Calculate robot end-effector displacement
%
% Using:
% showDef_lin(F,L,dm);
% Input: F - force vector (Fx,Fy,Fz,Mx,My,Mz) example: F = [100;100;100;0;0;0];
% Output: none 

function showDef_map(F,L,dm)

x = 25:25:475;
y = 25:25:475;
z = 25:25:475;

xyz = zeros(length(x),length(y), length(z));

for i = 1:length(x)
%     disp(i/length(x)*100)
    for j = 1:length(y)
        for k = 1:length(z)
            % Calc robot stiffnes matrix
            K = MSA_K_total(x(i)/1000, y(j)/1000, z(k)/1000,L,dm);
            % Get deflections for all configurations
            dt= inv(K)*F;
            dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            xyz(i,j,k) = dr;
%             deflection(l) = dr;
%             l = l+1;
        end
    end    
end


[X,Y,Z] = meshgrid(x,y,z);
figure
scatter3(X(:)/1000,Y(:)/1000,Z(:)/1000,20,xyz(:),"filled");    
xlabel('x-coordinate [m]')
ylabel('y-coordinate [m]')
zlabel('z-coordinate [m]')

cb = colorbar;                                     
cb.Label.String = 'Deflection [m]';




end