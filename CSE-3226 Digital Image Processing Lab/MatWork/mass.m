im1 = imread('a.jpg');
im2 = imread('b.jpg');
for i=1:300
    for j=1:200
        p1(i,j,1) = im1(i,j,1)+im2(i,j,1);
        p1(i,j,2) = im1(i,j,2) + im2(i,j,2);
        p1(i,j,3) = im1(i,j,3) + im2(i,j,3);
    end
end

for i=1:300
    for j=1:200
        p2(i,j,1) = im1 (i,j,1) - im2(i,j,1);
        p2(i,j,2) = im1(i,j,2) - im2(i,j,2);
        p2(i,j,3) = im1(i,j,3) - im2(i,j,3);
    end
end
for i=1:300
    for j=1:200
        p3(i,j,1) = im1 (i,j,1) .* im2(i,j,1);
        p3(i,j,2) = im1(i,j,2) .* im2(i,j,2);
        p3(i,j,3) = im1(i,j,3) .* im2(i,j,3);
    end
end
for i=1:300
    for j=1:200
        p4(i,j,1) = im1 (i,j,1) ./ im2(i,j,1);
        p4(i,j,2) = im1(i,j,2) ./ im2(i,j,2);
        p4(i,j,3) = im1(i,j,3) ./ im2(i,j,3);
    end
end
for i=1:300
    for j=1:200
        p5(i,j,1) = 255-im1 (i,j,1);
        p5(i,j,2) = 255-im1(i,j,2);
        p5(i,j,3) = 255-im1(i,j,3);
    end
end
for i=1:300
    for j=1:200
        p6(i,j,1) = im1 (i,j,1)+50;
        p6(i,j,2) = im1(i,j,2)+50;
        p6(i,j,3) = im1(i,j,3)+50;
    end
end

subplot(2,3,1);
imshow(p1);title('a+b.jpg');
subplot(2,3,2);
imshow(p2);title('a-b.jpg');
subplot(2,3,3);
imshow(p3);title('a*b.jpg');
subplot(2,3,4);
imshow(p4);title('a./b.jpg');
subplot(2,3,5);
imshow(p5);title('a''');
subplot(2,3,6);
imshow(p6);title('a+50.jpg');