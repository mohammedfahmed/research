% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Collaborative beamforming for
% wireless sensor networks with Gaussian distributed sensor nodes," IEEE
% Trans. Wireless Communications, vol. 8, no. 2, pp.638-643, Feb. 2009.
% Fig 3: The variance of X and Y for both uniform and Gaussian spatial
% distributions: N = 16, sigma^2 = 1, R = 3 sigma.
%
%
%
% N : Number of sensor nodes.
% R : Cluster radius.
% V : Vairiance of the Gaussian spatial distribution corresponding to
% cluster radius R.
% phi : The azimuth angle.
% alpha : Defined for Uniform and Gaussian spatial distributions.
% var_x : The variance of the real part X of the array factor level at a given
% angle phi, defined for Uniform and Gaussian spatial distributions.
% var_y : The variance of the imaginary part Y of the array factor level at a
% given angle phi, defined for Uniform and Gaussian spatial distributions.



clc;clear;

V = 1;
N = 16;

phi = 0:.01:pi*(50/180);
R = 3*sqrt(V);
alpha_u = 4*pi*R*sin(phi/2);
alpha_g = 4*pi*sin(phi/2);


var_x_u = 0.5*(1+(besselj(1,2*alpha_u)./alpha_u))-(2*(besselj(1,alpha_u)./alpha_u)).^2;
var_y_u = 0.5*(1-(besselj(1,2*alpha_u)./alpha_u));


var_x_g = (1/2)*(1+ exp(-((2*alpha_g).^2)*V/2) )-(1/1)*(exp(-(alpha_g.^2)*V/2)).^2;
var_y_g = (1/2)*(1- exp(-((2*alpha_g).^2)*V/2) );

phi_3dB_u=(180/pi)*2*asin(0.1286/R);
n0=ceil(0.25+((2/pi)*(((N-1)/pi)^(1/3))));
phi_SL_u=(180/pi)*2*asin((n0+0.25)/(4*R));

phi_SL_g=(180/pi)*2*asin(        (sqrt(log(N-1)))        /        (4*pi*sqrt(V))        );
phi_3dB_g=(180/pi)*2*asin(0.1988/R);


save Ch3_Fig8

% %   - - - Ploting the figure - - -
% 
% %% Create figure
% figure1 = figure;
% 
% %% Create axes
% axes1 = axes('Parent',figure1,...
%     'XTickLabel',{'0','10','20','30','40','50'},...
%     'XTick',[0 10 20 30 40 50],...
%     'YTickLabel',{'0','0.1','0.2','0.3','0.4','0.5','0.6'},...
%     'YTick',[0 0.1 0.2 0.3 0.4 0.5 0.6]);
% xlabel(axes1,'Angle \phi [degree]');
% ylabel(axes1,'Variance');
% grid(axes1,'on');
% hold(axes1,'all');
% ylim([0 0.6])
% 
% %% Create plot
% plot1 = plot(...
%     phi*180/pi,var_y_u,...
%     'Color','k',...
%     'LineStyle','-.',...
%     'Parent',axes1,...
%     'DisplayName','Uniform');
% 
% %% Create plot
% plot2 = plot(...
%     phi*180/pi,var_y_g,...
%     'Color','k',...
%     'Parent',axes1,...
%     'DisplayName','Gaussian');
% 
% %% Create plot
% plot3 = plot(...
%     phi*180/pi,var_x_u,...
%     'LineStyle','-.',...
%     'Color','k',...
%     'Parent',axes1);
% 
% %% Create plot
% plot4 = plot(...
%     phi*180/pi,var_x_g,...
%     'Color','k',...
%     'Parent',axes1);
% 
% 
% plot(ones(1,length([0:.2:.6]))*phi_SL_u, [0:.2:.6],'-.k')
% plot(ones(1,length([0:.2:.6]))*phi_3dB_u, [0:.2:.6],'-.k')
% plot(ones(1,length([0:.2:.6]))*phi_SL_g, [0:.2:.6],'-k')
% plot(ones(1,length([0:.2:.6]))*phi_3dB_g, [0:.2:.6],'-k')
% 
% 
% %% Create legend
% legend1 = legend(...
%     axes1,{'Uniform','Gaussian'},...
%     'Location','SouthEast');
% 
% box on
% 
% 
% 
% % Create ellipse
% annotation(figure1,'ellipse',...
%     [0.164285714285714 0.321428571428571 0.0349285714285714 0.0238095238095238]);
% 
% % Create ellipse
% annotation(figure1,'ellipse',...
%     [0.240285714285714 0.435714285714286 0.0543571428571429 0.0333333333333343]);
% 
% % Create ellipse
% annotation(figure1,'ellipse',...
%     [0.195642857142857 0.83809523809524 0.0650714285714286 0.0261904761904767]);
% 
% % Create textbox
% annotation(figure1,'textbox',...
%     [0.191428571428572 0.848047619047621 0.0946428571428571 0.0833333333333333],...
%     'String',{'\phi_{3dB}'},...
%     'FitBoxToText','off',...
%     'LineStyle','none');
% 
% % Create textbox
% annotation(figure1,'textbox',...
%     [0.355357142857142 0.844238095238098 0.141071428571429 0.0833333333333333],...
%     'String',{'\phi_{SideLobe}'},...
%     'FitBoxToText','off',...
%     'LineStyle','none');
% 
% % Create ellipse
% annotation(figure1,'ellipse',...
%     [0.356357142857143 0.828571428571429 0.116857142857143 0.038095238095238]);
% 
% % Create textbox
% annotation(figure1,'textbox',...
%     [0.123214285714285 0.284714285714286 0.0732142857142857 0.0904761904761905],...
%     'String',{'\sigma^2_x'},...
%     'LineStyle','none');
% 
% % Create textbox
% annotation(figure1,'textbox',...
%     [0.287857142857142 0.407571428571431 0.0732142857142857 0.0904761904761905],...
%     'String',{'\sigma^2_y'},...
%     'LineStyle','none');
% 
