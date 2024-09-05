%For Example 2.2
% x[n] = a^n*u[n]
% h[n] = u[n]-u[n-N]
% h[n-k] = u[n-k]-u[n-k-N]
% Let's assume that a = 0.5 and N = 5

n = [-20:20]; % time index vector
a = 0.5; N = 5;
x = 0*n; x([0:20]+21) = a.^([0:20]);
h = 0*n; h([0:N-1]+21) = 1
y = conv(h,x,'same'); % compute y[n] via convolution command

y2 = 0*n;
y2([0:N-1]+21) = (1-a.^([1:N]))./(1-a); 
y2([N:20]+21) = (a.^([N:20]-N+1)-a.^(N+1:21))./(1-a);

fig = figure(1); movegui(fig,'northwest');
subplot(511); stem(n,x,'filled'); xlabel('$$k$$','interpreter','latex'); title('$$x[k]$$','interpreter','latex'); axis([-20 20 0 1.5]);
subplot(512); stem(n,h,'filled'); xlabel('$$k$$','interpreter','latex'); title('$$h[k]$$','interpreter','latex'); axis([-20 20 0 1.5]);
subplot(513); stem(n,-h,'filled'); xlabel('$$k$$','interpreter','latex'); title('$$h[k]$$','interpreter','latex'); axis([-20 20 0 1.5]);

subplot(514); stem(n,y,'filled'); xlabel('$$n$$','interpreter','latex'); title('$$y[n]=x[n]*h[n]$$ using $${\tt conv}$$ command','interpreter','latex'); axis([-20 20 0 3]);
subplot(515); stem(n,y2,'filled'); xlabel('$$n$$','interpreter','latex'); title('$$y[n]=x[n]*h[n]$$ computed analytically','interpreter','latex'); axis([-20 20 0 3]);