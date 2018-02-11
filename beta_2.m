function b = beta_2(beta_z)
%   Provides a value for alpha_y1 given a value of beta_z.

%% Setup

n = 3.5;
omega = 1.0;
c = 3e8;
eps_r = n^2;

%% Work 

b = sqrt(((omega^2)*eps_r/c^2)-(beta_z^2));