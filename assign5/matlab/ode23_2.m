function y_out = ode23_2(dt)      
    T_s = 19;
    T_c = 84;
    r = 0.025;
    
    %     Texact = Tenv + (T0 - Tenv) .* exp(-R.*t);    
    F = @(t, y) T_s + (T_c - T_s) * exp (-r * t);
        
    t = 0:dt:300;
    
    num_steps = length(t);
        
    y_out = zeros(1, num_steps);
    err = zeros(1, num_steps);
    
    y_out(1) = T_c;
    
    
    for i = 1:num_steps-1
       s_1 = feval(F, t(i), y_out(i));
       s_2 = feval(F, t(i) + dt/2, y_out(i) + (dt/2 * s_1) * s_1);
       s_3 = feval(F, t(i) + (3/4) * dt, y_out(i) + (3/4) * dt * s_2);
       y_out(i + 1) = y_out(i) + dt/9 * (2 * s_1 + 3 * s_2 + 4 * s_3);
       s_4 = feval(F, t(i + 1), y_out(i + 1));
       err(i + 1) = dt/72 * (-5 * s_1 + 6 * s_2 + 8 * s_3 - 9 * s_4);       
    end
end

