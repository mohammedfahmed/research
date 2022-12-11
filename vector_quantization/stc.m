function [BR,y_coded]=stc(y,N)

n=length(y);

L=sqrt(n);


y_y=reshape(y,L,L);
y_y1=y_y';
y=y_y1(:);
y=y';



SO=[ ];

y_coded=zeros(1,n);
y_coded(1)=log2(N);

memser=zeros(1,16);


for i=2:L
    
    index=i-SO;
    index=index(index>0);
    dif=[index 0]-[0 index];
    I=find(dif==0);
    index(I)=0;
    index=index(index>0);
    if length(index)>16
        memser=[y(index(1:16))];
    else
        memser=[y(index)];
    end
    
    
    if (i-1)>0
        L_flage=y_coded(i-1);
    else
        L_flage=log2(N);
    end
    if (i-128)>0
        U_flage=y_coded(i-128);
    else
        U_flage=log2(N);
    end
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    