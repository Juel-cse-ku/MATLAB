function [] = contrastStretcFun()
clc;
f = imread('Contrast.tif');
[r,c,d] = size(f);
figure(1);
imshow(f);
f= mat2gray(f);
title('Original Image')
a=min(f(:));
b=max(f(:));
%disp(b);
g = imadjust(f,[a;b],[0;1]);
figure(2);
imshow(g);
title('Contrast Streached Image');
end