function res = comp_trap(f, a, b)
    % COMP_TRAP Calculate the composite trapezoidal of a function f.    
    
    % Contains the different step interval sizes.
    N = [17 33 65 129 257 513];     
    
    % Vector containing the results of diff. interp. runs.
    res = zeros(1, length(N));
    
    % Run the quadrature for each size in N.
    for n = 1:length(N)                
        % Calculate ?x 
        dx = (b - a) / N(n);
         
        % Create the intervals x_i to x_n.
        X = a:dx:b;

        % Run composite trapzedoidal.
        for i = 1:length(X)            
            if i == 1 || i == length(X)
                res(n) = res(n) + polyval(f, X(i));
            else
                res(n) = res(n) + (2 * polyval(f, X(i)));
            end         
        end                        
        % Store the result for this quadrature run in our result array.
        res(n) = (dx * 0.5) * res(n);
    end
end