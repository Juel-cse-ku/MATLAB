clc;
im = imread('Intensity_Level_Slicing.tif');
o = im;

[r,c] = size(im);
prompt = 'Minimum intensity: ';
threshold1 = input(prompt);
prompt = 'Maximum intensity: ';
threshold2 = input(prompt);
prompt = 'Desired intensity: ';
desired = input(prompt);
for i = 1:r
    for j = 1:c
        if(im(i,j,:) >= threshold1 && im(i,j,:) <= threshold2)
            im(i,j,:) = desired;
%         else 
%             im(i,j,:) = 0;
        end
    end
end
subplot(1,2,1);
imshow(o);title('Original Image');
subplot(1,2,2);
imshow(im);title('Sliced Image');
imwrite(im,'Intensity Sliced.jpg','jpg');