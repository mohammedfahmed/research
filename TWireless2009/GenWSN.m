% This function generats a WSN coordinates in 2D plan. the coordinates x
% and y follow a Uniform or Gaussian spatial distribution. 
% N : Number of sensor nodes
% R : Cluster radius 
% SpatialPDF : Spatial distribution. 
% V : Vairiance of the Gaussian spatial distribution corresponding to
% cluster radius R

function [x,y]=GenWSN(N,R,SpatialPDF)


V = (R/3)^2;

if SpatialPDF=='u'

    x = (rand(1,N)-0.5)*2*R; 
    y = (rand(1,N)-0.5)*2*R;

  % Remove the coordinates outside the cluster radius R.
    I=0;
    while length(I)~=0
        I = find(x.^2+y.^2>R^2);
        x(I) = (rand(1,length(I))-0.5)*2*R;
        y(I) = (rand(1,length(I))-0.5)*2*R;
    end

elseif SpatialPDF=='g'

    x = randn(1,N)*sqrt(V); 
    y = randn(1,N)*sqrt(V);

  
    % Remove the coordinates outside the cluster radius R.
    I=0;
    while length(I)~=0
        I = find(x.^2+y.^2>R^2);
        x(I) = randn(1,length(I))*sqrt(V);
        y(I) = randn(1,length(I))*sqrt(V);
    end
end