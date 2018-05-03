function h = solve()

N = 161;
A = [1 1.0e-5 1.0e-15];
% A = 1;
H_1 = 8;
H_r = 4;

h = zeros(3, 3);


for k = 1:length(N)
    n = N(k);    
    for j = 1:length(A)
        a = A(j);
        
        % Build the H vector.
        H = zeros(n, 1);
        H(1) = -1 * H_1;
        H(n) = -a * H_r;
        
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
        h(j,:) = mat\H;
    end
end

end