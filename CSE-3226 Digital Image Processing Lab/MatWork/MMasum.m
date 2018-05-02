a = imread('z.jpg');
disp('number of rows & columns');
size(a)
disp('number of total pixels');
numel(a)

for i=1:400
    for j=1:500
        red(i,j,1)=a(i,j,1);
        %red(i,j,2)=0;
        %red(i,j,3)=0;
    end
end
imshow(red);

for i=1:400
    for j=1:500
        %green(i,j,1)=0;
        green(i,j,2)=a(i,j,2);
        %green(i,j,3)=0;
    end
end
figure, imshow(green);

for i=1:400
    for j=1:500
        %blue(i,j,1)=0;
        %blue(i,j,2)=0;
        blue(i,j,3)=a(i,j,3);
    end
end
figure, imshow(blue);


C = 255 - red;
M = 255 - green;
Y = 255 - blue;
figure, imshow(C);
figure, imshow(M);
figure, imshow(Y);

imwrite(a,'Views.jpg');

