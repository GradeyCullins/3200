f = @(x) 1 + sin(x).*cos(2.*x/3).*sin(4.*x);

N = [17 33 65 129 257 513];

actual_val = zeros(1, length(N));
for i = 1:length(N)
    actual_val(i) =     integral(f, 0, 2*pi);
end

mid_res = comp_mid(f, 0, 2*pi, N);
[trap_res, trap_err] = comp_trap(f, 0, 2*pi, N);
[simp_res, simp_err] = comp_simp(f, 0, 2*pi, N);
for i = 1:length(simp_err)
   simp_err(i) ;
end

trap_est_err = zeros(1, length(N));
for i = 1:length(N) - 1
    trap_est_err(i) = (4/3) * (-1 * trap_res(i + 1) + trap_res(i));
end

% Uncomment to print the err.
% for i = 1:length(N)
%    trap_est_err(i) ;
% end

simp_est_err = zeros(1, length(N));
for i = 1:length(N) - 1
    simp_est_err(i) = (4/3) * (-1 * simp_res(i + 1) + simp_res(i));
end

% Uncomment to print the err
% for i = 1:length(N)
%    simp_est_err(i);
% end

% Plot the Newton-Cotes convergence figure.
plot(N, mid_res, N, trap_res, N, actual_val)
plot(N, mid_res, '-ob')
hold on;
plot(N, trap_res, '-r', 'linewidth', 2)
hold on;
plot(N, simp_res, '-sm', 'linewidth', 2)
hold on;
plot(N, actual_val, '*k')
legend('Midpoint', 'Trapezoidal', 'Simpson', 'Real Value');
title('Convergence of Midpoint, Trapezoidal and Simpson');
xlabel('N');
ylabel('Error events');