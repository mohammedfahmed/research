function WSN = CBWeightDesign(WSN)

if  WSN.EqualCBWeights == 1
    WSN.Wnorm = ones(1,WSN.M);
    WSN.Wmax = sqrt((WSN.NoisePower*WSN.SNR)/((WSN.M*WSN.ProbOfSel*WSN.va)+(WSN.M*WSN.ProbOfSel*WSN.ma)^2));
elseif  WSN.EqualCBWeights == 0
    
    if WSN.CBWeightDesignOption==1
        WSN.Wnorm = WSN.Energy./WSN.Emax; 
    WSN.Wnorm = MyQuantizer(WSN.Wnorm,1,WSN.NoOfTransEnergyLevels);
    WSN.mWnorm = mean(WSN.Wnorm);
    WSN.vWnorm =  var(WSN.Wnorm);
    WSN.Wmax = sqrt((WSN.NoisePower*WSN.SNR)/((WSN.M*WSN.ProbOfSel*WSN.va*WSN.vWnorm)...
        +(WSN.M*WSN.ProbOfSel*WSN.ma*WSN.mWnorm)^2));
    elseif WSN.CBWeightDesignOption==2
        ChannelGainMax = max(WSN.ChannelGain);
        WSN.Wnorm = WSN.ChannelGain./ChannelGainMax; 
        WSN.Wnorm = MyQuantizer(WSN.Wnorm,1,WSN.NoOfTransEnergyLevels);
    WSN.vChannelGain =  var(WSN.ChannelGain);
    WSN.m4ChannelGain =  moment(WSN.ChannelGain,4);
    WSN.Wmax = sqrt((WSN.NoisePower*WSN.SNR*ChannelGainMax^2)/((WSN.M*WSN.ProbOfSel*WSN.m4ChannelGain)...
        +(WSN.M*WSN.ProbOfSel*WSN.vChannelGain)^2));
     end
    
    
end
WSN.W = WSN.Wmax*WSN.Wnorm;




%
% function WSN = CBWeightDesign(WSN)
%
% if  WSN.EqualCBWeights == 1
%     WSN.Wnorm = ones(1,WSN.M);
%     WSN.Wmax = sqrt((WSN.NoisePower*WSN.SNR)/((WSN.M*WSN.ProbOfSel*WSN.va)+(WSN.M*WSN.ProbOfSel*WSN.ma)^2));
% else
%
%     if WSN.CBWeightDesignOption==1
%         WSN.Wnorm = WSN.Energy./WSN.Emax;        %WSN.Wnorm = MyQuantizer(WSN.Energy,WSN.Emax,WSN.NoOfTransEnergyLevels);
%         WSN.mWnorm = mean(WSN.Wnorm);
%         WSN.vWnorm =  var(WSN.Wnorm);
%         WSN.Wmax = sqrt((WSN.NoisePower*WSN.SNR)/((WSN.M*WSN.ProbOfSel*WSN.va*WSN.vWnorm)+(WSN.M*WSN.ProbOfSel*WSN.ma*WSN.mWnorm)^2));
%
%
%     elseif WSN.CBWeightDesignOption==2
%         WSN.Wnorm = WSN.ChannelGain./max(WSN.ChannelGain); %WSN.Wnorm = MyQuantizer(WSN.ChannelGain./max(WSN.ChannelGain),1,WSN.NoOfTransEnergyLevels);
%         WSN.mWnorm = mean(WSN.Wnorm);
%         WSN.vWnorm =  var(WSN.Wnorm);
%         WSN.Wmax = sqrt((WSN.NoisePower*WSN.SNR)/((WSN.M*WSN.ProbOfSel*WSN.va*WSN.vWnorm)+(WSN.M*WSN.ProbOfSel*WSN.ma*WSN.mWnorm)^2));
%
%     elseif WSN.CBWeightDesignOption==3
%         vec = 1 - (WSN.ChannelGain./max(WSN.ChannelGain));
%             wline = wfill(vec, WSN.M*WSN.ProbOfSel, 1e-5);
%         WSN.mWnorm = mean(WSN.Wnorm);
%         WSN.vWnorm =  var(WSN.Wnorm);
%         WSN.Wmax = sqrt((WSN.NoisePower*WSN.SNR)/((WSN.M*WSN.ProbOfSel*WSN.va*WSN.vWnorm)+(WSN.M*WSN.ProbOfSel*WSN.ma*WSN.mWnorm)^2));
%     end
% end
% WSN.W = WSN.Wmax*WSN.Wnorm;
%
