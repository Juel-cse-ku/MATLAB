clc;
im = imread('Fig0320(1)(top_left).tif');
[row,col,k] =size(im);
pixel = row *col;
color = zeros(256,1);
probability = zeros(256,1);
output = zeros(256,1);
out = zeros(row,col);
count = 0;
for index = 0:255
    for i = 1:row
        for j = 1:col
            if(im(i,j)==index)
                count = count + 1;
            end
        end
    end
    color(index+1) = count;
    probability(index+1) = color(index+1);
    probability(index+1) = probability(index+1)/pixel;
    count = 0;
end

for i = 1:256
    for j = 1:i
        output(i) = output(i) + probability(j);
    end
    output(i) = round(output(i)*255);
end

for i = 1:row
    for j = 1:col
        out(i,j) = output(im(i,j)+1);
    end
end
out = uint8(out);
subplot(2,2,1);
imshow(im); title('Original Image');
subplot(2,2,2);
imhist(im); title('Original Image Histogram');
subplot(2,2,3);
imshow(out); title('Equalized Image');
subplot(2,2,4);
imhist(out); title('Equalized Image Histogram');
