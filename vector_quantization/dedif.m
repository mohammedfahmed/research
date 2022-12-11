%  This function restores  the original indeces
%  from the differences between indeces  ( it is  DPCM decoder )

%
%
%   Copyright 2004 , Assiut University.
%   Dr. Hany Selim
%   Eng. Mohammad Farouk

function y=dedif(y_d)

n=length(y_d);

y(1)=y_d(1);

for i=2:n
y(i)=y_d(i)+y(i-1);    
end