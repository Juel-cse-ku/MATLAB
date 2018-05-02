
clc;

img = imread('bit_plane_slicing.tif');
subplot(3,3,1);
imshow(img);
title('Original Image');

b1 = bitget(img,1);
subplot(3,3,2);
imshow(logical(b1));
title('Bit-1 Image');

b2 = bitget(img,2);
subplot(3,3,3);
imshow(logical(b2));
title('Bit-2 Image');

b3 = bitget(img,3);
subplot(3,3,4);
imshow(logical(b3));
title('Bit-3 Image');

b4 = bitget(img,4);
subplot(3,3,5);
imshow(logical(b4));
title('Bit-4 Image');

b5 = bitget(img,5);
subplot(3,3,6);
imshow(logical(b5));
title('Bit-5 Image');

b6 = bitget(img,6);
subplot(3,3,7);
imshow(logical(b6));
title('Bit-6 Image');

b7 = bitget(img,7);
subplot(3,3,8);
imshow(logical(b7));
title('Bit-7 Image');

b8 = bitget(img,8);
subplot(3,3,9);
imshow(logical(b8));
title('Bit-8 Image');

B = img;
B = bitset(B,1,b1);
B = bitset(B,2,b2);
B = bitset(B,3,b3);
B = bitset(B,4,b4);
B = bitset(B,5,b5);
B = bitset(B,6,b6);
B = bitset(B,7,b7);
B = bitset(B,8,b8);
B = uint8(B);
figure,imshow(B);