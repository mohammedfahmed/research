% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Collaborative beamforming for
% wireless sensor networks with Gaussian distributed sensor nodes," IEEE
% Trans. Wireless Communications, vol. 8, no. 2, pp.638-643, Feb. 2009. 
% Fig 2: The mean of the array factor for both uniform and Gaussian spatial
% distributions: N = 16, sigma^2 = 1, R = 3 sigma.
% 
% 
% N : Number of sensor nodes.
% R : Cluster radius.
% V : Vairiance of the Gaussian spatial distribution corresponding to
% cluster radius R.
% phi : The azimuth angle.
% alpha : Defined for Uniform and Gaussian spatial distributions.
% m_x : The mean of the real part X of the array factor level at a given
% angle phi, defined for Uniform and Gaussian spatial distributions.

clc;clear;

V = 1;
N = 16;
phi = 0:.01:pi*(50/180);
R = 3*sqrt(V);
alpha_u = 4*pi*R*sin(phi/2);
alpha_g = 4*pi*sin(phi/2);

m_x_u = 2*(besselj(1,alpha_u)./alpha_u)*sqrt(N);
m_x_g = sqrt(N)*exp(-(alpha_g.^2)*V/2);


%   - - - Ploting the figure - - -

%% Create figure
figure1 = figure;
 
%% Create axes
axes1 = axes(...
  'FontName','Times New Roman',...
  'FontSize',30,...
  'Parent',figure1);
xlabel(axes1,'Angle \phi [degree]');
ylabel(axes1,'Variance');
grid(axes1,'on');
hold(axes1,'all');
 
%% Create plot
plot1 = plot(...
  phi*180/pi,m_x_u/sqrt(N),...
  'Color','b',...
  'LineStyle','-.',...
  'LineWidth',2,...
  'Parent',axes1,...
  'DisplayName','Uniform');
 
%% Create plot
plot2 = plot(...
  phi*180/pi,m_x_g/sqrt(N),...
  'LineWidth',2,...
  'Color','r',...
  'Parent',axes1,...
  'DisplayName','Gaussian');

%% Create legend
legend1 = legend(...
  axes1,{'Uniform','Gaussian'},...
  'FontName','Times New Roman',...
  'FontSize',30,...
  'Location','SouthEast');