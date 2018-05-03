function cond_nums = get_cond_num()
   
N = [21 41 81 161];
A = [1 1.0e-1 1.0e-3 1.0e-5 1.0e-7 1.0e-9 1.0e-11 1.0e-13 1.0e-15];

% N x A matrix of condition numbers for matrix A
cond_nums = zeros(length(N), length(A));

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
        cond_nums(k, j) = cond(mat);        
    end
end

disp(cond_nums)
hold off;
plot(A, cond_nums(1,:), '-*', A, cond_nums(2,:), '-*', A, cond_nums(3,:), '-*', A, cond_nums(4,:), '-*')
title('Condition number as a increases.')
legend('N = 21', 'N = 41', 'N = 81', 'N = 161');
xlabel('a');
ylabel('Condition Number');
end