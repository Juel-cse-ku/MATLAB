clc;
a=imread('L1.tif');
[r1,c1,k1]=size(a);
%a=im2double(a);

b=imread('L2.tif');
[r2,c2,k2]=size(b);
b=im2double(b);

c=imread('L3.tif');
[r3,c3,k3]=size(c);
c=im2double(c);

for i=1:r1
    for j=1 : c1
        a1(i,j,:)=255-a(i,j,:);
    end
end
subplot(3,3,1);
imshow(a);title('Real Image');
subplot(3,3,2);
imshow(a1);title('Image Negative');
a2=imcomplement(a);
subplot(3,3,3);
imshow(a2);title('Image NegativeUsing fun');
rgb=imread('b.jpg');
com=imcomplement(rgb);
subplot(3,3,4);
imshow(com);title('Image Negative RGB');

%LogInverse
for i=1:r2
    for j=1 : c2
        b1(i,j,:)=5*log(1+b(i,j,:));
    end
end
subplot(3,3,5);
imshow(b);title('Original Image');
subplot(3,3,6);
imshow(b1);title('Logarithimic');

%Gama correction
subplot(3,3,7);
imshow(c);title('Original Image');
c1=imadjust(c,[0 1],[0,1],4);
subplot(3,3,8);
imshow(c1);title('Gama Correction');

%image read
imwrite(c1,'GamaCorrection.tif');





