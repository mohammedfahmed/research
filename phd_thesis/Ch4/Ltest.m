% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Sidelobe control in collaborative
% beamforming via node selection," IEEE Trans. Signal Processing, accepted
% 2010.  
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Fig 9 : The CCDF of the INR for different values of the threshold eta_thr: M
% = 512, N = 256, L = 32, phi_0 = 0^o, and phi_1 = 65^o.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Copyright (c) 2010 Mohammed Ahmed and Sergiy Vorobyov
% Email: {mfahmed, vorobyov}@ece.ualberta.ca
% Electrical and Computer Engineering Department,
% University of Alberta, Edmonton, Alberta, Canada.
% All rights reserved.



clear;clc;
L = [ 16 256];
INRthr = 10.^([10]/10);
INR = 10.^([-25:15]/10);
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

tic

for Lcntr=1:length(L)
    
    for itr = 1:1000
        
        GeneralWSN
        WSN.L = L(Lcntr);
        WSN = UniformWSN(WSN);
        WSN.ChannelGain = exp(sqrt(WSN.v)*randn(length(WSN.phi),WSN.M));
        
        WSN = NodeSelection(WSN);
        BP = BeamPattern(WSN);
        I = find( WSN.phi == WSN.APsDirections(WSN.UnTargetedAP));
        INR_sim_(itr) = BP(I)./WSN.NoisePower;
        
        [Lcntr itr]
    end
    
    meanINR_sim(Lcntr) = mean(INR_sim_);
    
    [INR_sim(Lcntr,:),CCDF_sim(Lcntr,:)] = myccdf(INR_sim_);
    
    % - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
    
    WSN.beta = (WSN.NoisePower*WSN.INRthr)/(2*WSN.vX);
    WSN.vI =   WSN.vX*(((1-(1+WSN.beta).*exp(-WSN.beta))  )./ (1-exp(-WSN.beta)) ) ;
    WSN.alpha = 1./(2*WSN.vI);
    
    CCDF(Lcntr,: ) = exp(-WSN.alpha.*WSN.NoisePower.*INR);
    
    
    
end

% 
figure
hold on
box('on');
grid on
xlabel('\eta [dB]');
ylabel('CCDF');
xlim([-25 15]);

plot(10*log10(INR_sim(1,:)),CCDF_sim(1,:),'rx')
plot(10*log10(INR),CCDF(1,:),'r-')
legend('Simulations','Analytical Expression','Location','southwest')


plot(10*log10(INR_sim),CCDF_sim,'kx')
plot(10*log10(INR),CCDF,'k-')
