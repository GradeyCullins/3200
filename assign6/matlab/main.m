%% Heat equation in 1-D

figure(1)

N = [8 16 32 64];

for k = 1:length(N)
    L = 0.025;
    t_tot = 5;
    n = N(k);
    dx = L / n;
    x = 1:n;
    dt = 0.01;
    t = 0:dt:t_tot;
    alpha = 0.035;
    T0 = 60 * ones(1,n);
    T1 = 20 * ones(1,n);
    T0(1) = 20;
    T0(end) = 20;
    for j=1:length(t)
        for i=2:n-1
            T1(i)=T0(i)+alpha*(T0(i+1)-2*T0(i)+T0(i-1));
        end
        T0=T1;
    end
    plot(T1)   
    hold on;
end

title('Heat equation as N increases');
legend('N = 8', 'N = 16', 'N = 32', 'N = 64');
xlabel('N');
ylabel('temperature');

figure(2);

N = 32;
Dt = [0.001 0.01 0.1];
for k = 1:length(Dt)
    L = 0.025;
    t_tot = 5;
    n = N;
    dx = L / n;
    x = 1:n;
    dt = Dt(k)
    t = 0:dt:t_tot;
    alpha = 0.035;
    T0 = 60 * ones(1,n);
    T1 = 20 * ones(1,n);
    T0(1) = 20;
    T0(end) = 20;
    for j=1:length(t)
        for i=2:n-1
            T1(i)=T0(i)+alpha*(T0(i+1)-2*T0(i)+T0(i-1));
        end
        T0=T1;
    end
    plot(T1)
    hold on;
end

title('Heat equation as dt increases');
legend('dt = 0.001', 'dt = 0.01', 'dt = 0.1');
xlabel('N');
ylabel('temperature');

%% Laplace

% Solving the 2-D Laplace's equation by the Finite DifferenceMethod
% Numerical scheme used is a second order central difference in space (5-point difference)

NX = [4 8 16 32 64 128 256];
NY = [4 8 16 32 64 128 256];
% NX = 4;
% NY = 4;

% Tolerance.
tol = 0.01

C = zeros(1, length(NX));

for k = 1:length(NX)
    %Specifying parameters
    %     nx=60;                           %Number of steps in space(x)
    %     ny=60;                           %Number of steps in space(y)
    nx = NX(k);
    ny = NY(k);
    niter=10000;                     %Number of iterations
    dx=2/(nx-1);                     %Width of space step(x)
    dy=2/(ny-1);                     %Width of space step(y)
    x=0:dx:2;                        %Range of x(0,2) and specifying the grid points
    y=0:dy:2;                        %Range of y(0,2) and specifying the grid points
      
    % Calculate C for the convergence condition.
    if k > 1
        C(k) = abs(x(k+1) - x(k)) / abs(x(k) - x(k-1));   
    end   
    
    
    %Initial Conditions
    p=zeros(ny,nx);                  %Preallocating p
    pn=zeros(ny,nx);                 %Preallocating pn
    
    
    %Boundary conditions
    p(:,1)=0;
    p(:,nx)=y;
    p(1,:)=0;
    p(ny,:)=x;
    
    
    %Explicit iterative scheme with C.D in space (5-point difference)
    j=2:nx-1;
    i=2:ny-1;
    for it=1:niter
        pn=p;
        p(i,j)=((dy^2*(pn(i+1,j)+pn(i-1,j)))+(dx^2*(pn(i,j+1)+pn(i,j-1))))/(2*(dx^2+dy^2));
        %Boundary conditions (Neumann conditions)
        p(:,1)=0;
        p(:,nx)=y;
        p(1,:)=0;
        p(ny,:)=x;  
        if (C(k) / (1 - C(k))) * abs(x(k+1) - x(k)) <= tol
            break
        end
        
    end
    
    p
    
    %Plotting the solution
    
%     surf(x,y,p,'EdgeColor','none');
%     shading interp
%     title({'2-D Laplace''s equation';['{\itNumber of iterations} = ',num2str(it)]})
%     xlabel('Spatial co-ordinate (x) \rightarrow')
%     ylabel('{\leftarrow} Spatial co-ordinate (y)')
%     zlabel('Solution profile (P) \rightarrow')
    
end

