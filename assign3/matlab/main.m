% test_LU_factorization();
% 
% get_cond_num();
% 
% h = solve(); 

% N = [21 41 81 161];
N = 21;

% A = [1 1.0e-1 1.0e-3 1.0e-5 1.0e-7 1.0e-9 1.0e-11 1.0e-13 1.0e-15];
A = 1.0e-1;

for k = 1:length(N)
    n = N(k);
    for j = 1:length(A)
        a = A(j);
        mat = zeros(n, 3);
        
        % Build the A matrix.
        for i = 1:n
            if i == 1
                mat(i,:) = [-2 1 0]; 
            elseif i == n
                mat(i,:) = [0 a -2*a]; 
            elseif i == 2 || i == 3
                mat(i,:) = [1 -2 1]; 
            elseif i == n - 2 || i == n - 1
                mat(i,:) = [a -2*a a]; 
            else
                mat(i,:) = [1 -1*(1 + a) a]; 
            end
        end           
    end
end

mat