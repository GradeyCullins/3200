% Script File: Taylor Example %
% For different n values  Taylor interpolant of f(x) = 1/(x) on [1,2]'
% is plotted.
%
  close all
 % x = linspace(1.95,2.050,100)'; 
  x = linspace(1.00,2.0,100)';
  y = ones(100,1)./(x);
  n=1000;
  for i = 1:100
     sum = 1.0;
     term = (x(i)-1.0); 
     for j = 1:n
         sum = sum - term;
         term = term * (-1.0*(x(i)-1));
     end 
     ytaylor(i) = sum;
     error(i) = y(i)- ytaylor(i);
   end
     plot(x,y,x,ytaylor,'*',x,error,'+')
     title(sprintf('Taylor approx to 1/x with  (n = %2.0f)',n))
  