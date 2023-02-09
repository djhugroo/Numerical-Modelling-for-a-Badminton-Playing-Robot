% Net dimensions
NetX = [0 0 0 0 0];
NetY = [-3.05 -3.05 3.05 3.05 -3.05];
NetZ = [0.79 1.55 1.55 0.79 0.79];

% Plotting Net
plot3(NetX,NetY,NetZ,'k','LineWidth',1)
Mesh = fill3(NetX(1:4),NetY(1:4),NetZ(1:4),'k');
alpha(Mesh,0.1)     % Sets translucency of net

hold on

% Plotting Poles
plot3([0 0],[-3.05 -3.05],[0 1.55],'k','LineWidth',2)
plot3([0 0],[3.05 3.05],[0 1.55],'k','LineWidth',2)