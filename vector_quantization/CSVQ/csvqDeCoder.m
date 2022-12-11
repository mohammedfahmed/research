function y=csvqDeCoder(y_coded,Table,LL,N,Df)


L=sqrt(length(y_coded));

%  DEdifference y_decoded_diff
if Df==1
y_coded=dedif(y_coded);
end



% Converting to the absolut address
y_y_coded=reshape(y_coded,L,L);
for i=1:(L/LL)
    for j=1:(L/LL)
        y_y_i= y_y_coded(    (i-1)*LL+1:i*LL ,(j-1)*LL+1:j*LL       );
     adrs=Table(i,j,:);
     Ln=sum(Table(i,j,:));
        for kk=1:Ln
            y_y_i(y_y_i==kk)==adrs(kk);
        end
        y_y(    (i-1)*LL+1:i*LL ,(j-1)*LL+1:j*LL       )=y_y_i;
    end
end

y=y_y(:)';