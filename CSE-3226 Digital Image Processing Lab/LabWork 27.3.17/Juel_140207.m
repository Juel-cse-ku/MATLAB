clc;

a1 = imread('Fig0338(a)(blurry_moon).tif');
b1 = imread('Fig0340(a)(dipxe_text).tif');
c1 = imread('Fig0342(a)(contact_lens_original).tif');

a=im2double(a1);
b=im2double(b1);
c=im2double(c1);

subplot(3,4,1);
imshow(a);
title('Original Image(a)');

subplot(3,4,5);
imshow(b);
title('Original Image(b)');

subplot(3,4,9);
imshow(c);
title('Original Image(c)');

filter_a =[0 1 0;1 -4 1;0 1 0];
[row,column] = size(a);
padImg = zeros(row+2,column+2);

for i=1:row
     for j=1:column
         padImg(i+1,j+1) = a(i,j);
     end
end
 
LapImg = a;
for x = 2:row+1
    for y = 2:column+1
        LapImg(x-1, y-1) = 0;
        for i = 1:3
            for j = 1:3
                LapImg(x-1, y-1) = LapImg(x-1, y-1) + filter_a(i,j) * padImg(x+i-2, y+j-2);
            end
        end
    end
end


subplot(3,4,2);
imshow(LapImg);
title('Laplacian image');

img = LapImg - min(LapImg(:));
grayishImg = (img/max(img(:)));

subplot(3,4,3);
imshow(grayishImg);
title('Grayished Image');

LapFilteredImg = a - grayishImg;

subplot(3,4,4);
imshow(LapFilteredImg);
title('Laplacian Filtered Image');


filter_b = [1 2 3;4 5 6;7 8 9] / 9;
blurImg = b;

[row_b, column_b] = size(b);

padImg2 = zeros(row_b+2,column_b+2);

for i=1:row_b
     for j=1:column_b
         padImg2(i+1,j+1) = b(i,j);
     end
end

for x = 2:(row_b+1)
    for y = 2:(column_b+1)
        blurImg(x-1, y-1) = 0;
        for i = 1:3
            for j = 1:3
                blurImg(x-1, y-1) = blurImg(x-1, y-1) + filter_b(i,j) * padImg2(x+i-2, y+j-2);
            end
        end
    end
end

mask = b;
unsharpImg = b;
highboostImg = b;


for i = 1:row_b
    for j = 1:column_b
        mask(i, j) = b(i, j) - blur(i, j);
    end
end

for i = 1:row_b
    for j = 1:column_b
        unsharpImg(i, j) = b(i, j) + 1.0 * mask(i, j);
    end
 end
 
subplot(3,4,6);
imshow(unsharpImg);
title('Unsharp masked image');

% k2 = input('Input k =  ');

for i = 1:row_b
    for j = 1:column_b
        highboostImg(i, j) = b(i, j) + 5 * mask(i, j);
    end
end

subplot(3,4,7);
imshow(highboostImg);
title('Highboost filtered image');



gx = [-1 -2 -1; 0 0 0; 1 2 1];
gy = [-1 0 1; -2 0 2; -1 0 1];
filter_c = gx + gy;

sobelImg = c;

[row_c, column_c] = size(c);

padImg3 = zeros(row_c+2,column_c+2);

for i=1:row_c
     for j=1:column_c
         padImg3(i+1,j+1) = c(i,j);
     end
end

for x = 2:(row_c+1)
     for y = 2:(column_c+1)
        sobelImg(x-1, y-1) = 0;
        for i = 1:3
            for j = 1:3
                sobelImg(x-1, y-1) = sobelImg(x-1, y-1) + filter_c(i,j) * padImg3(x+i-2, y+j-2);
            end
        end
    end
end


subplot(3,4,10);
imshow(sobelImg);
title('Sobel filtered image');

