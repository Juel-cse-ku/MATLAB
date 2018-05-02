clc;
a = imread('bit_plane_slicing.tif');
subplot(3,3,1);
imshow(a);title('Original Image');
[r,c,d] = size(a);

f=double(a);

b1=mod(f,2);
subplot(3,3,2);
imshow(b1);title('Bit plane 1');

b2=mod(floor(f/2),2);
subplot(3,3,3);
imshow(b2);title('Bit plane 2');

b3=mod(floor(f/4),2);
subplot(3,3,4);
imshow(b3);title('Bit plane 3');

b4=mod(floor(f/8),2);
subplot(3,3,5);
imshow(b4);title('Bit plane 4');

b5=mod(floor(f/16),2);
subplot(3,3,6);
imshow(b5);title('Bit plane 5');

b6=mod(floor(f/32),2);
subplot(3,3,7);
imshow(b6);title('Bit plane 6');

b7=mod(floor(f/64),2);
subplot(3,3,8);
imshow(b7);title('Bit plane 7');

b8=mod(floor(f/128),2);
subplot(3,3,9);
imshow(b8);title('Bit plane 8');
