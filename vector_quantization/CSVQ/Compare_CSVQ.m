%------------------------------------------------
% CSVQ index compression applied to OrdVQ %
%------------------------------------------------

load y
y1=y;
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
        yy=im2col(x,[4 4],'distinct');
        yy=double(yy');
        y=y1(j,:,i);
        yyo=vq_decoder(y,cb);
        P(i,j)=psnr(double(yy),double(yyo))
        
        y_y=reshape(y,128,128); % Convert to raster scan
        y_y1=y_y';
        y=y_y1(:);
        y=y';
        
        % Huff. +DPCM
        yd=dif(y);
        [HL,BR1(i,j)]=huffcoder(yd,2*N);        
        %  "CSVQ' method  
        [ y_coded,Table,HL,BR2(i,j),Percentage2(i,:,j)]=IndexCoder(y,1,N,16,128);
        [BR3(i,j),y_coded,Nr]=soc(y,N);  
        [ y_coded , Table(i,:,:,:,j) , BR4(i,j)]=csvqCoder(y,32,1,N);
        
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
    legend('Huff.+DPCM','SOC','Hu','CSVQ32+DPCM',4)
    plot(BR3(i,:),P(i,:));
    plot(BR4(i,:),P(i,:),'r');
    
    
end


for i=1:5
    [P([1 3 6 7],i)'; BR1([1 3 6 7],i)'; BR2([1 3 6 7],i)';  BR3([1 3 6 7],i)';  BR4([1 3 6 7],i)' ]
end














N=[ 64 128 256 512 1024];

load y
y1=y;
for j=1:5
    
    for i= 1:7
        
        y=y1(j,:,i);
        
        y_y=reshape(y,128,128); % Convert to raster scan
        y_y1=y_y';
        y=y_y1(:);
        y=y';
        
        [ y_coded , Table , BR]=csvqCoder(y,32,1,N(j));
        
        tt=sum(Table,3);
        
        ma(i,j)=max(tt(:));
        me(i,j)=mean(tt(:));
        mi(i,j)=min(tt(:));
    end
end


