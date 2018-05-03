function [tout,yout] = ode23tx(F,tspan,y0,arg4,varargin)
    rtol = 1.e-3;
    atol = 1.e-6;
    plotfun = @odeplot;
    if nargin >= 4 && isnumeric(arg4)
        rtol = arg4;
    elseif nargin >= 4 && isstruct(arg4)
        if ~isempty(arg4.RelTol), rtol = arg4.RelTol; end
        if ~isempty(arg4.AbsTol), atol = arg4.AbsTol; end
        if ~isempty(arg4.OutputFcn), plotfun = arg4.OutputFcn; end
    end
    t0 = tspan(1);
    tfinal = tspan(2);
    tdir = sign(tfinal - t0);
    plotit = (nargout == 0);
    threshold = atol / rtol;
    hmax = abs(0.1*(tfinal-t0));
    t = t0;
    y = y0(:);
    
    % Make F callable by feval.
    
    if ischar(F) && exist(F)~=2
        F = inline(F,'t','y');
    elseif isa(F,'sym')
        F = inline(char(F),'t','y');
    end
    
    % Initialize output.
    
    if plotit
        feval(plotfun,tspan,y,'init');
    else
        tout = t;
        yout = y.';
    end
    
    % Compute initial step size.
    
    s1 = feval(F, t, y, varargin{:});
    r = norm(s1./max(abs(y),threshold),inf) + realmin;
    h = tdir*0.8*rtol^(1/3)/r;
%     h = 30;
    
    % The main loop.
    
    while t ~= tfinal
        
        hmin = 16*eps*abs(t);
        if abs(h) > hmax, h = tdir*hmax; end
        if abs(h) < hmin, h = tdir*hmin; end
        
        % Stretch the step if t is close to tfinal.
        
        if 1.1*abs(h) >= abs(tfinal - t)
            h = tfinal - t;
        end
        
        % Attempt a step.
        
        s2 = feval(F, t+h/2, y+h/2*s1, varargin{:});
        s3 = feval(F, t+3*h/4, y+3*h/4*s2, varargin{:});
        tnew = t + h;
        ynew = y + h*(2*s1 + 3*s2 + 4*s3)/9;
        s4 = feval(F, tnew, ynew, varargin{:});
        
        % Estimate the error.
        
        e = h*(-5*s1 + 6*s2 + 8*s3 - 9*s4)/72;
        err = norm(e./max(max(abs(y),abs(ynew)),threshold),inf) + realmin;
        
        % Accept the solution if the estimated error is less than the tolerance.
        
        if err <= rtol
            t = tnew;
            y = ynew;
            if plotit
                if feval(plotfun,t,y,'')
                    break
                end
            else
                tout(end+1,1) = t;
                yout(end+1,:) = y.';
            end
            s1 = s4;     % Reuse final function value to start new step.
        end
        
        % Compute a new step size.
        
        h = h*min(5,0.8*(rtol/err)^(1/3));
        
        % Exit early if step size is too small.
        
        if abs(h) <= hmin
            warning('Step size %e too small at t = %e.\n',h,t);
            t = tfinal;
        end
    end
    
    if plotit
        feval(plotfun,[],[],'done');
    end