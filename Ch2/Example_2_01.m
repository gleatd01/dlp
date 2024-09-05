%For Example 2.1
% x[n] = 2{u[n]-u[n-11]}
% h[n] = u[n+1]-u[n-3]
% Let's define these signals and compute the convolution using the MATLAB
% convolution function, conv:

%Note: MATLAB array index values must be > 0. So, with n defined from
%-20:20 below, notice that index n(21) is where the value
%0 is. So, in the definitions below you will see that I offset values of
%the index by 21 to account for this.

n = [-20:20]; % time index vector
[n_row,n_col] = size(n); 
n_shift = ceil(n_col/2); % Calculate the 21 shift instead of manually inputing it see lines 9-10
x = 0*n; x( [0:10]+n_shift) = 2; %define sequence x[n] Guessing the 2 is the leading 2 seen on line 2 not sure why -11 turns into 10, I could understand 11
h  = 0*n; h( [-1:2]+n_shift) = 1; %define h[n] Guessing same as above for leading 1 as seen on line 3, -1 makes sense for +1 and the 2 matchs about for 10 for 11
y = conv(h,x,'same'); % compute y[n] via convolution command


%NOTE: The 'same' parameter truncates the convolution to have the same
%number of samples as the longest input sequence. Normally a convolution
%results in a sequence of length M+N-1 (length of first sequence plus
%length of second sequence + 1). We pad our seqeuence with sufficient zeros
%in order to ensure that the results are captured in our truncated
%sequence.

%Now, let's create y[n] using our analytical results and compare that to
%our results from the conv command:
y2 = 0*n;                       % sets y2 to zero this covers n <-1 and n > 12
y2( [-1:2]+21) = 2*([-1:2])+4;  %-1 <= n < 2
y2( [3:9]+21) = 8;              %3 <= n <= 9
y2( [10:12]+21) = 26-2*([10:12]); % 10 <= n <= 12

fig = figure(1); movegui(fig,'northwest');
subplot(411); stem(n,x,'filled'); xlabel('$$k$$','interpreter','latex'); title('$$x[k]$$','interpreter','latex'); axis([-20 20 0 3]);
subplot(412); stem(n,h,'filled'); xlabel('$$k$$','interpreter','latex'); title('$$h[k]$$','interpreter','latex'); axis([-20 20 0 3]);
subplot(413); stem(n,y,'filled'); xlabel('$$n$$','interpreter','latex'); title('$$y[n]=x[n]*h[n]$$ using $${\tt conv}$$ command','interpreter','latex'); axis([-20 20 0 10]);
subplot(414); stem(n,y2,'filled'); xlabel('$$n$$','interpreter','latex'); title('$$y[n]=x[n]*h[n]$$ computed analytically','interpreter','latex'); axis([-20 20 0 10]);