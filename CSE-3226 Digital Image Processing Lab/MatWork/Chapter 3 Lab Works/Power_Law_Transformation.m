clc;
%Here Gamma = 4
%Here C = 1

%power law
g = imread('Power_Law_Transformation.tif');
subplot(1,3,1);
imshow(g);title('Original Image');

h = im2double(g);
po(:,:,:) = 1*power(h(:,:,:),4);
subplot(1,3,2);
imshow(po);title('Power trasformed');
imwrite(po,'Power.jpg','jpg');

%imadjust
j = imadjust(g,[0 1],[0 1],4);
subplot(1,3,3);
imshow(j);title('Power trasformed using function');
imwrite(j,'Power imadjust.jpg','jpg');