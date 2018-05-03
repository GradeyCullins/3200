function res = solve_penta_sys(n)

    A = create_mat(n);
    arr = ones(n);
    b = 1 / n^4 .* transpose(arr);

    res = pentsolve(A, b);                       
end