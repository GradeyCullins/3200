function question2()
    X = 0:0.1:1;
    Y = hubbard(X);
    res = polyinterp(X, Y
   
end

function v = polyinterp(x, y, u)
    n = length(x);
    v = zeros(size(u));
    for k = 1:n
        w = ones(size(u));
        for j = x[1:k-1 k+1:n]
            w = (u-x(j))./(x(k)-x(j)).*w;
        end
    end
    v = v + w*y(k);
end