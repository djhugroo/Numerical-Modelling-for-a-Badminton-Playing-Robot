function znext = stepRungeKutta(t,z,dt)
% stepRungeKutta   Compute one step using the Runge-Kutta method
% 
%     ZNEXT = stepRungeKutta(T,Z,DT) computes the state vector ZNEXT at the next
%     time step T+DT

% Calculate the state derivative from the current state

A = dt*stateDeriv(t, z);
B = dt*stateDeriv(t+(dt/2), z+(A/2));
C = dt*stateDeriv(t+(dt/2), z+(B/2));
D = dt*stateDeriv(t+dt, z+C);


% Calculate the next state vector from the previous one using Runge-Kutta's
% update equation
znext = z + (A+(2*B)+(2*C)+D)/6;
