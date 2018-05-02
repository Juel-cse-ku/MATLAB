clc;
c = 1;
gm = 1.5;
a = imread('1.jpg');
subplot(2,2,1);
imshow(a);title('Original');

%negative
b = 255 - a(:,:,:);
subplot(2,2,2);
imshow(b);title('Negative');

%log
d = im2double(a);
e(:,:,:) = c*log(1+d(:,:,:));
subplot(2,2,3);
imshow(e);title('Log');

%power
f(:,:,:) = c*power(d(:,:,:),gm);
subplot(2,2,4);
imshow(f);title('Power');
