% See the effect of the probability Pr of the Coll sensor nodes 

clear;clc;
Pr = [0.1:0.1:1];
SensorNodes_Initial.M = 500;
APs.SNR = 10^(30/10);
SensorNodes_Initial.Index = 1:SensorNodes_Initial.M;
APs.Direction = 0;
SensorNodes_Initial.R = 5;
SensorNodes_Initial = UniformWSN(SensorNodes_Initial);
SensorNodes_Initial.xError = 0*(rand(1,SensorNodes_Initial.M)-0.5)*2*SensorNodes_Initial.R;
SensorNodes_Initial.yError = 0*(rand(1,SensorNodes_Initial.M)-0.5)*2*SensorNodes_Initial.R;
SensorNodes_Initial.v  = 0.2;
SensorNodes_Initial.ChannelGain = exp(sqrt(SensorNodes_Initial.v)*randn(1,SensorNodes_Initial.M));
SumPi = zeros(10,3000);
SensorNodes_Initial.Power = 2*rand(1,SensorNodes_Initial.M);

for i = 1:length(Pr)
SensorNodes = SensorNodes_Initial;
SensorNodes.NoOfProbLevels = 1;
SensorNodes.NoOfTransPowerLevels = 8;
SensorNodes.ProbOfSel = Pr(i);
SensorNodes.Wmax = sqrt(APs.SNR/((SensorNodes.M*SensorNodes.ProbOfSel)^2));
%--------------------------------------------------
SensorNodes = BeamFormingTransmit(SensorNodes,APs);
i
SumPi(i,1:length(sum(SensorNodes.Pi'))) = sum(SensorNodes.Pi');
LifeTime(i) = SensorNodes.LifeTime_3dB ;
%LostPower(i) = 100*sum(Pi(SensorNodes.LifeTime_3dB,:))/500   ; 
RemainingPower(i) = 100*SensorNodes.RemainingPower/sum(SensorNodes.Power); 
MeanSNR(i) = mean(10*log10(SensorNodes.BP(1:SensorNodes.LifeTime_3dB))) ;
end




figure;
subplot(2,2,1)
plot(LifeTime)
ylabel('Life Time')
box('on');
grid('on');
hold('all');

subplot(2,2,2)
plot(RemainingPower)
ylabel('Remaining Power')
box('on');
grid('on');
hold('all');

subplot(2,2,3)
plot(MeanSNR)
ylabel('Mean SNR')
box('on');
grid('on');
hold('all');

subplot(2,2,4)
plot(SumPi')
ylabel('Total Power')
box('on');
grid('on');
hold('all');
