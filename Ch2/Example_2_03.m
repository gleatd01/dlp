%% Example 2.3
% Let's verify that the LTI network that we analytically determined is 
% indeed equivalent.
%
% h1[n] = 0.5delta[n]
% h2[n] = (0.5)^n u[n]
% h3[n] = (0.8)^n u[n]

n = [-20:20]; % time index vector

%Let's define each impulse response in the network separately. Then, we 
% will compute the equivalent network using the associative and
% distributive properties.
h1 = 0*n; h2 = 0*n; h3 = 0*n;
h1(21) = 0.5;
h2([0:20]+21) = 0.25.^([0:20]);
h3([0:20]+21) = 0.8.^([0:20]);
h = conv(h1+h2,h3,'same'); %Compute equivalent system computationally

%Now, let's define the equivalent system we determined analytically
he = 0*n;
he([0:20]+21) = 1.955*(0.8).^([0:20]) - 0.455*(0.25).^([0:20]);


%Let's plot both versions to verify that they are equivalent
fig = figure(1); movegui(fig,'northwest');
stem(n,h); hold on; 
plot(n,he,'x'); 
xlabel('$$k$$','interpreter','latex');
title('LTI Network Equivalence','interpreter','latex'); axis([-20 20 0 1.75]);
legend('Computationally','Analytically');