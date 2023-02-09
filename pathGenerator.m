function [] = pathGenerator(start,target)
%pathGenerator Produces Graph showing shuttlecock's flight trajectory
%   
%   [] = pathGenerator(START,TARGET) plots a graph showing the flight
%   trajectory of a shuttlecock using START and TARGET in the
%   shootingMethod function to calculate required pitchAngle to reach
%   target

if (target - start) > 4.55 || (target - start) < 1.46  % Prompt user to input valid inputs
    
    disp("Please enter a start location and target location within a separation between 1.46 and 4.55 m")
    
else
    
% Obtain the required pitch angle and impact speed using start and target
% locations in shootingMethod function
[pitchAngle, z, ~,ImpactSpeed] = shootingMethod(start, target);



% Plot the shuttlecock trajectory
plot(z(1,:),z(3,:))
grid on
hold on
xlabel('Distance, m')
ylabel('Height, m')
title('Trajectory of Shuttlecock')
plot(z(1,end),z(3,end),'kX') % Plot an "X" at the point of landing

disp("Pitch Angle = " + num2str(pitchAngle) + " degrees")   % Display pitch angle
disp("Ground Impact Speed = " + num2str(ImpactSpeed) + " m/s")  % Display ground impact speed
end
end