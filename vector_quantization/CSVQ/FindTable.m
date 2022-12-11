%    [Table , y_coded,ma,mi]=FindTable(y,LL,N)
%    This function find the  " Table " that describes the CB vectors 
%    usage in each LLxLL block of the image indeces
%    The output coded indeces is the offset in that table

%
%
%   Copyright 2004 , Assiut University.
%   Dr. Hany Selim
%   Eng. Mohammad Farouk


% final


function [Table , y_coded,ma,mi]=FindTable(y,LL,N)

L=sqrt(length(y));
y_y=reshape(y,L,L);

% Finding the offset in indeces

for i=1:(L/LL)
    for j=1:(L/LL)
        
        y_y_i= y_y(    (i-1)*LL+1:i*LL ,(j-1)*LL+1:j*LL       );
        mi(i,j)=min(min(   y_y_i     ));
        ma(i,j)=max(max(   y_y_i     ));
        
        h=hist(y_y_i(:),1:N);
        Table(i,j,:)=(h~=0);
        adrs=find(h~=0);
        Ln(i,j)=length(adrs);
        
        for kk=1:Ln(i,j)
            y_y_i(y_y_i==adrs(kk))=kk;
        end
        
        y_y_coded(    (i-1)*LL+1:i*LL ,(j-1)*LL+1:j*LL       )=y_y_i;
        
    end
end

y_coded=y_y_coded(:)';