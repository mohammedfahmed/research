% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Sidelobe control in collaborative
% beamforming via node selection," IEEE Trans. Signal Processing, accepted
% 2010.  
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Fig 10 : The CCDF of the INR for different values of K: M = 512, N = 256,
% L = 32, phi_0 = 0^o, and eta_thr = 10 dB.
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Copyright (c) 2010 Mohammed Ahmed and Sergiy Vorobyov
% Email: {mfahmed, vorobyov}@ece.ualberta.ca
% Electrical and Computer Engineering Department,
% University of Alberta, Edmonton, Alberta, Canada.
% All rights reserved.



clear;clc;
APsDirections = [0   -140   -70    70   140];
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

for K = 1:length(APsDirections) - 1
    
    tic
    
    for itr=1:100
        
        for k = 1:K
            GeneralWSN
            WSN.ChannelGain = exp(sqrt(WSN.v)*randn(length(WSN.phi),WSN.M));
            WSN = UniformWSN(WSN);
            
            WSN.APsDirections = [APsDirections(1:K+1)];
            WSN.K = length(WSN.APsDirections) - 1;
            WSN.TargetedAP = [k+1];
            WSN.UnTargetedAP = [1:k k+2:K+1];
            WSN = NodeSelection(WSN);
            
            BP_ = BeamPattern(WSN);
            
            I = find( WSN.phi == (WSN.APsDirections(1)));
            BP(k) = BP_(I);
            [K itr k toc]
        end
        
        INR(K,itr)=sum(BP)/WSN.NoisePower;
        
    end
    
    [INR_sim(K,:),CCDF_sim(K,:)] = myccdf(INR(K,:));
    
end



for K = 1:length(APsDirections) - 1
    
    CCDF_(K,:)=((((alpha*DataValues(k,:))).^(K-1)).*exp(-alpha*DataValues(k,:)))./(factorial(K-1));
end

if k==1
    CCDF(k,:)=CCDF_;
else
    CCDF(k,:)=sum(CCDF_);
end


save Ch4_Fig10
% 
% 
% 
% figure
% hold on
% box('on');
% grid on
% xlabel('INR \eta [dB]');
% ylabel('CCDF');
% 
% 
% plot(10*log10(INR_sim'),CCDF_sim','x','LineWidth',1)
% plot(10*log10(INR),Pr','-.','LineWidth',1)
% %plot(10*log10(x_'),Pr','-.','LineWidth',1)
% 
% legend('Simulations','Analytical');
% 
% 
% % for cntr=1:K
% %     plot(10*log10(xCCDF(cntr,1:40:end)),yCCDF(cntr,1:40:end),'kx','LineWidth',1)
% %     plot(10*log10(x_(cntr,:)),Pr(cntr,:),'k-.','LineWidth',1)
% % end
% % legend('Simulations','Analatical');
