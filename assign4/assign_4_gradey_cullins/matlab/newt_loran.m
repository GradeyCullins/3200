function res = newt_loran(x_1, x_2, max)

% Functions f1 and f2.
f_1 = @(x_1, x_2) ( (x_1^2) / (186^2) ) - ( (x_2^2) / ((300^2) - (186^2)) ) - 1;
f_2 = @(x_1, x_2) ( ((x_2 - 500)^2) / 279^2 ) - ( ((x_1 - 300)^2) / ((500^2) - (279^2)) ) - 1;
    
x_1_start = x_1;
x_2_start = x_2;

% Used to count number of iterations before convergence.
% k = 1;

for k = 1:max    
%     fprintf('x_1 = %e, x_2 = %e\n', x_1, x_2);
    a = (2*x_1) / 186^2;
    b = (- 2 * x_2) / ((300^2) - (186^2));
    c = (-2 * (x_1 - 300)) / ((500^2) - (279^2));
    d = (2 * (x_2 - 500)) / 77841;
    f_1_x = f_1(x_1, x_2);
    f_2_x = f_2(x_1, x_2);
    res = [x_1; x_2] - inv([a b; c d]) * [f_1_x; f_2_x];        
    x_1 = res(1);
    x_2 = res(2);  
end

res = [x_1 x_2];

fprintf('Starting point (%d, %d) converges to x_1 = %e, x_2 = %e\n', x_1_start, x_2_start, x_1, x_2);

end



