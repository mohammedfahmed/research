%  This function find the difference between
%  indeces  ( it is  DPCM )

%
%
%   Copyright 2004 , Assiut University.
%   Dr. Hany Selim
%   Eng. Mohammad Farouk



function y_d=dif(y)

y_d=[y 0]-[0 y];
y_d=y_d(1:end-1);
