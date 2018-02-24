function res = gauss_leg_4(f, a, b)
    % GAUSS_LEG_4 Solve integral of f from a to b using Gauss-Legendre rule    
    
    % Contains points x_i
    X = [
            -sqrt((3 - 2 * sqrt(6/5)) / 7)
             sqrt((3 - 2 * sqrt(6/5)) / 7)
            -sqrt((3 + 2 * sqrt(6/5)) / 7)
             sqrt((3 + 2 * sqrt(6/5)) / 7)                        
    ];

    W = [
            (18 + sqrt(30)) / 36;
            (18 + sqrt(30)) / 36;
            (18 - sqrt(30)) / 36;
            (18 - sqrt(30)) / 36;                    
    ];           

    dx = 0.5 * (b - a);
    
    res = 0;
    
    for i = 1:length(X)       
%         res = res + W(i) * polyval(f, ((dx) * X(i)) + 0.5 * (a + b));         
        res = res + W(i) * f(((dx) * X(i)) + 0.5 * (a + b));         
    end   
    
    res = dx * res;
end