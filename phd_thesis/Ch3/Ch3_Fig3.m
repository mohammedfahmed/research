% Paper 1 , Fig 2 : title('Average beampattern of the uniform and
% Gaussian distributions, N = 16, \sigma^2 = 1, \tilde{R} = 3 \sigma')
% 
%

clc;clear;
V=1;
phi=-pi:.01:pi;
R=3*sqrt(V);

N=16;
[P_u,P_g]=BeamPattern_ug_eqn(N,R,phi);%[P_u,P_g]=bfwsn_ug_eqn(N,V,phi);
x1=phi*180/pi;
y1=10*log10(abs(P_u));
y2=10*log10(abs(P_g));


N=1024;
[P_u,P_g]=BeamPattern_ug_eqn(N,R,phi);%[P_u,P_g]=bfwsn_ug_eqn(N,V,phi);
y3=10*log10(abs(P_u));
y4=10*log10(abs(P_g));


%load Ch3_Fig3


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure1 = figure;
%% Create axes
% axes1 = axes('XTick',[-180 -120 -60 0 60 120 180],'Parent',figure1);
% xlim(axes1,[-180 180]);
legend('Uniform','Gaussian','Location','NorthEast')
xlabel('Angle \phi [degree]');
ylabel('Power [dB]');
box('on');
grid('on');
hold('all');
plot(x1,y1,'-.k','LineWidth',1)
plot(x1,y2,'k','LineWidth',1)


plot(x1,y3,'-.k','LineWidth',1)
plot(x1,y4,'k','LineWidth',1)
xlim([-10 60]);
legend('Uniform','Gaussian','Location','NorthEast')


 
% Create textbox
annotation(figure1,'textbox',...
    [0.692399999999999 0.262085714285715 0.166 0.08458],'String',{'N=1024'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.691814285714285 0.669690476190477 0.166 0.08458],'String',{'N=16'},...
    'FitBoxToText','off',...
    'LineStyle','none');

