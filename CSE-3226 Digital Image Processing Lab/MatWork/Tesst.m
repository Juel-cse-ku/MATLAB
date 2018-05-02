clc;
close all;
f  = imread('Masum.jpg');
[r,c,k]=size(f);
%size
disp(r);
disp(c);
m=r*c;
%pixels
disp(m);
red=f;
green=f;
blue=f;

for i=1:400
    for j=1:500
        red(i,j,1)=f(i,j,1);
        red(i,j,2)=0;
        red(i,j,3)=0;
    end
end
figure,imshow(red);

for i=1:400
    for j=1:500 
        green(i,j,1)=0;
        green(i,j,2)=f(i,j,2);
        green(i,j,2)=0;
    end
end
figure,imshow(green);

for i=1:400
    for j=1:500
        blue(i,j,1)=0;
        blue(i,j,2)=0;
        blue(i,j,3)=f(i,j,3);
       
    end
end
figure,imshow(blue);

c=255-red;
m=255-green;
y=255-blue;
figure,imshow(c);
figure,imshow(m);
figure,imshow(y);

imwrite(f,'LabImage.jpg','jpg');

