function coffee_cup_solver

% Example: Euler's method for dTc/dt= -r *(Tc -Ts)
Tc0 = 84; 
npoints = 75; 
dt = 4.0; 
r = 0.025; 
Ts = 19.0;
Tc = zeros(npoints,1);
t = zeros(npoints,1);
Texact = zeros(npoints,1);
Tc(1) = Tc0; % initial condition
t(1) = 0.0; % start at t=0
Texact(1) = Tc0; % initial condition exact
for step=1:npoints-1
    % loop over the timesteps
    Tc(step+1) = Tc(step) -dt*r*(Tc(step)-Ts);
    t(step+1) = t(step) + dt;
%     Tsexact(Tenv, T0, R, t) 
    Texact(step+1) = Tsexact(Ts,Tc0,r,t(step + 1));
    %Tsexactfunc.givesexact vals
end
plot(t,Tc,'-.*r'); %plots numerical sol.in red
hold on;
% keep all plotted lines
plot(t,Texact,'-.+b'); %plots exact sol.in blue,
title('Numerical vs Exact Solution of Coffee Cup Cooling');
legend('Numerical','Exact')
xlabel('Time ')
ylabel('TemperatureTs')
end