clc;
f = imread('Fig0441(a)(characters_test_pattern).tif');

subplot(3,4,3);
imshow(f);
title('Original image');

f = im2double(f);
[r,c] = size(f);
r2 = 2*r;
c2 = 2*c;
fp = zeros(r2,c2);


for i=1:r
    for j=1:c
        fp(i, j) = f(i,j);
    end
end

f1 = fp;
for i = 1:r2
    for j = 1:c2
        f1(i, j) = fp(i,j)*(-1).^(i+j);
    end
end

dft = fft2(f1);
subplot(3,4,4);
imshow(dft);
title('DFT image');


f2 = fp;
for i = 1:r2
    for j = 1:c2
        d = sqrt((i-r).^2 + (j-c).^2);
        if(d >= 30)
            f2(i,j)=1;
         end
    end
end

f3 = fp;
for i = 1:r2
    for j = 1:c2
        f3(i, j) = dft(i,j).*f2(i,j);
    end
end

idft = ifft2(f3);

idft = real(idft);
for i = 1:r2
    for j = 1:c2
        idft(i,j) = idft(i,j) * (-1) .^ (i+j);
    end
end

fihpf = zeros(r,c);
for i=1:r
    for j=1:c
        fihpf(i,j) = idft(i,j);
    end
end

subplot(3,4,1);
imshow(fihpf);
title('IHPF for 30=30');



for i=1:r2
    for j=1:c2
        d = sqrt((i-r).^2 + (j-c).^2);
        if(d >= 160)
            f2(i,j)=1;
        end
    end
end


for i = 1:r2
    for j = 1:c2
        f3(i, j) = dft(i,j).*f2(i,j);
    end
end

idft = ifft2(f3);

idft = real(idft);
for i = 1:r2
    for j = 1:c2
        idft(i,j) = idft(i,j) * (-1) .^ (i+j);
    end
end

fihpf = zeros(r,c);
for i = 1:r
    for j = 1:c
        fihpf(i,j) = idft(i,j);
    end
end

subplot(3,4,2);
imshow(fihpf);
title('IHPF for 30=160');



%butterworth high pass filter

n=2;
for i = 1:r2
    for j = 1:c2
        d = sqrt((i-r).^2 + (j-c).^2);
        
        f2(i,j) = 1 / (1 + (30 / d) .^ (2*n));
    end
end


for i = 1:r2
    for j = 1:c2
        f3(i, j) = dft(i,j).*f2(i,j);
    end
end

idft = ifft2(f3);

idft = real(idft);
for i = 1:r2
    for j = 1:c2
        idft(i,j) = idft(i,j) * (-1) .^ (i+j);
    end
end

fbhpe = zeros(r,c);
for i = 1:r
    for j = 1:c
        fbhpe(i,j) = idft(i,j);
    end
end

subplot(3,4,5);
imshow(fbhpe);
title('BHPF for 30=30');



n=2;
for i = 1:r2
    for j = 1:c2
        d = sqrt((i-r).^2 + (j-c).^2);
        
        f2(i,j) = 1 / (1 + (160 / d) .^ (2*n));
    end
end


for i = 1:r2
    for j = 1:c2
        f3(i, j) = dft(i,j).*f2(i,j);
    end
end

idft = ifft2(f3);

idft = real(idft);
for i = 1:r2
    for j = 1:c2
        idft(i,j) = idft(i,j) * (-1) .^ (i+j);
    end
end

fbhpe = zeros(r,c);
for i = 1:r
    for j = 1:c
        fbhpe(i,j) = idft(i,j);
    end
end

subplot(3,4,6);
imshow(fbhpe);
title('BHPF for 30=160');

%Gaussian high pass filter

for i = 1:r2
    for j = 1:c2
        d = sqrt((i-r).^2 + (j-c).^2);
        
        f2(i,j) = 1 - exp(-(d^2) / (2 * 30 .^2));
    end
end


for i = 1:r2
    for j = 1:c2
        f3(i, j) = dft(i,j).*f2(i,j);
    end
end

idft = ifft2(f3);

idft = real(idft);
for i = 1:r2
    for j = 1:c2
        idft(i,j) = idft(i,j) * (-1) .^ (i+j);
    end
end

fghpf = zeros(r,c);
for i = 1:r
    for j = 1:c
        fghpf(i,j) = idft(i,j);
    end
end

subplot(3,4,9);
imshow(fghpf);
title('GHPF for 30=30');


for i = 1:r2
    for j = 1:c2
        d = sqrt((i-(round(r2/2))).^2 + (j-(round(c2/2))).^2);
        
        f2(i,j) = 1 - exp(-(d^2) / (2 * 160 .^2));
    end
end


for i = 1:r2
    for j = 1:c2
        f3(i, j) = dft(i,j).*f2(i,j);
    end
end

idft = ifft2(f3);

idft = real(idft);
for i = 1:r2
    for j = 1:c2
        idft(i,j) = idft(i,j) * (-1) .^ (i+j);
    end
end

fghpf = zeros(r,c);
for i = 1:r
    for j = 1:c
        fghpf(i,j) = idft(i,j);
    end
end

subplot(3,4,10);
imshow(fghpf);
title('GHPF for 30=160');


