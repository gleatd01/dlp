%% Example 2.10 - Our goal is to find the total system response to
%
% y[n] = 1.5y[n-1] - 0.56y[n-2] + 0.5x[n], n>=0
%
% with I.C. y[-1] = 2 and y[-2] = 1 and system input x[n] = u[n].
%
% We found in class that the total response is equal to:
%
% y[n] = (8.333 - 7.68(0.8)^n + 2.28(0.7)^n)u[n].
%
% Let's plot the total response for n = [0,40] both from the LCCDE and 
% obtained analytic solution to ensure they yield the same result.

n = 0:40;

%Compute Analytic Result
y1 = 8.333 - 7.68*(0.8).^n + 2.28*(0.7).^n;

%Compute LCCDE Result
ym1 = 2; ym2 = 1; %Initial Conditions
y2 = 0*y1;
x = 0*n + 1; %this is simply a sequence of all 1's since x[n]=u[n]
for k=1:41
    if(k==1)
        y2(k) = 1.5*ym1 - 0.56*ym2 + 0.5*x(k);
    elseif(k==2)
        y2(k) = 1.5*y2(k-1) - 0.56*ym1 + 0.5*x(k);
    else
        y2(k) = 1.5*y2(k-1) - 0.56*y2(k-2) + 0.5*x(k);
    end
end

fig = figure(1); movegui(fig,'northwest');
stem(n,y1); hold on;
plot(n,y2,'rx');
xlabel('$$n$$','interpreter','latex');
ylabel('$$h[n]$$','interpreter','latex');
legend('Analytic','LCCDE');