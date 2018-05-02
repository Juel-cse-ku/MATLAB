clc;
im = imread('contrast.tif');
[r,c] = size(im);
max = 0;
for i = 1:500
    for j = 1:500
        if(im(i,j,:) >= max)
            max = im(i,j,:);
            a = i;
            b = j;
        end
    end
end
min = 255;
for i = 1:500
    for j = 1:500
        if(im(i,j,:) <= min)
            min = im(i,j,:);
            c = i;
            d = j;
        end
    end
end

r1 = min;
r2 = max;
rp = 255/(max - min);
s1 = 0;
s2 = 255;

%im2 = imadjust(im,stretchlim(im),[]);

%im(c,d,:) = s1;
%im(a,b,:) = s2;
im(:,:,:) = rp*(im(:,:,:) - min);
imhist(im);
figure,imshow(im);
%figure, imshow(im2);

