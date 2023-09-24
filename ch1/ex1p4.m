clear
clc
close 'all'

%%
% 
%  Plot the solution $$y$$ of the problem of Exercise 1.2(i) and give its
%  maximum slope $$s=max_{t\in[-1,1]}y^{\prime}(t)$$.
% 
% 
% $$0.1y^{\prime \prime} + y y^{\prime} = y, t\in[-1,1], y(-1)=-2, y(1)=1$$
% 
%%
N = chebop(-1,1);
k = 0.1;
N.op = @(t,y) k*diff(y,2)+ y*diff(y,1) - y;
N.lbc = -2; N.rbc = 1;

y = N\0;

figure(1)
plot(y,'-sb','markersize',10,'linewidth',3);
title('Exercise 1.4');
grid on
xlabel('t');
ylabel('y(t)');

% get the derivative
y_prime = diff(y);

% get the maximum derivative
[mval,mpos] = max(y_prime);

fprintf('The maximum slope is %g at t = %g. \n',...
    mval,mpos);

%% Part 2
%%
% 
%  Observe how the slope changes as the coefficient k is varied from 1/10
%  to 1/80.
% 

kMin = 1/10; kMax = 1/80;
Nk = 15;
kSpace = linspace(kMin,kMax,Nk);

maxSlope = nan(1,Nk);

for i = 1:Nk
    % modify the operator with the new coefficient
    N.op = @(t,y) kSpace(i)*diff(y,2)+ y*diff(y,1) - y;

    % solve the boundary value problem
    y_tmp = N\0;

    % record the maximum slope
    [maxSlope(i),~] = max(diff(y_tmp));
end

%% Plot the results

figure(2)
plot(kSpace,maxSlope,'-b','linewidth',3);
title('Variation of Max Slope vs. K',...
    'FontSize',14,'FontWeight','bold');
grid on
xlabel('K','FontSize',12,'FontWeight','bold');
ylabel('Maximum y^{\prime} ','FontSize',12,'FontWeight','bold');


