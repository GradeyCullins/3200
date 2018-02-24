function res = gauss_prac(f, a, b)
    % GAUSS_LEG_PRAC Solve integral of f from a to b using Gauss-Legendre rule.   
        
    X = [
            -sqrt(3/5)
            0           
            sqrt(3/5)
    ];

    W = [
            5/9
            8/9
            5/9
    ];           

    dx = 0.5 * (b - a);
    
    res = 0;
    
    for i = 1:length(X)       
        res = res + W(i) * polyval(f, (dx * X(i)) + 0.5 * (a + b));         
    end   
    
    res = dx * res;
end