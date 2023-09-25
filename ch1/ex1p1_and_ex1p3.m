%% Chapter 1 exercises

clear
clc
close 'all'

%% Problem 1.1
fprintf('\n\n Problem 1.1 \n');

xmax = 200;
N = chebop(0,xmax);
N.op = @(t,y) 0.3*diff(y,2) - (1-y^2)*diff(y) + y;
N.lbc = [1;0];

y = N\0; 
figure(1);
plot(y);

[mval,mpos] = max(y,'local');
maxima = table(mval,mpos);
disp(maxima);
[minval,minpos] = min(y,'local');
minima = table(minval,minpos);
disp(minima);

%% Problem 1.3
fprintf('\n\n Problem 1.3 \n');
k = 0.002;
A = chebop(-5,5);
A.op = @(t,y) k*diff(y,2)-t*y;
A.lbc = 1; A.rbc = 0;
figure(2);
y = A\0;
plot(y);

[maxval,maxpos] = max(y);
fprintf('maximum of %g at t = %g \n',...
    maxval,maxpos);

% repeat for a range of values of k.
k = 0.002:0.0001:0.040;
n = length(k);
maxvals = nan(1,n);
maxposs = nan(1,n);
for i = 1:n
    A.op = @(t,y) k(i)*diff(y,2)-t*y;
    y = A\0;
    [maxvals(i),maxposs(i)] = max(y);
end

figure(3)
plot(k,maxvals);
