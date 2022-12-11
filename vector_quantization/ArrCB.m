function cb=ArrCB(cb)
%Arrange CB by thier means
m=mean(cb');
[m_s I]=sort(m);
cb=cb(I,:);
