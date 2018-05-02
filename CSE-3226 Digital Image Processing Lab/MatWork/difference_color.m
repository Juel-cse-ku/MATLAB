function f = difference_color();
f=imread('Masum.jpg');

for i=1:706
    for j=1:240
        f(i,j,1)=0;
        f(i,j,2)=255;
        f(i,j,3)=255;
    end
    
     for k=241:480
        f(i,k,1)=255;
        f(i,k,2)=0;
        f(i,k,3)=255;
     end
     
    for l=481:720
        f(i,l,1)=255;
        f(i,l,2)=255;
        f(i,l,3)=0;
    end
    for m=721:960
        f(i,m,1)=255;
        f(i,m,2)=0;
        f(i,m,3)=0;
    end
end
imshow(f);
imwrite(f,'NewImage.jpg','jpg');