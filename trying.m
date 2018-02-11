%% Trying stuff out
clear
clc

%% Setup
clear figure
d=1e-6;
stop = 2000;
c=3e8;
lambda_0 = linspace(d/2, d/0.1, stop); % wavelength spectrum
omega = c*2*pi./lambda_0;%linspace(1e12, 2e12, 10);

m = 0;
n_1 = 1.0;
n_2 = 3.5;
n_3 = 3.2;

x_array = d./lambda_0;

for j = 1:stop
    BETA_1 = sqrt((omega(j)*n_1/c)^2);
    BETA_2 = sqrt((omega(j)*n_2/c)^2);
    BETA_3 = sqrt((omega(j)*n_3/c)^2);

    beta_0 = omega(j)/c;

    beta_z0 = linspace(BETA_3, BETA_2, stop); %(BETA_2-BETA_3)/2+BETA_3
    %beta_z0 = linspace(BETA_3
    % Condition for waveguide: beta_3 < beta_z < beta_2

    %% Cut-off frequency calc

    v_c = 1/(2*pi*d)*c/(sqrt(n_2^2-n_3^2))*tan(sqrt((n_3^2-n_1^2)/(n_2^2-n_3^2))+pi);


    %% Finding beta_z
    check = 0;
    for i=1:2000
        beta_z = beta_z0(i);
        %% alpha_1

        a_1 = sqrt(beta_z^2-BETA_1^2);

        %% beta_2

        b_2 = sqrt(BETA_2^2-beta_z^2);

        %% alpha_3

        a_3 = sqrt(beta_z^2-BETA_3^2);

        %% Function
        tan_part(i) = abs(tan(b_2*d));
        bz(i) = (((a_1 + a_3)/(b_2-(a_1*a_3/b_2))))-(tan(b_2*d));
        if i>2 && bz(i)*bz(i-1) < 0 && BETA_2>beta_z && beta_z>BETA_3
            check = check+1;
            y = bz(i)^-1;
            x = beta_z0(i)/beta_0;
            root_array(j) = x;
            %break
        end
        

    end
    
%     figure(j)
%     plot(beta_z0/beta_0, bz.^-1, '-r', x, y, 'ob')
%     % hold on
%     % plot(beta_z0/BETA_0, bz.^-1)
%     xlabel('{\beta}_z/{\beta}_y_3')
%     ylabel('RHS - LHS')
%     title('Figure 2 - RHS minus LHS based on transcendental equation')
%     close all;
    
end

% figure(1)
% plot(beta_z0/beta_0, bz.^-1, '-r', x, y, 'ob')
% % hold on
% % plot(beta_z0/BETA_0, bz.^-1)
% xlabel('{\beta}_z/{\beta}_y_3')
% ylabel('RHS - LHS')
% title('Figure 2 - RHS minus LHS based on transcendental equation')

% figure(2)
% plot(beta_z0/BETA_2, tan_part)
% xlabel('{\beta}_z/{\beta}_y_2')
% title('Figure 3 - tan({\beta}_y_2 d)')

figure(1)
plot(x_array, root_array, '-k')
axis([0 2 3.20 3.50])
title('Dispersion Curve for Asymmetric Slab')
xlabel('d/{\lambda}_0')
ylabel('{\beta}_z/{\beta}_0')
text(0.2, 3.3, 'TE_0')
text(0.75, 3.35, 'TE_1')
text(1.25, 3.35, 'TE_2')
text(1.5, 3.3, 'TE_3')