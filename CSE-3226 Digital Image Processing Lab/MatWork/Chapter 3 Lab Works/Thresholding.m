clc;
f = imread('Contrast_Stretching.tif');
g = f;
[r,c] = size(f);
m = mean2(f(:)); %mean intensity
for i = 1:r
    for j = 1:c
        if(f(i,j) >=m)
            g(i,j) = 255;
        else
            g(i,j) = 0;
        end
    end
end
subplot(1,2,1);
imshow(f);title('Original Image');
subplot(1,2,2);
imshow(g);title('Thresholded Image');
imwrite(g,'Thresholded Image.jpg','jpg');