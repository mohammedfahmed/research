% This Figure shows the different strategies to assign Tr. power to different nodes
% Parameter Set-up
% I need to iterate so I can plot an average results
clear;clc;
GeneralWSN  % Make sure we start with the same WSN each time
WSN0 = WSN;
%------------------------ All of the nodes - Equal w (WORST)
clear WSN
WSN = WSN0;
WSN.ProbOfSel             = 1;
WSN.NoOfTransEnergyLevels = 1;
WSN.CBWeightDesignOption  = 1;
WSN.EqualCBWeights        = 1;
[WSN1] = CBTransmit(WSN);
1
%------------------------ All of the nodes - Different w - Energy (BEST)
clear WSN 
WSN = WSN0;
WSN.ProbOfSel             = 1;
WSN.NoOfTransEnergyLevels = 8;
WSN.CBWeightDesignOption  = 1;
WSN.EqualCBWeights        = 0;
[WSN2] = CBTransmit(WSN);
2
% %------------------------ All of the nodes - Different w - Channel
% clear WSN 
% WSN = WSN0;
% WSN.ProbOfSel             = 1;
% WSN.NoOfTransEnergyLevels = 8;
% WSN.CBWeightDesignOption  = 2;
% WSN.EqualCBWeights        = 0;
% [WSN3] = CBTransmit(WSN);
% 3
% 

% Other Cases
% %------------------------ 50% of the nodes - Equal w   (bad)
% %------------------------ 50% of the nodes - Different w - Energy  (average)
% %------------------------ 50% of the nodes - Different w - Channel

%No. of Coll nodes%------------------------%------------------------%------------------------%
% figure
% hold on
% plot(100*WSN1.NoOfCollNodes/WSN.M,'-k');
% plot(100*WSN2.NoOfCollNodes/WSN.M,'-.k');
% box('on');
% grid('on');
% hold('all');
% ylabel('Number of collaborative nodes')
% xlabel('Transmission round')
% legend('Equal weights','Different weights');

% Percentage of sensor nodes alive%------------------------%------------------------%------------------------%
figure1 = figure;
axes1 = axes('FontName','Times New Roman','FontSize',18,'Parent',figure1);
xlabel(axes1,'Transmission round');
ylabel(axes1,'Percentage of sensor nodes alive [%]');
grid(axes1,'on');
box(axes1,'on');
hold(axes1,'all');
plot(100*WSN1.NoOfLifeNodes/WSN.M,'-k','LineWidth',2,'Parent',axes1);
plot(100*WSN2.NoOfLifeNodes/WSN.M,'-.k','LineWidth',2,'Parent',axes1);
legend(axes1,'CB without power control','CB with power control','Location','SouthWest');

%SNR%------------------------%------------------------%------------------------%
figure1 = figure;
axes1 = axes('FontName','Times New Roman','FontSize',18,'Parent',figure1);
xlabel(axes1,'Transmission round');
ylabel(axes1,'SNR [dB]');
grid(axes1,'on');
box(axes1,'on');
hold(axes1,'all');
plot(10*log10(WSN1.AchievedSNR),'-k','LineWidth',2,'Parent',axes1);
plot(10*log10(WSN2.AchievedSNR),'-.k','LineWidth',2,'Parent',axes1);
legend(axes1,'CB without power control','CB with power control','Location','SouthWest');
ylim([17 20])

%Total remaining energy%------------------------%------------------------%------------------------%

figure1 = figure;
axes1 = axes('FontName','Times New Roman','FontSize',18,'Parent',figure1);
xlabel(axes1,'Transmission round');
ylabel(axes1,'Total remaining energy [J]');
grid(axes1,'on');
box(axes1,'on');
hold(axes1,'all');
plot(WSN1.SumEi,'-k','LineWidth',2,'Parent',axes1);
plot(WSN2.SumEi,'-.k','LineWidth',2,'Parent',axes1);
legend(axes1,'CB without power control','CB with power control','Location','SouthWest');
ylim([0 250])