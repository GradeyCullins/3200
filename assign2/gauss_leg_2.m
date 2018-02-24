function res = gauss_leg_2(f, a, b)
    % GAUSS_LEG_2 Solve integral of f from a to b using Gauss-Legendre rule    
    
    % Contains the different step interval sizes.        
    x_1 = 1 / sqrt(3);
    w_1 = 1;
    
    x_2 = -1 / sqrt(3);
    w_2 = 1;
    
    dx = 0.5 * (b - a);
    
%     res = w_1 * polyval(f, ((dx) * x_1) + 0.5 * (a + b)); 
    res = w_1 * f(((dx) * x_1) + 0.5 * (a + b)); 
    
%     res = dx * res + w_2 * polyval(f, ((dx) * x_2) + 0.5 * (a + b));
    res = dx * res + w_2 * f(((dx) * x_2) + 0.5 * (a + b));
end