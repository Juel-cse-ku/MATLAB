clc;
a = imread('dollar.tif');
[r,c,d] = size(a);
f=double(a);
b1=mod(f,2);
b2=mod(floor(f/2),2);
b3=mod(floor(f/4),2);
b4=mod(floor(f/8),2);
b5=mod(floor(f/16),2);
b6=mod(floor(f/32),2);
b7=mod(floor(f/64),2);
b8=mod(floor(f/128),2);
subplot(2,4,1);
imshow(b1);title('b1');
subplot(2,4,2);
imshow(b2);title('b2');
subplot(2,4,3);
imshow(b3);title('b3');
subplot(2,4,4);
imshow(b4);title('b4');
subplot(2,4,5);
imshow(b5);title('b5');
subplot(2,4,6);
imshow(b6);title('b6');
subplot(2,4,7);
imshow(b7);title('b7');
subplot(2,4,8);
imshow(b8);title('b8');

