
clc;

img = imread('logTrans.tif');

subplot(1,3,1);
imshow(img);
title('Image');

r = im2double(img);
logImg = 2*log(1+r);

subplot(1,3,2);
imshow(logImg);
title('Transformed');
imwrite(logImg,'logImg.jpg','jpg');

inverseLogImg = 2*logninv(1+r);
subplot(1,3,3);
imshow(inverseLogImg);
title('Inverse Transformed');
imwrite(inverseLogImg,'inverseLogImg.jpg','jpg');
