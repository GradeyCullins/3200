function test_LU_factorization()
    
% Matrix A.
A = [4 1 -2; 4 4 -3; 8 4 0];

% Matrix b.
b = [0; 3; 16];

% Solution of Ax = b.
x_real = A\b;

% Results of manual LU factorization.
U = [4 1 -2; 0 3 -1; 0 0 14/3];
L = [1 0 0; 1 1 0; 2 2/3 1];

% Find x using LU factorization.
y = L\b;
x = U\y;

% Ensure LU factorization found x same as solving Ax = b.
assert(isequal(x_real, x))

% Matrix B.
B = [4 1 -2; 4 4 -3; 8 4 2];

% Results of manual LU factorization of B.
L_b = [1 0 0; 1 1 0; 2 2/3 1];
U_b = [4 1 -2; 0 3 -1; 0 0 20/3];

% Verify results of LU factorization.
LU_b = L_b * U_b;
assert(isequal(LU_b, B));

% Matrix C.
C = [2 1 -2; 4 4 -3; 8 4 4];

% Results of manual LU factorization of C.
L_c = [1 0 0; 2 1 0; 4 0 1];
U_c = [2 1 -2; 0 2 1; 0 0 12];

% Verify results of LU factorization
LU_c = L_c * U_c;
assert(isequal(LU_c, C)); 

end