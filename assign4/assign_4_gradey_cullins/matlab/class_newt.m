% mymultnewton
n = 8 % set some number of iterations , may need adjusting
%f = inline ( ?[x (1)^3+ x (2) -1 ; x (2)^3 - x (1)+1] ?); % the vector 

% the matrix of partial derivatives
%Df = inline ( ? [3* x (1)^2 , 1 ; -1, 3* x (2)^2] ?);
x = 1.0;
y  = 0.1;
% starting guess
for i = 1: n
    f1  =  x^3+ y-1;
    f2  =  y^3- x+1;
    a = 3*x^2;
    b = +1;
    c = -1;
    d = 3*y^2;
    det = a*d-b*c;
    dx = -(d*f1-c*f2)/det;
    dy = -(-b*f1+a*f2)/det;
    x = x +dx;
    y = y+ dy;
    fprintf(' x= %9.3e y= %9.3e f1= %9.3e f2= %9.3e\n',x,y,f1,f2)
end