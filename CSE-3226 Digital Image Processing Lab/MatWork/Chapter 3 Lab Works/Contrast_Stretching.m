clc;

%Manual Way
f = imread('Contrast_Stretching.tif');
newMin = 0;
newMax = 255;
subplot(3,2,1);
imshow(f);title('Original Image');
subplot(3,2,2);
imhist(f);title('Original Image Histogram');
a = min(f(:));
b = max(f(:)); 
f(:,:)= (f(:,:)-a)*((newMax-newMin)/(b-a));
subplot(3,2,3);
imshow(f);title('Streatched Image');
subplot(3,2,4);
imhist(f);title('Streatched Image Histogram');
imwrite(f,'Contrast Streched.jpg','jpg');

%Using function imadjust
g = imread('Contrast_Stretching.tif');
[r,c] = size(g);
g= mat2gray(g); 
a=min(g(:));
b=max(g(:));
g = imadjust(g,[a;b],[0;1]);
subplot(3,2,5);
imshow(g);title('Streached Image using function');
subplot(3,2,6);
imhist(g);title('Streached Image Histogram');
imwrite(g,'Contrast Streched imadjust.jpg','jpg');