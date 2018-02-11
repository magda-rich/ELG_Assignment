function bz = finding_bz(d, omega, beta_z, m)
%   Designed to find the value of the transcendental equation LHS-RHS for a
%   given beta_z.  
%   INPUTS:
%       d - the thickness of a slab
%       omega - the initial wavelength
%       beta_z - primary variable
%       m - the order of the TE mode

%% Setup

c=3e8;

n_1 = 1.0;
n_2 = 3.5;
n_3 = 3.2;

BETA_1 = sqrt((omega*n_1/c)^2);
BETA_2 = sqrt((omega*n_2/c)^2);
BETA_3 = sqrt((omega*n_3/c)^2);

%% alpha_1

a_1 = sqrt(beta_z^2-BETA_1^2);

%% beta_2

b_2 = sqrt(BETA_2^2-beta_z^2);

%% alpha_3

a_3 = sqrt(beta_z^2-BETA_3^2);

%% Function

bz = ((a_1 + a_3)/(b_2-(a_1*a_3)/b_2))-tan(b_2*d);
bz = bz^-1;