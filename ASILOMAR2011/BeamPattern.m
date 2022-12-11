function WSN = BeamPattern(WSN)
%
% General beam pattern
% BP: The beampattern

x = WSN.x;
y = WSN.y;
a = WSN.ChannelGain;
Index = WSN.Index;
phi = WSN.phi*pi/180;
W = WSN.W;

AF = zeros(1,length(phi));

s0 = [ cos(WSN.APDirection*pi/180);    sin(WSN.APDirection*pi/180)   ]';

for cntr=1:length(phi)
    
    s = [cos(phi(cntr));         sin(phi(cntr))        ]';
    
    S = exp(...
        (1i*2*pi*(s*[...
        (x(Index)); ...
        (y(Index))])) - ...
        (1i*2*pi*(s0*[...
        x(Index);...
        y(Index)])) );
    
    S = S(:);
    
    AF(cntr) = (W(Index).*a(cntr,Index))*S;
    
end

WSN.BP = (abs(AF)).^2;
