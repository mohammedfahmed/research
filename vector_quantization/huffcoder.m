%    [HL,BR]=huffcoder(y,N)
%    This function finds the bit rate and the binary code length 
%    needed to code y using Huffman coder
function [HL,BR]=huffcoder(y,N)

h=hist(y,min(y):max(y));
H=h/sum(h);
HL = hufflen(H);
HK = HuffCode(HL);
BR=( sum(h.*HL)  + N*log2(N)  )/(512*512);

