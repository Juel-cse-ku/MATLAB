function [] = Thresold()
f = imread('Contrast.tif');
[r,c,d] = size(f);
prompt = 'New minimum intensity: ';
newMin = input(prompt);
prompt = 'New maximum intensity: ';
newMax = input(prompt);
m = mean2(f(:)); %mean intensity
g = (f-m).*((newMax-newMin)/(m-m));
imshow(f);title('main image');
figure();
imshow(g);title('result of thresholding');
end

