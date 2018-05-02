clc;
a = imread ('f1.tif');
%negative
neg(:,:,:) = 255 - a(:,:,:);
subplot(1,2,1);
imshow(neg);title('Negative');

%negative Built in
com = imcomplement(a);
subplot(1,2,2);
imshow(com);title('Negative 2');

imwrite(neg,'negative.jpg','jpg');
imwrite(com,'negative built in.jpg','jpg');