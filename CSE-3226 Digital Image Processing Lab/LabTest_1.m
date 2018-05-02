img = imread('E:\Academic\3rd Year 2nd Term\CSE-3226 Digital Image Processing Lab\j.jpg');
imshow(img);
imwrite(img,'E:\Academic\3rd Year 2nd Term\CSE-3226 Digital Image Processing Lab\k.jpg');

[x y z] = size(img);
disp(x);
disp(y);

R = img(:,:,1);
figure, imshow(R);
title('Red Channel');

G = img(:,:,2);
figure, imshow(G);
title('Green Channel');

B = img(:,:,3);
figure, imshow(B);
title('Blue Channel');

subplot(1,3,1),imshow(R);
title('Red Channel');
subplot(1,3,2),imshow(G);
title('Green Channel');
subplot(1,3,3),imshow(B);
title('Blue Channel');

new_img = img;
for a=1:x
    for b=1:y
        new_img(a,b) = 50+img(a,b);
        
    end
end

figure, imshow(new_img);

