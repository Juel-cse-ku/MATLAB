clc;
f = imread('Fig0326(a).tif');
[row,col] = size(f);
temp = zeros(row+2,col+2);
n=3;
for i = 1:row
    for j = 1:col
        k = i+1;
        l = j+1;
        temp(k,l) = f(i,j);
    end
end
out = zeros(row,col);
temp2 = zeros(n,n);
for m = 1:row
    for n = 1:col
        x = m+1;
        y = n+1;
        temp2(1,1) = temp(x-1,y-1);
        temp2(1,2) = temp(x-1,y);
        temp2(1,3) = temp(x-1,y+1);
        temp2(2,1) = temp(x,y-1);
        temp2(2,2) = temp(x,y);
        temp2(2,3) = temp(x,y+1);
        temp2(3,1) = temp(x+1,y-1);
        temp2(3,2) = temp(x+1,y);
        temp2(3,3) = temp(x+1,y+1);
        
        temp2 = histeq(temp2);
        out(m,n) = temp2(2,2);
    end
end

subplot(2,2,1);
imshow(f); title('Original Image');
subplot(2,2,2);
imhist(f); title('Original Image Histogram');
subplot(2,2,3);
imshow(out); title('Local Histogram Processed Image');
subplot(2,2,4);
imhist(out); title('Local Histogram Processed Image Histogram');
