clc;
im = imread('bit_plane_slicing.tif');
subplot(3,3,1);
imshow(im);title('Original');
b1 = bitget(im,1);
subplot(3,3,2);
imshow(logical(b1));title('Bit plane 1');

b2 = bitget(im,2);
subplot(3,3,3);
imshow(logical(b2));title('Bit plane 2');

b3 = bitget(im,3);
subplot(3,3,4);
imshow(logical(b3));title('Bit plane 3');

b4 = bitget(im,4);
subplot(3,3,5);
imshow(logical(b4));title('Bit plane 4');

b5 = bitget(im,5);
subplot(3,3,6);
imshow(logical(b5));title('Bit plane 5');

b6 = bitget(im,6);
subplot(3,3,7);
imshow(logical(b6));title('Bit plane 6');

b7 = bitget(im,7);
subplot(3,3,8);
imshow(logical(b7));title('Bit plane 7');

b8 = bitget(im,8);
subplot(3,3,9);
imshow(logical(b8));title('Bit plane 8');


A=imread('dollar.tif');
B=zeros(size(A));
B=bitset(B,8,bitget(A,8));
B=bitset(B,7,bitget(A,7));
B=bitset(B,6,bitget(A,6));
B=bitset(B,5,bitget(A,5));
B=bitset(B,4,bitget(A,4));
B=bitset(B,3,bitget(A,3));
B=bitset(B,2,bitget(A,2));
B=bitset(B,1,bitget(A,1));
B=uint8(B);
figure,
subplot(2,1,1);imshow(A);title('Original Image');
subplot(2,1,2);imshow(B);title('Added sliced Image');