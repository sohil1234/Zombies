% Parameters
a = 0.01;  % Zombie destruction rate
b = 0.02;  % Human-to-zombie conversion rate
ze = 0.005; % Resurrection rate
d = 0.001;  % Background death rate
T = 100;    % Total simulation time
dt = 0.1;   % Time step

% Run the simulation
zombies(a, b, ze, d, T, dt);
b = 0.05; % Higher rate of human-to-zombie conversion
zombies(a, b, ze, d, T, dt);
