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
    arr = ones(n);
    b = 1 / n^4 .* transpose(arr);
    tic
    mat_res = A\b;
    mat_times(i) = toc;
    mat_res(:, 1);
    
%     fprintf('Comparing penta solver to matlab solver:\n');
%     [res mat_res(:, 1)]
           
    
    file_name = sprintf('pent_sol_%d.txt', i);   
    fileID = fopen(file_name,'w');
    fprintf(fileID, '%f\n', res); 
end

penta_times
mat_times

% Plot the timing for the penta and matlab solvers.
% plot(N, penta_times, N, mat_times);
log_N = logspace(-1, 4, length(N));
loglog(log_N, penta_times, log_N, mat_times);
title('Penta vs Matlab solver timing');
xlabel('N');
ylabel('time t (s)');
legend('Penta solver', 'Matlab solver');

% Plot the L2 norm of the result of Ax = b for the pentadiagonal matrix.
% plot(N, Y);
% title('Plot of norm of Ax = b as N increases');
% legend('L2 norm of result of Ax = b');
% xlabel('N');
% ylabel('norm(Ax = b)');