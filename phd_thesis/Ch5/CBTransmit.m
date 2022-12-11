function WSN = CBTransmit(WSN)

%WSN.phi = WSN.APDirection;
%WSN.ChannelGain = WSN.ChannelGain(181,:);
WSN = CBWeightDesign(WSN);       % weights are designed on time at the befining of the rounds and never updated
TransmissionsCounter = 0;
WSN.Flage_3dB = 1;
WSN.Flage_ActiveNodes = (WSN.Energy >= WSN.Wmax^2);
WSN.SNRthr = WSN.SNR/2;
WSN.Flage_LifeWSN = sum(WSN.Flage_ActiveNodes)>=(0.1*WSN.M);

%--------------------------------------------------
while (WSN.Flage_3dB)&&(WSN.Flage_LifeWSN)
    
    TransmissionsCounter = TransmissionsCounter + 1;
    WSN = OpportunisticNodeSelection(WSN);
    NoOfCollNodes(TransmissionsCounter) = WSN.NoOfCollNodes;
    
    
    WSN = BeamPattern(WSN);
    SNR(TransmissionsCounter) = WSN.BP./WSN.NoisePower;
    
    WSN.Energy(WSN.Index) = WSN.Energy(WSN.Index) - WSN.W(WSN.Index).^2;
    WSN.Ei(TransmissionsCounter,:) = WSN.Energy;
    WSN.SumEi(TransmissionsCounter) = sum(WSN.Energy);
  
    %--------------------------------------------------
    WSN.Flage_ActiveNodes = (WSN.Energy >= WSN.Wmax^2);
    WSN.Flage_LifeWSN = ( sum(WSN.Flage_ActiveNodes)>=(0.1*WSN.M) );
    NoOfLifeNodes(TransmissionsCounter) = sum(WSN.Flage_ActiveNodes);
    %--------------------------------------------------
    if (TransmissionsCounter > 10)
        WSN.Flage_3dB = (mean(SNR(TransmissionsCounter-10:TransmissionsCounter)) >=  WSN.SNRthr);
    end
    %--------------------------------------------------
    
    
    
end

WSN.LifeTime = TransmissionsCounter;
WSN.NoOfCollNodes = NoOfCollNodes;
WSN.NoOfLifeNodes = NoOfLifeNodes;
WSN.AchievedSNR = SNR;
WSN.TotalNoOfTransmissions = TransmissionsCounter;
WSN.MeanSNR = mean(WSN.AchievedSNR);
WSN.RemainingEnergy = sum(WSN.Energy);