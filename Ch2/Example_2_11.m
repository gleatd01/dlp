%% Example 2.11 - Our goal is to find the total system response to
%
% y[n] = y[n-1] - 0.25y[n-2] + x[n], n>=0
%
% with I.C. y[-1] = 1 and y[-2] = 0 and system input x[n] = (1+(0.5)^n)u[n].
%
% We found in class that the total response is equal to:
%
% y[n] = (4 - (0.5)^n + n(0.5)^n + 0.5n^2(0.5)^n)u[n].
%
% Let's plot the total response for n = [0,40] both from the LCCDE and 
% obtained analytic solution to ensure they yield the same result.

n = 0:40;

%Compute Analytic Results
y1 = 4 - (0.5).^n + n.*(0.5).^n + 0.5.*n.^2.*(0.5).^n;

%Compute LCCDE Result
ym1 = 1; ym2 = 0; %Initial conditions
y2 = 0*y1;
x = 1 + (0.5).^n; % x[n] = u[n] + (0.5)^n*u[n]
for k=1:41
    if(k==1)
        y2(k) = ym1 - 0.25*ym2 + x(k);
    elseif(k==2)
        y2(k) = y2(k-1) - 0.25*ym1 + x(k);
    else
        y2(k) = y2(k-1) - 0.25*y2(k-2) + x(k);
    end
end

fig = figure(1); movegui(fig,'northwest');
stem(n,y1); hold on;
plot(n,y2,'rx');
xlabel('$$n$$','interpreter','latex');
ylabel('$$h[n]$$','interpreter','latex');
legend('Analytic','LCCDE');