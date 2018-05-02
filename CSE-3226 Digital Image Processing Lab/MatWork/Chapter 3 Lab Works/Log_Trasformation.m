clc;

%log
b = imread('Log_Trasformation.tif');
subplot(1,3,1);
imshow(b);title('Original Image');

c = im2double(b);
bl = 2*log(1+c);
subplot(1,3,2);
imshow(bl);title('Log transformed');
imwrite(bl,'log.jpg','jpg');

%inverse log
e = imread('f2.tif');
f = im2double(e);
blin = 2*logninv(1+f);
subplot(1,3,3);
imshow(blin);title('Inverse Log');
imwrite(blin,'inverse log.jpg','jpg');