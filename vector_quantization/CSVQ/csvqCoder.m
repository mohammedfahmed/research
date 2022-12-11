%  [ y_coded , Table , BR]=csvqCoder(y,LL,Df,N)

% final

function [ y_coded , Table , BR]=csvqCoder(y,LL,Df,N)

n=length(y);
L=sqrt(n);

%Find table
[Table , y_coded,ma,mi]=FindTable(y,LL,N);
N1=max(y_coded);

%Huffman coding
if Df==1
% find the differences in y_coded
y_coded_diff=dif(y_coded);
[HL,yBR]=huffcoder(y_coded_diff,2*N1);
else
[HL,yBR]=huffcoder(y_coded,N1);
end


TableBR=( sum(sum(ma-mi)) +  2*log2(N)*((L/LL)^2)  )/ (512*512)  ;

BR = yBR + TableBR    ;