clear WSN
WSN.R = 2;
WSN.M = 500;
WSN.N = 500;
WSN = UniformWSN(WSN);
WSN.v  = 0.2;
WSN.m = 0;

WSN.phi = 0;
WSN.ChannelGain = exp(sqrt(WSN.v)*randn(1,WSN.M));

WSN.ma = exp(WSN.m+(WSN.v/2));
WSN.va = (exp(WSN.v)-1)*(exp(2*WSN.m+WSN.v));

WSN.Enorm = rand(1,WSN.M);
WSN.Emax = 1;
WSN.Energy = WSN.Emax*WSN.Enorm;
WSN.Emean = mean(WSN.Energy);

WSN.APDirection = 0;
WSN.SNR = 10^(20/10);
WSN.NoisePower = 0.05;

