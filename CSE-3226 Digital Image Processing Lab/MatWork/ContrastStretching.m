% clc;
% a=imread('Contrast.tif');
% [r ,c ,k]=size(a);
% prompt='New minimum intensity';
% newMin=input(prompt);
% prompt='New maximum intensity';
% newMax=input(prompt);
% figure(1);
% imshow(a);title('Original image');

function [] = ContrastStretching()
f = imread('Contrast.tif');
[r, c, d] = size(f);
prompt = 'New minimum intensity:';
newMin = input(prompt);
prompt = 'New maximum intensity:';
newMax = input(prompt);
figure(1);
imshow(f);
title('Original Image')
a = min(f(:));  %minimum pixel of image X
b = max(f(:)); %maximum pixel of image X 
f= (f-a).*((newMax-newMin)/(b-a)); %using the formula
figure(2);
imshow(f);
title('Contrast Streached Image');
end