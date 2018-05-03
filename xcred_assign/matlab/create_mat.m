function A = create_mat(n)
A = zeros(n, n);

for i = 1:n
    row = zeros(1, n);
    if i == 1        
        row(1) = 9;
        row(2) = -4;
        row(3) = 1;        
    end
    
    if i == 2        
        row(1) = -4;
        row(2) = 6;
        row(3) = -4;
        row(4) = 1;         
    end
    
    if i > 2 && i < n - 1      
        row((i + 1) - 3) = 1;
        row((i + 2) - 3) = -4;
        row((i + 3) - 3) = 6;
        row((i + 4) - 3) = -4;
        row((i + 5) - 3) = 1;       
    end
    
    if i == n - 1
       row(n - 3) = 1;
       row(n - 2) = -4;
       row(n - 1) = 5;
       row(n) = -2;    
    end
    
    if i == n
       row(n - 2) = 1;
       row(n - 1) = -2;
       row(n) = 1;       
    end
    
    A(i, :) = row;
end
end

