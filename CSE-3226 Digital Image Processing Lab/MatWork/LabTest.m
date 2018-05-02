clc;
f = imread('Masum.jpg');
size(f)
%pixels
numel(f)

for i=1:400
    for j=1:500
        red(i,j,1)=f(i,j,1);
    end
end
imshow(red);
for i=1:400
    for j=1:500
        green(i,j,2)=f(i,j,2);
    end
end
figure,imshow(green);

for i=1:400
    for j=1:500
        blue(i,j,3)=f(i,j,3);
    end
end
figure,imshow(blue);


