% ===================================================
% BEGIN #1
% ===================================================

% % Starting points.
% x_1 = 1;
% x_2 = 0.1;
% 
% % Run the experiments with different starting points.
% for i = 1:5
%     newt_code_1(x_1, x_2, 100)
%     x_1 = x_1 * 10;
%     x_2 = x_2 * 10;
% end
% 
% % Used to find real answer of #1.
% fun = @my_funcs
% % fun([1 1])
% fsolve(fun, [1 .1])

% ===================================================
% END #1
% ===================================================


% ===================================================
% BEGIN #2
% ===================================================

% Show the solution to the system calculated by hand.
% newt_hard(1, 0.1, 1000);
 
% % Get a function handle for the system of equations.
% fun = @hard_funcs;
% % None are solveable.
% res = fsolve(fun, [1.1 1.1])
% res2 = fsolve(fun, [2 0.5])
% res3 = fsolve(fun, [3 5])

% ===================================================
% END #2
% ===================================================


% ===================================================
% BEGIN #3
% ===================================================

% % Get the actual solution.
% lo_fun = @loran_funcs;
mat_res = fsolve(lo_fun, [583 583])
newt_loran(501, 501, 25);
% 
% for i = 0:200
%     newt_loran(400 + i, 400 + i, 25);
% end











