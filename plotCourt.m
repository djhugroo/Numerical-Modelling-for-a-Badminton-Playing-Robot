% Court dimensions 
Court1X = [-6.68 6.68 6.68 -6.68 -6.68];    % Full court boundary
Court1Y = [3.05 3.05 -3.05 -3.05 3.05];
Court1Z = [0 0 0 0 0];

Court2X = [-6.68 6.68 6.68 -6.68 -6.68];    % Court boundary excluding side lines for doubles
Court2Y = [2.57 2.57 -2.57 -2.57 2.57];
Court2Z = [0 0 0 0 0];

Court3X = [-5.92 5.92 5.92 -5.92 -5.92];    % Court boundary excluding long service line for singles
Court3Y = [3.05 3.05 -3.05 -3.05 3.05];
Court3Z = [0 0 0 0 0];

Court4X = [-2 2 2 -2 -2];                   % Court between the 2 short service lines
Court4Y = [3.05 3.05 -3.05 -3.05 3.05];
Court4Z = [0 0 0 0 0];

Court5X = [-6.68 -2 -2 -6.68 -6.68];        % Left side left service court
Court5Y = [3.05 3.05 0 0 3.05];
Court5Z = [0 0 0 0 0];

Court6X = [2 6.68 6.68 2 2];                % Right side right service court
Court6Y = [3.05 3.05 0 0 3.05];
Court6Z = [0 0 0 0 0];

Court7X = [2 6.68 6.68 2 2];                % Right side left service court
Court7Y = [0 0 -3.05 -3.05 0];
Court7Z = [0 0 0 0 0];

Court8X = [-6.68 -2 -2 -6.68 -6.68];        % Left side right service court
Court8Y = [0 0 0 0 0];
Court8Z = [0 0 0 0 0];

% Plotting court

Width = 1; % Width of white lines of court

%Sets Court Colour
fill3([-6.7-0.3,6.7+0.3,6.7+0.3,-6.7-0.3],[3.05+0.3,3.05+0.3,-3.05-0.3,-3.05-0.3],[0,0,0,0],'b');

plot3(Court1X,Court1Y,Court1Z,'w','LineWidth',Width)
plot3(Court2X,Court2Y,Court2Z,'w','LineWidth',Width)
plot3(Court3X,Court3Y,Court3Z,'w','LineWidth',Width)
plot3(Court4X,Court4Y,Court4Z,'w','LineWidth',Width)
plot3(Court5X,Court5Y,Court5Z,'w','LineWidth',Width)
plot3(Court6X,Court6Y,Court6Z,'w','LineWidth',Width)
plot3(Court7X,Court7Y,Court7Z,'w','LineWidth',Width)
plot3(Court8X,Court8Y,Court8Z,'w','LineWidth',Width)
