function znext = stepRungeKutta_3D(t,z,dt)
% stepRungeKutta_3D   Compute one step using the Runge-Kutta method
% 
%     ZNEXT = stepRungeKutta_3D(T,Z,DT) computes the state vector ZNEXT at the next
%     time step T+DT

% Calculate the state derivative from the current state

A = dt*stateDeriv_3D(t, z);
B = dt*stateDeriv_3D(t+(dt/2), z+(A/2));
C = dt*stateDeriv_3D(t+(dt/2), z+(B/2));
D = dt*stateDeriv_3D(t+dt, z+C);


% Calculate the next state vector from the previous one using Runge-Kutta's
% update equation
znext = z + (A+(2*B)+(2*C)+D)/6;