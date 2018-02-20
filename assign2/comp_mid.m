function res = comp_mid(f, a, b)
    % COMP_MID Calculate the composite midpoint of a function f.    
    
    % Contains the different step interval sizes.
    N = [17 33 65 129 257 513]; 
    
    % Vector containing the results of diff. interp. runs.
    res = zeros(1, length(N));
    
    % Run the quadrature for each size in N.
    for n = 1:length(N)                
        % Calculate ?x which is equal to weight at i or w_i.
        dx = (b - a) / N(n);
         
        % Create the intervals x_i to x_n.
        X = a:dx:b; 
        
        % Run composite midpoint.
        for i = 1:N(n)            
            res(n) = res(n) + 0.5 * (polyval(f, X(i)) + polyval(f, X(i + 1))); 
        end
        
        % Store the result for this quadrature run in our result array.
        res(n) = dx * res(n);
    end
end