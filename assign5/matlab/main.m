% coffee_cup_solver

% forward_eulers

h = [30 15 10 5 1 0.5 0.25]; 
for i = 1:length(h)
   t = 0:h(i):300;
   y = ode23_2(h(i)) 
   plot(t, y);
   title('ODE23 as step size h decreases');
   xlabel('time t');
   ylabel('y');
   hold on;
end

legend('h = 30', 'h = 15', 'h = 10', 'h = 5', 'h = 1', 'h = 0.5', 'h = 0.25');



