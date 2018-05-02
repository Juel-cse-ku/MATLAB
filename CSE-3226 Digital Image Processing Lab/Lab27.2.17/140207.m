%Md. Juel Hossain 
%ID=140207
clc;

%d solution
img1 = imread('Fig0310(b)(washed_out_pollen_image).tif');
nmax = 160;
nmin = 96;

a = min(img1(:));
b = max(img1(:));

s = img1;
s(:,:) = ((img1(:,:)-a)*((160-96)/(b-a)))+a;
subplot(3,3,1);
imshow(s);
title('Contrast Stretched');


%e solution
img2 = imread('Fig0305(a)(DFT_no_log).tif');

r = im2double(img2);
tImg = 2 * log(1+r);
subplot(3,3,2);
imshow(tImg);
title('log Transformed');

%f solution
img3 = imread('Fig0314(a)(100-dollars).tif');

b2 = bitget(img3,1);
subplot(3,3,3);
imshow(logical(b2));
title('Bit-1');

b3 = bitget(img3,3);
subplot(3,3,4);
imshow(logical(b3));
title('Bit-3');

b4 = bitget(img3,4);
subplot(3,3,5);
imshow(logical(b4));
title('Bit-4');

b5 = bitget(img3,5);
subplot(3,3,6);
imshow(logical(b5));
title('Bit-5');

b6 = bitget(img3,6);
subplot(3,3,7);
imshow(logical(b6));
title('Bit-6');

b7 = bitget(img3,7);
subplot(3,3,8);
imshow(logical(b7));
title('Bit-7');

b8 = bitget(img3,8);
subplot(3,3,9);
imshow(logical(b8));
title('Bit-8');
