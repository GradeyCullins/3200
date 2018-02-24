function res = gauss_leg_5(f, a, b)
    % GAUSS_LEG_4 Solve integral of f from a to b using Gauss-Legendre rule    
    
    % Contains points x_i
    X = [
            -(1/3) * sqrt(5 - 2 * sqrt(10/7))
            -(1/3) * sqrt(5 + 2 * sqrt(10/7))
             0
             (1/3) * sqrt(5 - 2 * sqrt(10/7))
             (1/3) * sqrt(5 + 2 * sqrt(10/7))             
    ];

    W = [
            (322 + 13 * sqrt(70)) / 900
            (322 - 13 * sqrt(70)) / 900
            128 / 225
            (322 + 13 * sqrt(70)) / 900
            (322 - 13 * sqrt(70)) / 900
            
    ];           

    dx = 0.5 * (b - a);
    
    res = 0;
    
    for i = 1:length(X)       
%         res = res + W(i) * polyval(f, ((dx) * X(i)) + 0.5 * (a + b));         
        res = res + W(i) * f(((dx) * X(i)) + 0.5 * (a + b));         
    end   
    
    res = dx * res;
end