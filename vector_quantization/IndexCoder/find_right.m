% Next=find_right(y,N,L)
% For  vector quantization
% Find the right most probable index
%
%   k       The vector length
%   N       The codebook size
% 
%
%  See also 

%   Copyright 2004 , Assiut University.
%   Dr. Hany Selim
%   Eng. Mohammad Farouk




function Right=find_right(y,N,L)


n=length(y);



for i=1:N
    clear I I_right
    I=find(y==i);
    I=I(I<n-(L-1));
    I_right=I+L;
    h=hist(y(I_right),1:N);
    Len(i)=length(find(h~=0));
    [h_sotred , Right(i,:)]=sort(h);
end

MaxLen=max(Len);

Right=fliplr(Right);
Right=Right(:,1:MaxLen);

