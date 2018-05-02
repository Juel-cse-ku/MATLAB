function [] = intensityLevelSlicing()
clc;
image = imread('kidney.tif');
s=image;
[r,c,d]= size(image);
a=255/5;
% b=a+a;
% min=(a+b)/2;
% l=b+a;
% max=(b+l)/2;  
min=1.5*a;
max=2.5*a;
for i = 1:r
    for j = 1:c
      
        if ( image(i,j,:)>=min && image(i,j,:) <=max)  
            image(i,j,:) = 204;
        else
            image(i,j,:) = image(i,j,:);
        end
    end
end
subplot(2,2,1);
imshow(s);title('Original image');
subplot(2,2,2);
imshow(image);title('Slicing image');
%imwrite(image,'slicing.jag');
end

