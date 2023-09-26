%% Ex1p7
clear
clc
close 'all'

f = chebfun('1/(1.1-cos(pi*x))');
np_cheb = length(f);
fprintf('There are %d points in the Chebychev representation\n',...
    np_cheb);
figure(1)
plot(f,'.-','markersize',10);

fp = chebfun('1/(1.1-cos(pi*x))','trig');
figure(2)
plot(fp,'.-','markersize',10);

np_trig = length(fp);
fprintf('There are %d points in the Trig representation\n',...
    np_trig);

fprintf('The ratio is: %g \n',np_cheb/np_trig);