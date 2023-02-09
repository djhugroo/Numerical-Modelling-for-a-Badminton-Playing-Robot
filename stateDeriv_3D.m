function dz = stateDeriv_3D(t,z)
% stateDeriv_3D    Calculate the state derivative for a shuttlecock trajectory in 3D
% 
%     DZ = stateDeriv_3D(T,Z) computes the derivative DZ = [Vx;Vz;Vy;
%     Ax;Az;Ay] of the state vector Z = [Dx;Dz;Dy; Vx;Vz;Vy], where D is
%     displacement, V is velocity, and A is acceleration in the x,z,y axis

% Set constants
M = 5*(10^-3); % Mass (kg)
r = 1.225; % Density of air (kg/m^3)
g = 9.80665; % Acceleration due to gravity (m/s^2)

if t < 0.05
    C = 0.8; % Drag coefficient
    A = 0.012; % Cross-sectional area (m^2)
else
    C = 0.6; % Drag coefficient
    A = 0.009; % Cross-sectional area (m^2)
end

theta = atand((z(4))/(z(2))); % Angle of resultant velocity to the ground
V2 = ((z(2))^2)+((z(4))^2)+((z(6))^2); % Square of resultant velocity
alpha = 0; % Angle of resultant velocity to the x-axis

dz1 = z(2); % Velocity in the x-direction
dz2 = -(((C*r*A)/(2*M))*(V2)*cosd(theta))*cosd(alpha); % Acceleration in the x-direction
dz3 = z(4); % Velocity in the z-direction
dz4 = -(((C*r*A)/(2*M))*(V2)*sind(theta)) - g; % Acceleration in the z-direction
dz5 = z(6); % Velocity in the y-direction
dz6 = -(((C*r*A)/(2*M))*(V2)*cosd(theta))*sind(alpha); % Acceleration in the y-direction

dz = [dz1; dz2; dz3; dz4; dz5; dz6]; % Derivative of state vector z
