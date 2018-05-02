
clc;
%img read
img = imread('j.jpg');
%img = rgb2gray(img);

%img complement(negative built in)
complementImg = imcomplement(img);
[row,column,n]=size(img);

for i=1:row
    for j=1:column
        for k=1:n
            jjj(i,j,k) = 255-img(i,j,k);
        end
    end
end


%negative img
negImg = img;
negImg(:,:,:) = 255 - img(:,:,:);



%showing img
subplot(1,3,1);
imshow(img);
title('Original');

subplot(1,3,2);
imshow(complementImg);
title('Complement');

subplot(1,3,3);
imshow(negImg);
title('Negative');

%img save
imwrite(negImg,'NegativeImg.jpg','jpg');
imwrite(complementImg,'complementImg.jpg','jpg');

figure,imshow(jjj);