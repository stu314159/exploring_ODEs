% eq_3p3.m

clear
clc
close 'all'

%% Chebfun solution
N = chebop(0,20); N.lbc = 0; 
N.op = @(t,y) diff(y) - 0.5*log(1-abs(y))*y;
rhs = chebfun('3*cos(t)',[0,20]);
y_cheb = N\rhs; 

figure(1);
plot(y_cheb,'linewidth',2)
title('Example 3.3 Nonlinear damping by a logrithmic barrier',...
    'FontSize',12,'FontWeight','bold');
axis([0 20 -4 4]);
grid on
set(gca,'FontSize',10,'FontWeight','bold');

%% With New MATLAB Framework

F = ode(ODEFcn = @(t,y) 3*cos(t)+0.5*log(1-abs(y)).*y,...
    InitialTime=0,InitialValue=0);
F.Solver = "ode89";
sol = solve(F,0,20);

figure(2)
plot(sol.Time,sol.Solution,"-o",...
    'linewidth',2);
title('Example 3.3 Nonlinear damping by a logrithmic barrier',...
    'FontSize',12,'FontWeight','bold')
axis([0 20 -4 4]);
grid on
set(gca,'FontSize',10,'FontWeight','bold');
