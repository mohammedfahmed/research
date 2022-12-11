%   This file Decodes the input indeces into the real indeces
%   We have one of the follownig 3 cases
%   Case 1 :  without Table
%   Case 2 :  "Next" Table
%   Case 3 :  "Right" Table
%   Case 4 :  "Most" Table
%

%  y=IndexDecoder(y_coded,Table,CaseNo)


function y=IndexDecoder(y_coded,Table,CaseNo)


n=length(y_coded);
N=max(y_coded)-2;

y(1:L)=y_coded(1:L);

switch CaseNo
    
%-------------------------------------------------------------------
case 1
    
    
    for i=(L+1) : n
        if y_coded(i)==N+1
            y(i)=y(i-L);
        end
        if y_coded(i)==N+2
            y(i)=y(i-1);
        end
        if (y_coded(i)~=N+1) & (y_coded(i)~=N+2)
            y(i)=y_coded(i);
        end
    end
%-------------------------------------------------------------------
case 2
    Next1=Table;
    for i=(L+1) : n
        if y_coded(i)==N+1
            y(i)=Next1(y(i-1));
        end
        if y_coded(i)==N+2
            y(i)=y(i-L);
        end
        if (y_coded(i)~=N+1) & (y_coded(i)~=N+2)
            y(i)=y_coded(i);
        end
    end
%-------------------------------------------------------------------
case 3    
    Right1=Table;
    for i=(L+1) : n
        if y_coded(i)==N+1
            y(i)=Right1(y(i-L));
        end
        if y_coded(i)==N+2
            y(i)=y(i-1);
        end
        if (y_coded(i)~=N+1) & (y_coded(i)~=N+2)
            y(i)=y_coded(i);
        end
    end
%-------------------------------------------------------------------
case 4   %  some thing wrong here
    Most1=Table;
    for i=(L+1) : n
        if y_coded(i)==N+1
            y(i)=Most1(y(i-(L)));
        end
        if y_coded(i)==N+2
             y(i)=Most1(y(i-1));
        end
        if (y_coded(i)~=N+1) & (y_coded(i)~=N+2)
            y(i)=y_coded(i);
        end
    end
    
    
end
