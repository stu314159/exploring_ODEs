%% Exercise 1.6
clear
clc
close 'all'

%% get solution to exercise 1.1
xmax = 28;
N = chebop(0,xmax);
N.op = @(t,y) 0.3*diff(y,2) - (1-y^2)*diff(y) + y;
N.lbc = [1;0];

y = N\0; 

np = length(y);

fprintf('There are %d points.\n',...
    np);

figure(1)
plot(y,'.-','markersize',8);

[mval,mpos] = max(y,'local');

n_periods = length(mval);

est_pts_per_period = np/n_periods;
fprintf('Approximately %g points per period',...
    est_pts_per_period);