%   [ y_coded,HL,BR,Percentage ]=eICVQ(y,CaseNo,N,Thr,L)
%
%   This file compresses the image vectors indices depending on one
%   of the follownig 2 cases
%
%   Case 1 :  ICVQ  "  The original method of Yu et al "
%
%   Case 2 :  eICVQ "  The proposed algorithm "
%
%   Inputs
%            y :  the input image indices
%       CaseNo :  select case 1,2,3,or 4
%          Thr :  The threashold betweensnding the normal index or the difference
%            N :  Code book size        
%            L :  The index map width
%



function [ y_coded,HL,BR,Percentage ]=eICVQ(y,CaseNo,N,Thr,L)


n=length(y);

switch CaseNo
    
    case 1    
        
        y_coded=ones(1,n)*(N+4);
        
        
        % coding the first L indices
        
        for i=2:L
            if   abs(y(i)-y(i-1))<=Thr
                y_coded(i)=N+3;    
            end
            
            if   (y(i)==y(i-1))
                y_coded(i)=N+1;    
            end
        end
        %-----------------------
        
        for i=(L+1):n 
            if   abs(y(i)-y(i-1))<=Thr
                y_coded(i)=N+3;    
            end
            if   (y(i)==y(i-L))
                y_coded(i)=N+2;    
            end
            if (y(i)==y(i-1))
                y_coded(i)=N+1;    
            end
        end
        
        
        %------------------------------------
        %------------------------------------
        
    case 2    
        
        
        y_coded=ones(1,n)*(N+5);
        
        % coding the first L indices
        
        for i=2:L
            if   abs(y(i)-y(i-1))<=Thr
                y_coded(i)=N+3;    
            end
            if   (y(i)==y(i-1))
                y_coded(i)=N+1;    
            end
        end
        
        %-----------------------
        
        for i=(L+1):n 
            if   abs(y(i)-y(i-L))<=Thr
                y_coded(i)=N+4;    
            end
            if   abs(y(i)-y(i-1))<=Thr
                y_coded(i)=N+3;    
            end
            
            if   (y(i)==y(i-L))
                y_coded(i)=N+2;    
            end
            if (y(i)==y(i-1))
                y_coded(i)=N+1;    
            end
        end
        
        
        %-----------------------
        %-----------------------
        
    case 3    
        
        y_coded=ones(1,n)*(N+5);
        
        % coding the first L indices
        
        for i=2:L
            if   abs(y(i)-y(i-1))<=Thr
                y_coded(i)=N+3;    
            end
            if   (y(i)==y(i-1))
                y_coded(i)=N+1;    
            end
        end
        
        %-----------------------
        
        for i=(L+1):n 
            if   abs(y(i)-y(i-L))<=Thr
                y_coded(i)=N+4;    
            end
            if   abs(y(i)-y(i-1))<=Thr
                y_coded(i)=N+3;    
            end
            
            if   (y(i)==y(i-L))
                y_coded(i)=N+2;    
            end
            if (y(i)==y(i-1))
                y_coded(i)=N+1;    
            end
        end
        
        
end





% Huffman

if CaseNo==1
    a=length(find(y_coded==N+1));
    b=length(find(y_coded==N+2));
    c=length(find(y_coded==N+3));
    d=length(find(y_coded==N+4));
    A=(a/n)*100;
    B=(b/n)*100;
    C=(c/n)*100;
    D=(d/n)*100;
    Percentage=[A B C D];
    BR=(    a*2   +   b*2     +   c*(2+log2(Thr)+1)   +     d*(2+log2(N))  )/(512*512);    
    HL=[2 2 2 2];
end


if CaseNo==2
    a=length(find(y_coded==N+1));
    b=length(find(y_coded==N+2));
    c=length(find(y_coded==N+3));
    d=length(find(y_coded==N+4));
    e=length(find(y_coded==N+5));
    A=(a/n)*100;
    B=(b/n)*100;
    C=(c/n)*100;
    D=(d/n)*100;
    E=(e/n)*100;
    Percentage=[A B C D E];
    HL=[2 3 1 4 4];
    BR=(    a*HL(1)   +   b*HL(2)     +   c*(HL(3)+log2(Thr)+1)   +   d*(HL(4)+log2(Thr)+1)   +   e*(HL(5)+log2(N))    )/(512*512);
end


if CaseNo==3
    a=length(find(y_coded==N+1));
    b=length(find(y_coded==N+2));
    c=length(find(y_coded==N+3));
    d=length(find(y_coded==N+4));
    e=length(find(y_coded==N+5));
    A=(a/n)*100;
    B=(b/n)*100;
    C=(c/n)*100;
    D=(d/n)*100;
    E=(e/n)*100;
    Percentage=[A B C D E];
    HL = hufflen(Percentage);
    HK = huffcode(HL);
    BR=(    a*HL(1)   +   b*HL(2)     +   c*(HL(3)+log2(Thr)+1)   +   d*(HL(4)+log2(Thr)+1)   +   e*(HL(5)+log2(N))  +5*8  )/(512*512);
end


