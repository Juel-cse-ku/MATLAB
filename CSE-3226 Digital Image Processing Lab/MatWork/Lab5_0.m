clearvars;
tum = imread('f1.tif');
[r1,c1,d1] = size(tum);
fs = imread('f2.tif');
[r2,c2,d2] = size(fs);
fs = im2double(fs);
town = imread('f3.tif');
[r3,c3,d3] = size(town);
townn = im2double(town);

for i=1:r1
    for j=1:c1
        
        a(i,j,:) = 255 - tum(i,j,:);
    end
end
subplot(3,3,1);
imshow(a); title('TumorNeg');

for i=1:r2
    for j=1:c2
        
        b1(i,j,:) = 5*log(1+fs(i,j,:));
    end
end
subplot(3,3,2);
imshow(b1);title('Log FS');

for i=1:r2
    for j=1:c2
        
        b2(i,j,:) = 5*exp(1+fs(i,j,:));
    end
end
subplot(3,3,3);
imshow(b2);title('InvLog FS');

for i=1:r3
    for j=1:c3
        
        c(i,j,:) = (townn(i,j,:)).^4;
    end
end
subplot(3,3,4);
imshow(c);title('PowerLaw');
imwrite(a,'pic1.jpg');
imwrite(b1,'pic2.jpg');
imwrite(b2,'pic3.jpg');
imwrite(c,'pic4.jpg');



K = imadjust(town,[],[],4);
subplot(3,3,5);
imshow(K);title('PowerLaw');

L = imcomplement(tum);
subplot(3,3,6);
imshow(L);title('TumorNeg');









