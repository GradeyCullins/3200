L = 0.1; % meters
n = 10; % Number of simulation nodes.
T_0 = 0; % Initial temperature of the rod.
T_1_s = 40; % Boundary 1. 
T_2_s = 20; % Boundary 1.

dx = L/n;

a = 0.0001; % cm^2 / sec


x = dx/2:dx:L-dx/2;

dt = 0.1; % seconds
t_f = 60; % seconds
t = 0:dt:t_f;

T = ones(n, 1) * T_0;

dTdt = zeros(n, 1);

for i = 1:length(t)
   for j = 2:n-1
      dTdt(i) = a * (-(T(j)-T(j - 1))/dx^2+(T(j+1)-T(j))/dx^2); 
   end
   dTdt(1) = a * (-(T(1)-T_1_s)/dx^2+(T(2)-T(1))/dx^2);
   dTdt(n) = a * (-(T(n)-T(n - 1))/dx^2+(T_2_s-T(n))/dx^2);
%    T = T+dTdt*dt;
%    figure(1);
%    plot(x, T, 'Linewidth', 3);
%    axis([0 L 0 50]);
%    xlabel('Distance (m)');
%    ylabel('Temperature (\circC)');
%    pause(0.1);
end
dTdt



