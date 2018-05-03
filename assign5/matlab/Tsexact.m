function Texact = Tsexact(Tenv, T0, R, t)    
    Texact = Tenv + (T0 - Tenv) .* exp(-R.*t);    
end

