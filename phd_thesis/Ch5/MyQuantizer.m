function Y = MyQuantizer(X,Xmax,N)

% Here the quantizer is scalled to the levels from 0 to 1.  We have N
% levels and zero is not included
Y =(floor(((X./Xmax)+(1./N)).*N))./N;
Y(X>=Xmax)=1;