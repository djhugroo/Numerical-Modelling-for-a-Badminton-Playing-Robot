function [] = pathGenerator_3D(start,target)
%pathGenerator_3D Produces 3D Graph showing shuttlecock's flight trajectory
%   
%   [] = pathGenerator_3D(START,TARGET) plots a 3D graph showing the flight
%   trajectory of a shuttlecock using START and TARGET in the
%   shootingMethod_3D function to calculate required pitchAngle to reach
%   target

if (target - start) > 4.55 || (target - start) < 1.46  % Prompt user to input valid inputs
    
    disp("Please enter a start location and target location within a separation between 1.46 and 4.55 m")
    
else

% Obtain the required pitch angle and impact speed using start and target
% locations in shootingMethod_3D function
[pitchAngle, z, t,ImpactSpeed] = shootingMethod_3D(start, target);

plotNet;        % Plot the net
plotCourt;      % Plot the Court
axis('equal')

n = size(z,2);  % Obtain the number of elements in the state vector z

for count=2:n

if t(count) < 0.05
    colour = 'r';   % Set trajectory plot for unstable flight to colour red
    pauseTime = 0.2;
    transCount = count; % Saves the count value for the transition point
else
    colour = 'g';   % Set trajectory plot for stable flight to colour green
    pauseTime = 0.000001;
end

% Plot the shuttlecock trajectory
plot3(z(1,count-1:count), z(5,count-1:count),z(3,count-1:count),colour,'LineWidth',2)
grid on
zlim([0 5])
xlabel('Distance, m')
ylabel('Deflection, m')
zlabel('Height, m')
title('Trajectory of Shuttlecock')

pause(pauseTime)    % Enable animation effect

end
plot3(z(1,end),z(3,end),z(5,end),'yX') % Plot the point of landing as X
hold off
transpoint = num2str((z(1,transCount))-start);
disp("Pitch Angle = " + num2str(pitchAngle) + " degrees")   % Display pitch angle
disp("Ground Impact Speed = " + num2str(ImpactSpeed) + " m/s")  % Display ground impact speed
% Display distance travelled upon transition from unstable to stable flight
disp("Transition from unstable to stable flight occured " + transpoint + " m from the hit spot")
end

end