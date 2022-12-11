function WSN = OpportunisticNodeSelection(WSN)

I = find(rand(1,WSN.M) <= WSN.Flage_ActiveNodes.*WSN.ProbOfSel);
WSN.Index = I;
WSN.NoOfCollNodes = length(I);