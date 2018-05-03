function newt_hard(x_1, x_2, max)

% Functions f1 and f2.
f_1 = @(x_1, x_2) x_1^2 + x_2^2 - 2;
f_2 = @(x_1, x_2) exp(x_1 - 1) - (x_2^2) -2;
    
% Used to measure progress.
x_1_prev = 0;
x_2_prev = 0;

% Used to count number of iterations before convergence.
k = 1;

while abs(x_1 - x_1_prev) > eps*abs(x_1) && abs(x_2 - x_2_prev) > eps*abs(x_2)
    if k == max
        return
    end
    fprintf('x_1 = %e, x_2 = %e\n', x_1, x_2);
    a = 2 * x_1;
    b = 2 * x_2;
    c = exp(x_1 - 1);
    d = -2 * x_2;
    f_1_x = f_1(x_1, x_2);
    f_2_x = f_2(x_1, x_2);
    res = [x_1; x_2] - inv([a b; c d]) * [f_1_x; f_2_x];
    x_1_prev = x_1;
    x_2_prev = x_2;
    x_1 = res(1);
    x_2 = res(2);  
    k = k + 1;
end

fprintf('number of iterations n = %d\n', k);
end



