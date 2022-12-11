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


phi_3dB_u=(180/pi)*2*asin(0.1286/R);
n0=ceil(0.25+((2/pi)*(((N-1)/pi)^(1/3))));
phi_SL_u=(180/pi)*2*asin((n0+0.25)/(4*R));

phi_SL_g=(180/pi)*2*asin(        (sqrt(log(N-1)))        /        (4*pi*sqrt(V))        );
phi_3dB_g=(180/pi)*2*asin(0.1988/R);


 save Ch3_Fig7
% %   - - - Ploting the figure - - -
% 
% %% Create figure
% figure1 = figure;
%  
% %% Create axes
% axes1 = axes('Parent',figure1,...
%     'XTickLabel',{'0','10','20','30','40','50'},...
%     'XTick',[0 10 20 30 40 50],...
%     'YTickLabel',{'-0.2','0','0.2','0.4','0.6','0.8','1'},...
%     'YTick',[-0.2 0 0.2 0.4 0.6 0.8 1]);
% xlabel(axes1,'Angle \phi [degree]');
% ylabel(axes1,'Mean');
% grid(axes1,'on');
% hold(axes1,'all');
%  
% %% Create plot
% plot1 = plot(...
%   phi*180/pi,m_x_u/sqrt(N),...
%   'Color','k',...
%   'LineStyle','-.',...
%   'Parent',axes1,...
%   'DisplayName','Uniform');
%  
% %% Create plot
% plot2 = plot(...
%   phi*180/pi,m_x_g/sqrt(N),...
%     'Color','k',...
%   'Parent',axes1,...
%   'DisplayName','Gaussian');
% 
% plot(ones(1,length([-0.2:.2:1]))*phi_SL_u, [-0.2:.2:1],'-.k')
% plot(ones(1,length([-0.2:.2:1]))*phi_3dB_u, [-0.2:.2:1],'-.k')
% plot(ones(1,length([-0.2:.2:1]))*phi_SL_g, [-0.2:.2:1],'-k')
% plot(ones(1,length([-0.2:.2:1]))*phi_3dB_g, [-0.2:.2:1],'-k')
% 
% 
% 
% 
% %% Create legend
% legend1 = legend(...
%   axes1,{'Uniform','Gaussian'},...
%   'Location','NorthEast');
% ylim([-0.2 1])
% box on;
% % Create textbox
% annotation(figure1,'textbox',...
%     [0.355357142857142 0.584714285714287 0.141071428571429 0.0833333333333333],...
%     'String',{'\phi_{SideLobe}'},...
%     'LineStyle','none');
% 
% % Create ellipse
% annotation(figure1,'ellipse',...
%     [0.356357142857143 0.554761904761905 0.116857142857143 0.0500000000000011]);
% 
% % Create textbox
% annotation(figure1,'textbox',...
%     [0.193214285714286 0.264714285714287 0.0946428571428571 0.0833333333333333],...
%     'String',{'\phi_{3dB}'},...
%     'LineStyle','none');
% 
% % Create ellipse
% annotation(figure1,'ellipse',...
%     [0.193857142857143 0.257142857142857 0.0650714285714286 0.0261904761904767]);
% 
