function a = alpha_3(beta_z)
%   Provides a value for alpha_y1 given a value of beta_z.

%% Setup

n = 3.2;
omega = 1.0;
c = 3e8;
eps_r = n^2;

%% Work 

a = sqrt((beta_z^2)-((omega^2)*eps_r/c^2));
