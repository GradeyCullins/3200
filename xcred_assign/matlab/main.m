%% #1 Solve the penta system of equations.
N = [10 100 1000 5000 8000 10000];
% N = [10 100 1000];
Y = zeros(1, length(N));
penta_times = zeros(1, length(N));
mat_times = zeros(1, length(N));

for i = 1:length(N)
    n = N(i);
    tic
    res = solve_penta_sys(n);
    penta_times(i) = toc;
    Y(i) = norm(res);
    
    A = create_mat(n);
    arr = ones(1, n);
    b = 1 / n^4 * transpose(arr);
    tic
    mat_res = A\b;
    mat_times(i) = toc;
    mat_res(:, 1);        
    
    % Ensure that the penta solver has the same results as the backslash
    % operator. The error should be less than a reasonably small tolerance.    
    for j = 1:length(res)
        % Print an error message if the results are different
        if abs(res(i) - mat_res(i)) > 1.00e-5
            fprintf('%e\n', abs(res(i) - mat_res(i)));
            fprintf('The penta solver has a different solution than the backslash operator.\n');
        end
    end    
    
    file_name = sprintf('pent_sol_%d.txt', i);
    fileID = fopen(file_name,'w');
    fprintf(fileID, '%f\n', res);
end

%% Print the timing results to console.

% fprintf('Penta times: ');
% disp(penta_times);
% fprintf('Matlab times: ');
% disp(mat_times);

%% #3 Plot the timing results on a log log plot.

% Plot the timing for the penta and matlab solvers.
% plot(N, penta_times, N, mat_times);
log_N = logspace(-1, 4, length(N));
% loglog(log_N, penta_times, log_N, mat_times);
% title('Penta vs Matlab solver timing');
% xlabel('N');
% ylabel('time t (s)');
% legend('Penta solver', 'Matlab solver');

% Plot the L2 norm of the result of Ax = b for the pentadiagonal matrix.
% plot(N, Y);
% title('Plot of norm of Ax = b as N increases');
% legend('L2 norm of result of Ax = b');
% xlabel('N');
% ylabel('norm(Ax = b)');