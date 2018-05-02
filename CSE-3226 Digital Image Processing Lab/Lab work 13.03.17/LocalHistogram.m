% solution iii
img4 = imread('Fig0326(a)(embedded_square_noisy_512).tif');

[row,column] = size(img4);
tempImg = zeros(row+2,column+2);

for i=1:row
    for j=1:column
        tempImg(i+1,j+1) = img4(i,j);
    end
end
%figure,imshow(tempImg);
%figure,imshow(img4);

pImg = zeros(row,column);
tempImg2 = zeros(3,3);
%figure,imshow(tempImg2);
for m=1:row
    for n=1:column
        x=m+1;
        y=n+1;
        
        tempImg2(1,1)=tempImg(x-1,y-1);
        tempImg2 (1,2)=tempImg(x-1,y);
        tempImg2(1,3)=tempImg(x-1,y+1);
        tempImg2(2,1)=tempImg(x,y-1);
        tempImg2(2,2)=tempImg(x,y);
        tempImg2(2,3)=tempImg(x,y+1);
        tempImg2(3,1)=tempImg(x+1,y-1);
        tempImg2(3,2)=tempImg(x+1,y);
        tempImg2(3,3)=tempImg(x+1,y+1);
        
        tempImg2 = histeq(tempImg2);
        pImg(m,n)=tempImg2(2,2);
    end
end
%subplot(3,3,9);
figure,imshow(pImg);
title('Local Histogram');
