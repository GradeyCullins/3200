function [res, err] = comp_simp(f, a, b, N)
    % COMP_TRAP Calculate the composite trapezoidal of a function f.    
    
    % Contains the different step interval sizes.
%     N = [17 33 65 129 257 513]; 
    
    % Vector containing the results of diff. interp. runs.
    res = zeros(1, length(N));
    
    err = zeros(1, length(N));
    
    % Run the quadrature for each size in N.
    for n = 1:length(N)                
        % Calculate delta x.
        dx = (b - a) / (2 * N(n));
                
        % Create the intervals x_i to x_n.
        X = a:dx:b;                       
                
        % Run composite simpson's.
        for i = 1:(2 * N(n)) + 1            
            x_i = a + (i - 1) * dx;
            
            if i == 1 || i == (2 * length(X) + 1)                
                w_i = dx / 3; 
            elseif mod(i, 2) == 0                
                w_i = (4/3) * dx;                
            else
                w_i = (2/3) * dx;
            end
            
%             res(n) = res(n) + w_i * polyval(f, x_i);
            res(n) = res(n) + w_i * f(x_i);
            
            err(n) = (b - a) * dx^4 * 385.617 / 2880;
        end                                
    end
end