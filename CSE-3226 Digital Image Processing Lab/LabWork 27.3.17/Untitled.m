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

[row,column] = size(a);

%padImg = zeros(row+2,column+2);
padImg = padarray(a, [1, 1]);

filter_a =[0 1 0;1 -4 1;0 1 0];

 for i=1:row
     for j=1:column
         padImg(i+1,j+1) = a(i,j);
     end
 end

for i=2:row+1
    for j=2:column+1
        LapImg(i-1,j-1) = (padImg(i+1,j)*filter_a(2,3)) + (padImg(i-1,j)*filter_a(2,1)) + (padImg(i,j+1)*filter_a(1,2)) + (padImg(i,j-1)*filter_a(3,2)) + (4*(padImg(i,j)*filter_a(2,2)));
        
    end
end

subplot(3,4,2);                                                                                                                                                                                                                                                                                                                                                            % f = fspecial('laplacian',0); LapImg = imfilter(a,f); 
imshow(LapImg);
title('Laplacian Image');

img = LapImg - min(LapImg(:));
grayishImg = (img/max(img(:)));

subplot(3,4,3);
imshow(grayishImg);
title('Grayished Image');

LapFilteredImg = a - grayishImg;

subplot(3,4,4);
imshow(LapFilteredImg);
title('Laplacian Filtered Image');



[row,column] = size(b);

padImg = zeros(row+2,column+2);


padImg = im2double(padImg);
b = double(b);

 for i=1:row
     for j=1:column
         padImg(i+1,j+1) = a(i,j);
     end
 end

for i=2:row+1
    for j=2:column+1
        blurImg(i-1,j-1) = (padImg(i,j) + padImg(i+1,j) + padImg(i-1,j) + padImg(i-1,j-1) + padImg(i,j-1) + padImg(i+1,j-1) + padImg(i,j+1) +  padImg(i+1,j+1) + padImg(i-1,j+1)) / 9.0;
        
    end
end


mask = b -  blurImg;
unsharpedImg = b +  mask;

% H = fspecial('unsharp'); unsharpedImg = imfilter(b,H,'replicate'); 
 
subplot(3,4,6);
imshow(unsharpedImg);
title('unsharped mask Image');

