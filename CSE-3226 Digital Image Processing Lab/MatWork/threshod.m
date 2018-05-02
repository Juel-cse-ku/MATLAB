clc;
f = imread('Contrast.tif');
g = f;
[r,c,d] = size(f);
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
imshow(f);title('main image');
figure();
imshow(g);title('result of thresholding');