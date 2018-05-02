% solution i
clc;
img1 = imread('Fig0308(a)(fractured_spine).tif');

r = im2double(img1);

pgi1 = 1*power(r,1/.6);
pgi2 = 1*power(r,1/.4);
pgi3 = 1*power(r,1/.3);

img2 = imread('Fig0309(a)(washed_out_aerial_image).tif');
r = im2double(img2);
pgi4 = 1*power(r,1/3);
pgi5 = 1*power(r,1/4);
pgi6 = 1*power(r,1/5);

subplot(3,3,1);
imshow(pgi1);
imwrite(pgi1,'Image1.jpg','jpg');
title('c=1,gamma=.6');

subplot(3,3,2);
imshow(pgi2);
imwrite(pgi2,'Image2.jpg','jpg');
title('c=1,gamma=.4');

subplot(3,3,3);
imshow(pgi3);
imwrite(pgi3,'Image3.jpg','jpg');
title('c=1,gamma=.3');

subplot(3,3,4);
imshow(pgi4);
imwrite(pgi4,'Image4.jpg','jpg');
title('c=1,gamma=3');

subplot(3,3,5);
imshow(pgi5);
imwrite(pgi5,'Image5.jpg','jpg');
title('c=1,gamma=4');

subplot(3,3,6);
imshow(pgi6);
imwrite(pgi6,'Image6.jpg','jpg');
title('c=1,gamma=5');


%solution ii
img3 = imread('Fig0312(a)(kidney).tif');

[row,column] = size(img3);
ilsi = img3;

for i=1:row
    for j=1:column
        if(img3(i,j,:) >= 64 && img3(i,j,:) <= 128)
            ilsi(i,j,:) = 153;
        else
            ilsi(i,j,:) = 77;
            
        end
    end
end

subplot(3,3,7);
imshow(ilsi);
imwrite(ilsi,'Image7.jpg','jpg');
title('Function 3.11(a)');

ilsi2 = img3;
for i=1:row
    for j=1:column
        if(img3(i,j,:) >= 128 && img3(i,j,:) <= 192)
            ilsi2(i,j,:) = 204;
          
        end
    end
end

subplot(3,3,8);
imshow(ilsi2);
imwrite(ilsi2,'Image8.jpg','jpg');
title('Function 3.12(a)');

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
for i=1:row
    for j=1:column
        x = i+1;
        y = j+1;
        
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
        pImg(i,j)=tempImg2(2,2);
    end
end
subplot(3,3,9);
imshow(pImg);
imwrite(pImg,'Image9.jpg','jpg');
title('Local Histogram');





