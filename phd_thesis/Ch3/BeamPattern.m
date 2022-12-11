function BP = BeamPattern(x,y,DirectionOfBS,phi)
% Paper: M.F.A. Ahmed and S.A. Vorobyov, "Collaborative beamforming for
% wireless sensor networks with Gaussian distributed sensor nodes," IEEE
% Trans. Wireless Communications, vol. 8, no. 2, pp.638-643, Feb. 2009.
% 
% 
% BP: The beampattern
% AF: Array factor
% N : Number of sensor nodes
% R : Cluster radius
% V : Vairiance of the Gaussian spatial distribution corresponding to
% cluster radius R
% phi : The azimuth angle.


N  = length(x);
AF = zeros(1,length(phi));

s0 = [   cos(DirectionOfBS)   ;     sin(DirectionOfBS)    ]';

for cntr = 1:length(phi)
    
    s = [  cos(phi(cntr))  ;        sin(phi(cntr))        ]';
    
    V = exp(...
        (1i*2*pi*(s*[...
        (x); ...
        (y)])) - ...
        (1i*2*pi*(s0*[...
        x;...
        y])) );
    V = V(:);
    
    AF(cntr) = (1/N)*sum(V);
    
end

BP = (abs(AF)).^2;
