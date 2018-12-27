h = 0.01;
x = [1;2;0;1];
xx = x';
t0 = 0;
tx = 20;
for t = t0 : h : (tx - h)
K1 = lorenzeq(t,x);
K2 = lorenzeq(t + h/2,x + h / 2 * K1);
K3 = lorenzeq(t + h/2,x + h / 2 * K2);
K4 = lorenzeq(t + h,x + h * K3);
x = x + h / 6 * (K1 + 2 * K2 + 2 * K3 + K4);
xx = [xx;x'];
end
t = 0 : h : 20;
plot(t,xx);
% figure;
% plot(xx(:,1),xx(:,2));
