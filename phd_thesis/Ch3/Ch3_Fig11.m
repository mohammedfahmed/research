% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Collaborative beamforming for
% wireless sensor networks with Gaussian distributed sensor nodes," IEEE
% Trans. Wireless Communications, vol. 8, no. 2, pp.638-643, Feb. 2009.
% Fig 6: The upper bound on the sidelobe maximum with a given outage
% probability Prout for both uniform and Gaussian spatial distributions: N
% = 16.
%
%
%
% N : Number of sensor nodes
% R : Cluster radius
% V : Vairiance of the Gaussian spatial distribution corresponding to
% cluster radius R
% phi : The azimuth angle.
% P0 : Power level.
% P0dB : Power level in dB.
% P_out : Outage probability.


clear;clc
N = 16;
P0=1:20; % = 6:12 dB
P0dB=10*log10(P0);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P_out = 0.001;
R1 = P_out./(4*sqrt(pi*P0).*exp(-P0));
sigma1 = P_out./(8*sqrt(pi*P0).*exp(-P0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P_out=.01;
R2=P_out./(4*sqrt(pi*P0).*exp(-P0));
sigma2=P_out./(8*sqrt(pi*P0).*exp(-P0));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
P_out=.1;
R3=P_out./(4*sqrt(pi*P0).*exp(-P0));
sigma3=P_out./(8*sqrt(pi*P0).*exp(-P0));

save Ch3_Fig11
% %   - - - Ploting the figure - - -
% 
% %% Create figure
% figure1 = figure;
% 
% %% Create axes
% axes1 = axes(...
%     'XMinorGrid','on',...
%     'Parent',figure1);
% 
% %% Create semilogx
% semilogx1 = semilogx(...
%     R1,P0dB,...
%     'Color','k',...
%     'Parent',axes1,...
%     'DisplayName','Uniform');
% hold
% %% Create semilogx
% semilogx2 = semilogx(...
%     3*sigma1,P0dB,...
%     'LineStyle','-.',...
%     'Color','k',...
%     'Parent',axes1,...
%     'DisplayName','Gaussian');
% 
% %% Create semilogx
% semilogx3 = semilogx(...
%     R2,P0dB,...
%     'Color','k',...
%     'Parent',axes1);
% 
% %% Create semilogx
% semilogx4 = semilogx(...
%     3*sigma2,P0dB,...
%     'LineStyle','-.',...
%     'Color','k',...
%     'Parent',axes1);
% 
% %% Create semilogx
% semilogx5 = semilogx(...
%     R3,P0dB,...
%     'Color','k',...
%     'Parent',axes1);
% 
% %% Create semilogx
% semilogx6 = semilogx(...
%     3*sigma3,P0dB,...
%     'LineStyle','-.',...
%     'Color','k',...
%     'Parent',axes1);
% 
% %% Create legend
% legend1 = legend(...
%     axes1,{'Uniform','Gaussian'},...
%     'Location','SouthEast');
% 
% 
% xlabel(axes1,'Normalized Radius R/\lambda = 3 \sigma');
% ylabel(axes1,'Normalized Sidelobe Level NP_{0} [dB]');
% xlim(axes1,[1 1000]);
% grid on
% 
