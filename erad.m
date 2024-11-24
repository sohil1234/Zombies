function [] = erad(a, b, ze, d, k, T, dt)
    % This function simulates the eradication of zombies using impulses.
    % Function Inputs:
    %   a  - Alpha value: "zombie destruction" rate
    %   b  - Beta value: "new zombie" rate
    %   ze - Zeta value: zombie resurrection rate
    %   d  - Delta value: background death rate
    %   k  - Kill rate, used in the impulse
    %   T  - Stopping time
    %   dt - Time step
    % Created by Philip Munz, November 21, 2008
    
    N = 1000; % Population
    Ti = T / 4; % Divide simulation into 4 parts with impulses
    n = Ti / dt;
    m = T / dt;
    
    s1 = N; z1 = 0; r1 = 0;

    % Apply impulse strategy in 4 phases
    sol1 = eradode(a, b, ze, d, Ti, dt, s1, z1, r1);
    sol1(n+1) = sol1(n+1) - 1 * k * sol1(n+1);
    s1 = N - sol1(n+1);
    z1 = sol1(n+1);

    sol2 = eradode(a, b, ze, d, Ti, dt, s1, z1, r1);
    sol2(n+1) = sol2(n+1) - 2 * k * sol2(n+1);
    s1 = N - sol2(n+1);
    z1 = sol2(n+1);

    sol3 = eradode(a, b, ze, d, Ti, dt, s1, z1, r1);
    sol3(n+1) = sol3(n+1) - 3 * k * sol3(n+1);
    s1 = N - sol3(n+1);
    z1 = sol3(n+1);

    sol4 = eradode(a, b, ze, d, Ti, dt, s1, z1, r1);
    sol4(n+1) = sol4(n+1) - 4 * k * sol4(n+1);

    % Combine solutions and time vectors
    sol = [sol1(1:n), sol2(1:n), sol3(1:n), sol4];
    t = 0:dt:T;

    % Plot results
    hold on;
    plot(t(1:n), sol1(1:n), 'k');
    plot(t(n+1:2*n), sol2(1:n), 'k');
    plot(t(2*n+1:3*n), sol3(1:n), 'k');
    plot(t(3*n+1:end), sol4, 'k');
    hold off;
end
