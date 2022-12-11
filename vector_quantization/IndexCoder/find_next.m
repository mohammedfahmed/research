%  [Next , Rep]=find_next(y,N)
% For  vector quantization
% Find the next most probable index
%
%   k       The vector length
%   N       The codebook size
% 
%
%  See also 

%   Copyright 2004 , Assiut University.
%   Dr. Hany Selim
%   Eng. Mohammad Farouk




function [Next , Rep]=find_next(y,N)


n=length(y);



for i=1:N
    clear I I_next
    I=find(y==i);
    I=I(I<n);
    I_next=I+1;
    h=hist(y(I_next),1:N);
    Len(i)=length(find(h~=0));
    [Rep(i,:) , Next(i,:)]=sort(h);
end

MaxLen=max(Len);

Next=fliplr(Next);
Next=Next(:,1:MaxLen);

Rep=fliplr(Rep);
Rep=Rep(:,1:MaxLen);

