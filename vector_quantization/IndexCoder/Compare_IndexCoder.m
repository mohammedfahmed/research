%------------------------------------------------
% IndexCoder index compression applied to OrdVQ %
%------------------------------------------------

load y
y1=y;
clear y

for j=1:5
    
    switch j
        case 1
            load cbN64_5Images_
            N=64;            
        case 2
            load cbN128_5Images_ 
            N=128;            
        case 3
            load cbN256_5Images_
            N=256;            
        case 4
            load cbN512_5Images_
            N=512;            
                    case 5
                        load cbN1024_2Images 
                        N=1024;            
    end
    
    
    for i= 1:7 %   5     1     7     6     4     3     2            min>max
        
        switch i
            case 1
                x=imread('D:\old_WORK\IMAGES\lena.tif','tif');    
            case 2
                x=imread('D:\old_WORK\IMAGES\man.tif','tif');
            case 3
                x=imread('D:\old_WORK\IMAGES\goldhill.tif','tif');
            case 4
                x=imread('D:\old_WORK\IMAGES\barbara.gif','gif');
            case 5
                x=imread('D:\old_WORK\IMAGES\baboon.png','png');
                x=rgb2gray(x);
            case 6
                x=imread('D:\old_WORK\IMAGES\airplane.png','png');
                x=rgb2gray(x);
            case 7
                x=imread('D:\old_WORK\IMAGES\elaine.tif','tif');
                
        end
        
        x=double(x);
        yy=im2col(x,[4 4],'distinct');
        yy=double(yy');
        y=y1(j,:,i);
        yyo=vq_decoder(y,cb);
        P(i,j)=psnr(double(yy),double(yyo))

        y_y=reshape(y,128,128);
        y_y1=y_y';
        y=y_y1(:);
        y=y';
        yd=dif(y);
        
        
        
        % Huff.
        [HL,BR1(i,j)]=huffcoder(y,N);
        % Huff. +DPCM
        [HL,BR2(i,j)]=huffcoder(yd,2*N);        
        
        %  'IndexCoder' method  
        [ y_coded,Table,HL,BR3(i,j),Percentage1(i,:,j)]=IndexCoder(y,1,N,16,128);
        [ y_coded,Table,HL,BR4(i,j),Percentage2(i,:,j)]=IndexCoder(y,2,N,16,128);
        NxtPer(i,j)=100*sum(Table==[1:N]')/N;
        [ y_coded,Table,HL,BR5(i,j),Percentage3(i,:,j)]=IndexCoder(y,3,N,16,128);
        RgtPer(i,j)=100*sum(Table==[1:N]')/N;
        [ y_coded,Table,HL,BR6(i,j),Percentage4(i,:,j)]=IndexCoder(y,4,N,16,128);
        [BR7(i,j),y_coded]=soc(y,N);
    end
end





for i=1:7
    figure;
    hold
    grid
    switch i
        case 1
            title('lena.tif');
        case 2
            title('man.tif');
        case 3
            title('goldhill.tif');
        case 4
            title('barbara.gif');
        case 5
            title('baboon.png');
        case 6
            title('airplane.png');
        case 7
            title('elaine.tif');
            
    end
    
    
    plot(BR1(i,:),P(i,:));
    plot(BR2(i,:),P(i,:),'.-');
    plot(BR3(i,:),P(i,:),'+');
    plot(BR4(i,:),P(i,:),'*r');
    plot(BR5(i,:),P(i,:),'xr');
    plot(BR6(i,:),P(i,:),'pr');
    plot(BR7(i,:),P(i,:),'g');    
    legend('Huff.','Huff.+DPCM','Hu method','Next','Right','Next+Right','SOC',4)
    plot(BR3(i,:),P(i,:));
    plot(BR4(i,:),P(i,:),'r');
    plot(BR5(i,:),P(i,:),'r');
    plot(BR6(i,:),P(i,:),'r');
    
  %  [P(i,:);BR1(i,:);BR2(i,:);BR3(i,:);BR4(i,:);BR5(i,:);BR6(i,:)]    
end







for i=1:4
[P([1 3 6 7],i)'; BR2([1 3 6 7],i)';  BR3([1 3 6 7],i)';  BR4([1 3 6 7],i)' ; BR5([1 3 6 7],i)' ; BR6([1 3 6 7],i)' ]
end










































%------------------------------------------------
% IndexCoder index compression applied to WLVQ %
%------------------------------------------------


for j=1:4
    
    switch j
        %         case 1
        %             load cbN8_15Images 
        %             N=8;            
        %         case 2
        %             load cbN16_15Images 
        %             N=16;            
        %         case 3
        %             load cbN32_15Images 
        %             N=32;            
        case 1
            load cbaN64_15Images
            N=64;            
        case 2
            load cbaN128_15Images
            N=128;            
        case 3
            load cbaN256_15Images
            N=256;            
        case 4
            load cbaN512_15Images
            N=512;            
            %         case 8
            %             load cbN1024_15Images 
            %             N=1024;            
    end
    
    
    for i= 1:7
        
        switch i
            case 1
                x=imread('D:\old_WORK\IMAGES\lena.tif','tif');    
            case 2
                x=imread('D:\old_WORK\IMAGES\man.tif','tif');
            case 3
                x=imread('D:\old_WORK\IMAGES\goldhill.tif','tif');
            case 4
                x=imread('D:\old_WORK\IMAGES\barbara.gif','gif');
            case 5
                x=imread('D:\old_WORK\IMAGES\baboon.png','png');
                x=rgb2gray(x);
            case 6
                x=imread('D:\old_WORK\IMAGES\airplane.png','png');
                x=rgb2gray(x);
            case 7
                x=imread('D:\old_WORK\IMAGES\elaine.tif','tif');
                
        end
        
        x=double(x);
        [a,h,v,d]=dwt2(x,'bior2.8');
        yy=im2col(a,[4 4],'distinct');
        yy=double(yy');
        y=vq_encoder(yy,cb);
        yyo=vq_decoder(y,cb);
        ao=col2im(yyo',[4 4],[264 264],'distinct');
        h1=zeros(264);
        xo=idwt2(ao,h1,h1,h1,'bior2.8');
        P(i,j)=psnr(double(x),double(xo))

        y_y=reshape(y,66,66);
        y_y1=y_y';
        y=y_y1(:);
        y=y';
        yd=dif(y);
        
        
        
        % Huff.
        [HL,BR1(i,j)]=huffcoder(y,N);
        % Huff. +DPCM
        [HL,BR2(i,j)]=huffcoder(yd,2*N);        
        
        %  'IndexCoder' method  
        [ y_coded,Table,HL,BR3(i,j),Percentage1(i,:,j)]=IndexCoder(y,1,N,16,66);
        [ y_coded,Table,HL,BR4(i,j),Percentage2(i,:,j)]=IndexCoder(y,2,N,16,66);
        NxtPer(i,j)=100*sum(Table==[1:N]')/N;
        [ y_coded,Table,HL,BR5(i,j),Percentage3(i,:,j)]=IndexCoder(y,3,N,16,66);
        RgtPer(i,j)=100*sum(Table==[1:N]')/N;
        [ y_coded,Table,HL,BR6(i,j),Percentage4(i,:,j)]=IndexCoder(y,4,N,16,66);
        
    end
end





for i=1:7
    figure;
    hold
    grid
    switch i
        case 1
            title('lena.tif');
        case 2
            title('man.tif');
        case 3
            title('goldhill.tif');
        case 4
            title('barbara.gif');
        case 5
            title('baboon.png');
        case 6
            title('airplane.png');
        case 7
            title('elaine.tif');
            
    end
    
    
    plot(BR1(i,:),P(i,:));
    plot(BR2(i,:),P(i,:),'.-');
    plot(BR3(i,:),P(i,:),'+');
    plot(BR4(i,:),P(i,:),'*r');
    plot(BR5(i,:),P(i,:),'xr');
    plot(BR6(i,:),P(i,:),'pr');
    legend('Huff.','Huff.+DPCM','without Tables','Next','Right','Next+Right',4)
    plot(BR3(i,:),P(i,:));
    plot(BR4(i,:),P(i,:),'r');
    plot(BR5(i,:),P(i,:),'r');
    plot(BR6(i,:),P(i,:),'r');
    
  %  [P(i,:);BR1(i,:);BR2(i,:);BR3(i,:);BR4(i,:);BR5(i,:);BR6(i,:)]    
end







for i=1:4
[P([1 3 6 7],i)'; BR2([1 3 6 7],i)';  BR3([1 3 6 7],i)';  BR4([1 3 6 7],i)' ; BR5([1 3 6 7],i)' ; BR6([1 3 6 7],i)' ]
end