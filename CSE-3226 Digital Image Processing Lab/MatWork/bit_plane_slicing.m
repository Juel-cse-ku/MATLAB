clc;
im = imread('dollar.tif');
%subplot(3,3,1);
%imshow(im);title('Original');
%b1 = bitget(im,1);
%subplot(3,3,2);
%imshow(logical(b1));title('Bit plane 1');
%b2 = bitget(im,2);
%subplot(3,3,3);
% imshow(logical(b2));title('Bit plane 2');
%b3 = bitget(im,3);
%subplot(3,3,4);
%imshow(logical(b3));title('Bit plane 3');
% 
%b4 = bitget(im,4);
%subplot(3,3,5);
%imshow(logical(b4));title('Bit plane 4');
% 
%b5 = bitget(im,5);
%subplot(3,3,6);
%imshow(logical(b5));title('Bit plane 5');
% 
%b6 = bitget(im,6);
%subplot(3,3,7);
% imshow(logical(b6));title('Bit plane 6');
%b7 = bitget(im,7);
%subplot(3,3,8);
%imshow(logical(b7));title('Bit plane 7');
%b8 = bitget(im,8)*128;
%subplot(3,3,9);
%imshow(logical(b8));title('Bit plane 8');
A=imread('dollar.tif');
B =zeros(size(A));
B8= bitset(B,8,bitget(A,8));
B7=bitset(B,7,bitget(A,7));
B6=bitset(B,6,bitget(A,6));
B5=bitset(B,5,bitget(A,5));
B4=bitset(B,4,bitget(A,4));
B3=bitset(B,3,bitget(A,3));
B2=bitset(B,2,bitget(A,2));
B1=bitset(B,1,bitget(A,1));
B=uint8(B);
subplot(3,3,1);
imshow(A);title('Original image');
subplot(3,3,2);
imshow(B1);title('1 bit slicing');

subplot(3,3,3);
imshow(B2);title('2 bit slicing');

subplot(3,3,4);
imshow(B3);title('3 bit slicing');

subplot(3,3,5);
imshow(B4);title('4 bit slicing');

subplot(3,3,6);
imshow(B5);title('5 bit slicing');


subplot(3,3,7);
imshow(B6);title('6 bit slicing');

subplot(3,3,8);
imshow(B7);title('7 bit slicing');

subplot(3,3,9);
imshow(B8);title('8 bit slicing');





%figure,imshow(B);