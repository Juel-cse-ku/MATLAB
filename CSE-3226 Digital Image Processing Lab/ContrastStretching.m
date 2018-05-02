
clc;
img = imread('Contrast_Stretching.tif');
subplot(3,2,1);
imshow(img);
title('Original Image');
subplot(3,2,2);
imhist(img);
title('Original Image Histogram');

r = im2double(img);
a = min(img(:));
b = max(img(:));


s(:,:) = ((img(:,:)-a)*(255/(b-a)))+a;
subplot(3,2,3);
imshow(s);
title('Stretched Image');
subplot(3,2,4);
imhist(s);
title('Stretched Image Histogram');