clc;

%Image Negative
im=imread('f1.tif');
org=im;
org=im2double(org);
[row,col,k]=size(im);

for i=1:row
    for j=1:col
        newim(i,j,:)=255-im(i,j,:);
    end
end
subplot(4,4,1);
imshow(im);title('Original Image');
subplot(4,4,2);
imshow(newim);title('Negative Image');
im1=imcomplement(im);
subplot(4,4,3);
imshow(im1);title('Negative Image using Function');

%Power Law
l2=imread('L2.tif');
l2=im2double(l2);
[row1,col1,k1]=size(l2);

for i=1:row1
    for j=1:col1
        power(i,j,:)=15*log(1+l2(i,j,:));
    end
end
subplot(4,4,4);
imshow(l2);title('Original Image');
subplot(4,4,5);
imshow(power);title('Lograthimic Image');
imwrite(power,'PowerLaw.tif');
%Inverse Log
l2=im2double(l2);
for i=1:row1
    for j=1:col1
        power1(i,j,:)=15*logninv(1+l2(i,j,:));
    end
end
subplot(4,4,6);
imshow(power1);title('Inverse Lograthimic Image');
imwrite(power1,'PowerLawInverse.tif');

%Gamma Correction
l3=imread('L3.tif');
l3=im2double(l3);
[row2,col2,k2]=size(l3);

for i=1:row2
    for j=1:col2
        power2(i,j,:)=1*(l3(i,j,:).^6);
    end
end
subplot(4,4,7);
imshow(power2);title('Gamma Correction');
imwrite(power2,'PowerLawGammaCorrection.tif');

%Gamma Correction using Function
 power3=imadjust(l3,[0 1],[0 1],6);
 subplot(4,4,8);
imshow(power3);title('Gamma Correction Using Function');
imwrite(power3,'PowerLawGammaCorrectionFun.tif');






