function [t,z,d,ImpactSpeed] = ivpSolver(Q, start)
% ivpSolver    Solve initial value problem (IVP) and find target location
%
%     [T,Z,D,IMPACTSPEED] = ivpSolver(Q, START) computes the IVP solution
%     using an angle Q and initial location of START to generate the target
%     location, D, and the impact velocity IMPACTSPEED

% Set initial conditions
v = 75; % Initial velocity (m/s)
t(1) = 0; % First time element of the time vector (seconds)
z(:,1) = [start, v*cosd(Q), 1, v*sind(Q)]; % Initial coordinates

dt = 0.01; % Time step (seconds)

% Continue stepping until the height of the shuttlecock becomes zero
n=1;
while z(3,:) > 0
    % Increment the time vector by one time step
    t(n+1) = t(n) + dt;
    
    % Apply Runge-Kutta's method for one time step
    z(:,n+1) = stepRungeKutta(t(n), z(:,n), dt);
    
    n = n+1;
    
end

d = z(1,end); % Extract target location for output
ImpactSpeed = sqrt(((z(2,end))^2)+((z(4,end))^2)); % Calculate impact speed