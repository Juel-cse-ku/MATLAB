clc;
im = imread('intensity Level.tif');
[r,c] = size(im);
threshold1 = 140;
threshold2 = 190;
for i = 1:r
    for j = 1:c
        if(im(i,j,:) >= threshold1 && im(i,j,:) <= threshold2)
            im(i,j,:) = 200;
        else 
            im(i,j,:) = 0;
        end
    end
end
imshow(im);