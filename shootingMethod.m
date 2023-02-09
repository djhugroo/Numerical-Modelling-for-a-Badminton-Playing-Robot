function [Q,z,t,ImpactSpeed] = shootingMethod(start, target)
%shootingMethod Calculates the required pitch angle,Q, for the path
%
%   [Q,Z,T,IMPACTSPEED] = shootingMethod(START, TARGET) takes in the 
%   initial and target location and computes the values using ivpSolver to 
%   calculate the pitch angle, Q, required for the path  

Q1 = 30; % Guess 1 (degrees)
Q2 = 60; % Guess 2 (degrees)

% Computes the error for the first guess
[t,z,d,ImpactSpeed]= ivpSolver(Q1, start); % Calculate target location
D(1) = d;
G(1) = Q1;
e(1) = D(1) - target;

% Computes the error for the second guess
[t,z,d,ImpactSpeed]= ivpSolver(Q2, start); % Calculate target location
D(2) = d;
G(2) = Q2;
e(2) = D(2) - target;

n=2;

G(3) = G(n)-((e(n)*(G(n)-G(n-1))/(e(n)-e(n-1)))); % Intelligent guess

% Computes the error for the third guess
[t,z,d,ImpactSpeed]= ivpSolver(G(3), start); % Calculate target location
D(3)= d;
e(3) = D(3) - target;

n=3;
while round(e(n),4) ~= 0 % Generates a new intelligent guess until error is nearly zero

    G(n+1) = G(n)-((e(n)*(G(n)-G(n-1))/(e(n)-e(n-1)))); % Intelligent guess
    [t,z,d,ImpactSpeed]= ivpSolver(G(n+1), start); % Calculate target location
    D(n+1) = d;
    e(n+1)= D(n+1) - target; % Computes the error for the (n+1)th guess
    
    n = n+1;
    
end

Q = G(end); % Extract required pitch angle, Q, for output
    
end