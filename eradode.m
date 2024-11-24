function [z] = eradode(a, b, ze, d, Ti, dt, s1, z1, r1)
    % This function applies Euler's method to solve ODEs over a period of time.
    % Function Inputs:
    %   s1, z1, r1 - Initial values of each ODE
    %   Ti          - Simulation time
    %   dt          - Time step
    % Created by Philip Munz, November 21, 2008
    
    k = Ti / dt;
    s = zeros(1, k+1);
    z = zeros(1, k+1);
    r = zeros(1, k+1);
    s(1) = s1;
    z(1) = z1;
    r(1) = r1;

    % Euler's method for solving ODEs
    for i = 1:k
        s(i+1) = s(i) + dt * (-b * s(i) * z(i));
        z(i+1) = z(i) + dt * (b * s(i) * z(i) - a * s(i) * z(i) + ze * r(i));
        r(i+1) = r(i) + dt * (a * s(i) * z(i) + d * s(i) - ze * r(i));
    end
end
