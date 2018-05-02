% project 6(a)

f = imread('Fig0338(a)(blurry_moon).tif');

subplot(3,4,1);
imshow(f);
title('Original image(a)');



% filter
w = [0 1 0; 1 -4 1; 0 1 0];

df = im2double(f);
g = df;
lf = df;
pf = padarray(df, [1, 1]);



[r, c] = size(pf);
[rw, cw] = size(w);

% laplacian image processing
x1 = 1;
for x = 2:(r-1)
    y1 = 1;
    for y = 2:(c-1)
        % for every pixel
        lf(x1, y1) = 0;
        for i = 1:rw
            for j = 1:cw
                lf(x1, y1) = lf(x1, y1) + w(i,j).*pf(x+i-2, y+j-2);
            end
        end
        y1 = y1 + 1;
    end
    x1 = x1 + 1;
end


subplot(3,4,2);
imshow(lf);
title('Laplacian image');

% Grayish image processing

[r1, c1] = size(lf);

min_lf = min(lf(:));
fm = lf;
fs = lf;

for i = 1:r1
    for j = 1:c1
        fm(i, j) = lf(i, j) - min_lf;
    end
end

max_fm = max(fm(:));
k = 1.0;

for i = 1:r1
    for j = 1:c1
        fs(i, j) = k*(fm(i, j)/max_fm);
    end
end

subplot(3,4,3);
imshow(fs);
title('Grayish Laplacian image');

% processed image

c = 0;
% set the value of c
if w(2, 2) > 0
    c = 1;
else
    c = -1;
end

for i = 1:r1
    for j = 1:c1
        g(i, j) = df(i, j) + c .* fs(i, j);
    end
end

subplot(3,4,4);
imshow(g);
title('Laplacian filtered image');


% project 6(b)

f1 = imread('Fig0340(a)(dipxe_text).tif');

subplot(3,4,5);
imshow(f1);
title('Original image(b)');


df1 = im2double(f1);
% blurring the image
h = ones(3,3) / (3 * 3);
%blurr = imfilter(f1,h);
%b2 = imboxfilt(f1, 3);

blurr = df1;
pblurr = padarray(df1, [1, 1]);



[r4, c4] = size(pblurr);


x1 = 1;
for x = 2:(r4-1)
    y1 = 1;
    for y = 2:(c4-1)
        % for every pixel
        blurr(x1, y1) = 0;
        for i = 1:3
            for j = 1:3
                blurr(x1, y1) = blurr(x1, y1) + h(i,j).*pblurr(x+i-2, y+j-2);
            end
        end
        y1 = y1 + 1;
    end
    x1 = x1 + 1;
end


mask = df1;
unsharp = df1;
highboost = df1;

[r2, c2] = size(df1);

% subtract from original
for i = 1:r2
    for j = 1:c2
        mask(i, j) = df1(i, j) - blurr(i, j);
    end
end

k1 = 1.0; % for unsharped masking

for i = 1:r2
    for j = 1:c2
        unsharp(i, j) = df1(i, j) +k1 * mask(i, j);
    end
end

subplot(3,4,6);
imshow(unsharp);
title('Unsharp masked image');

k2 = input('Input k for highboost masking: ');

for i = 1:r2
    for j = 1:c2
        highboost(i, j) = df1(i, j) +k2 * mask(i, j);
    end
end

subplot(3,4,7);
imshow(highboost);
title('Highboost filtered image');


% project 6(c)

f2 = imread('Fig0342(a)(contact_lens_original).tif');

subplot(3,4,9);
imshow(f2);
title('Original image(c)');

df2 = im2double(f2);

% sobel filter 
gx = [-1 -2 -1; 0 0 0; 1 2 1];
gy = [-1 0 1; -2 0 2; -1 0 1];
mxy = gx + gy

sf = df2;
psf = padarray(df2, [1, 1]);



[r3, c3] = size(psf);

% laplacian image processing
x1 = 1;
for x = 2:(r3-1)
    y1 = 1;
    for y = 2:(c3-1)
        % for every pixel
        sf(x1, y1) = 0;
        for i = 1:3
            for j = 1:3
                sf(x1, y1) = sf(x1, y1) + mxy(i,j).*psf(x+i-2, y+j-2);
            end
        end
        y1 = y1 + 1;
    end
    x1 = x1 + 1;
end


subplot(3,4,10);
imshow(sf);
title('Sobel filtered image');
