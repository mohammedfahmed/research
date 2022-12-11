% The input must be raster scanned

function [BR,y_coded,Nr]=soc(y,N)
n=length(y);



SO=[1 129 128 127 2 130 258:-1:354 126 3 131 259 387:-1:381 253 125];

y_coded(1)=0;


for i=2:n
    c=1;
    prev_index=0;
    
    for j=1:19
        index=i-SO(j);
        if c~=5
            if index > 0
                
                if y(i)==y(index)
                    y_coded(i)=c;
                    break
                else
                    
                    if index~=prev_index
                        c=c+1;
                        prev_index=index;
                    end
                    
                end
                
            end
            
        else
            y_coded(i)=0;
            break
        end
        
    end
    
end

Nr=length(find(y_coded==0));
BR=(    Nr*log2(N)+2*(n-Nr)+n  )/(512*512);