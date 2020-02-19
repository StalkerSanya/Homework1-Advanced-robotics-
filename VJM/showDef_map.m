% Author: Alexander Osipov
% Innopolis University
% Advanced Robotic Manipulation
% Homework 1
%
% Calculate robot end-effector displacement
%
% Using:
% showDef_lin(F);
% Input: F - force vector (Fx,Fy,Fz,Mx,My,Mz) example: F = [100;100;100;0;0;0];
% Output: none 

function showDef_map(F,L,dm)

x = 25:25:475;
y = 25:25:475;
z = 25:25:475;
xyz = zeros(length(x),length(y), length(z));

for i = 1:length(x)
    for j = 1:length(y)
        for k = 1:length(z)
            % Calc robot stiffnes matrix
            K = VJM_lin_total(x(i)/1000, y(j)/1000, z(k)/1000,L,dm);
            % Get deflections for all configurations
            dt= inv(K)*F;
            dr=sqrt(dt(1)^2+dt(2)^2+dt(3)^2);
            xyz(i,j,k) = dr;
        end
    end    
end


[x1,y1,z1] = meshgrid(x,y,z);
length(x1(:));
figure
% [x,y,z] = meshgrid(:,1:41,1:41);
scatter3(x1(:)/1000,y1(:)/1000,z1(:)/1000,100,xyz(:),'filled');   
xlabel('X [m]')
ylabel('Y [m]')
zlabel('Z [m]')

cb = colorbar;                                     
cb.Label.String = 'deflection [m]';

end