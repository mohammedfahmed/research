% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Sidelobe control in collaborative
% beamforming via node selection," IEEE Trans. Signal Processing, accepted
% 2010.  
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Fig 7 : Average number of trials E {T} versus threshold eta_thr: M = 512,
% N = 256, phi_0 = 0^o, and phi_1 = 65^o. 
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Copyright (c) 2010 Mohammed Ahmed and Sergiy Vorobyov
% Email: {mfahmed, vorobyov}@ece.ualberta.ca
% Electrical and Computer Engineering Department,
% University of Alberta, Edmonton, Alberta, Canada.
% All rights reserved.



clear;clc;
L = [16 32 64 128 256];     
INRthr=10.^([0:5:30]./10);
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tic
for Lcntr = 1 : length(L)
    for INRcntr = 1:length(INRthr)
        for cntr = 1 : 10
            
            GeneralWSN
            WSN.L = L(Lcntr);
            WSN.INRthr = INRthr(INRcntr);
            
            WSN = UniformWSN(WSN);
            WSN.ChannelGain = exp(sqrt(WSN.v)*randn(length(WSN.phi),WSN.M));
            
            
            WSN = NodeSelection(WSN);
            NoOfTrials(Lcntr,INRcntr,cntr) = WSN.NoOfTrials;
            
            [Lcntr INRcntr  toc]
            
        end
    end
end

AveNoItr = mean(NoOfTrials,3);
p = 1- exp(-(( WSN.NoisePower*INRthr ))./(2*WSN.vX*ones(1,length(INRthr)))) ;
LL = L'*ones(1,length(INRthr));
pp = ones(length(L),1)*p;
AveNoItrExpression = WSN.N./(LL.*pp);


%save Ch4_Fig7




%% Create figure
figure1 = figure;

%% Create axes
axes1 = axes('Parent',figure1);
semilogy(10*log10(INRthr),AveNoItr(1,:),'xk','Parent',axes1);
hold
semilogy(10*log10(INRthr),AveNoItrExpression(1,:),'k','LineWidth',1,'Parent',axes1)
legend('Simulations','Analytical Expression');
semilogy(10*log10(INRthr),AveNoItr,'xk','Parent',axes1);
semilogy(10*log10(INRthr),AveNoItrExpression,'Color','k','LineWidth',1,'Parent',axes1);


xlabel(axes1,'\eta_{thr} [dB]');
ylabel(axes1,'Average number of trials E\{T\}');
ylim(axes1,[0 1000]);
grid(axes1,'on');
box('on');

% Create textbox
annotation(figure1,'textbox',...
    [0.491 0.495714285714287 0.100785714285714 0.114285714285716],...
    'String',{'L = 32'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.492428571428568 0.415714285714288 0.100785714285714 0.114285714285716],...
    'String',{'L = 64'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.49385714285714 0.583333333333336 0.100785714285714 0.114285714285716],...
    'String',{'L = 16'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.491357142857139 0.337619047619049 0.158642857142858 0.114285714285716],...
    'String',{'L = 128'},...
    'FitBoxToText','off',...
    'LineStyle','none');

% Create textbox
annotation(figure1,'textbox',...
    [0.491714285714285 0.246190476190478 0.138642857142857 0.114285714285716],...
    'String',{'L = 256'},...
    'FitBoxToText','off',...
    'LineStyle','none');