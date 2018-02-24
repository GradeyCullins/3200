function res = gauss_leg(f, a, b)
    % GAUSS_LEG Solve integral of f from a to b using Gauss-Legendre rule    
    
    % Contains the different step interval sizes.
    N = 1;    
    x_i = 0;
    w_i = 2;
    
    dx = 0.5 * (b - a);
    
%     res = dx * w_i * polyval(f, ((dx) * x_i) + 0.5 * (a + b));        
    res = dx * w_i * f(((dx) * x_i) + 0.5 * (a + b));        
end