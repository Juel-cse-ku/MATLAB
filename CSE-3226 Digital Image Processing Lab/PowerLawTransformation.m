
clc;

img = imread('Power_Law_Transformation.tif');
subplot(1,3,1);
imshow(img);
title('Original Image');

r = im2double(img);
gammaImg = img;
gammaImg = 1*power(r,4);
subplot(1,3,2);
imshow(gammaImg);
title('Gamma Image');
imwrite(gammaImg,'Gama Transformed.jpg','jpg');


gammaImg2 = imadjust(img,[0,1],[0,1],4);
subplot(1,3,3);
imshow(gammaImg2);
title('Gamma Image2');
imwrite(gammaImg,'Gama Transformed2.jpg','jpg');