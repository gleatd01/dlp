%% Example 2.8
%
% y[n] = x[n] - 0.25y[n-2], n>=0
%
% with I.C. y[-1] = 0 and y[-2] = 0.
%
% We determined the analytic impulse response in class. Let's plot the
% impulse response from both the LCCDE and determined analytic form.

n = 0:40;

%Compute Analytic Result
h1 = (0.5).^n.*cos( (pi/2).*n );

%Compute LCCDE Result
h2 = 0*n;
hm1 = 0; hm2 = 0; %Zero initial conditions
x = 0*n; x(1) = 1; %Create impulse
for k=1:41
    if(k==1)
        h2(k) = x(k) - 0.25*hm2;
    elseif(k==2)
        h2(k) = x(k) - 0.25*hm1;
    else
        h2(k) = x(k) - 0.25*h2(k-2);
    end
end

fig = figure(1); movegui(fig,'northwest');
stem(n,h1); hold on;
plot(n,h2,'rx');
xlabel('$$n$$','interpreter','latex');
ylabel('$$h[n]$$','interpreter','latex');
legend('Analytic','LCCDE');