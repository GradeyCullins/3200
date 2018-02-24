function [res, err] = comp_trap(f, a, b, N)
    % COMP_TRAP Calculate the composite trapezoidal of a function f.    
             
    % Vector containing the results of diff. interp. runs.
    res = zeros(1, length(N));
    
    err = zeros(1, length(N));
    
    % I calculated this value in advance xD
    f_2_max = 16.4315;
    
    % Run the quadrature for each size in N.
    for n = 1:length(N)                
        % Calculate ?x 
        dx = (b - a) / N(n);
         
        % Create the intervals x_i to x_n.
        X = a:dx:b;
        
        Y = zeros(1, length(X));

        % Run composite trapzedoidal.
        for i = 1:length(X)            
            if i == 1 || i == length(X)
%                 res(n) = res(n) + polyval(f, X(i));
                res(n) = res(n) + f(X(i));
                Y(i) = f(X(i));                
            else
%                 res(n) = res(n) + (2 * polyval(f, X(i)));
                res(n) = res(n) + (2 * f(X(i)));
                Y(i) = 2 * f(X(i));
            end         
        end
        
        % Store the result for this quadrature run in our result array.
        res(n) = (dx * 0.5) * res(n);
        
        % Calculate the error
        err(n) = (b - a) * (dx)^2 * f_2_max / 12;
    end 
        
end