clc;
im=imread('border.tif');
[row,col,d1]=size(im);
for i=1:row
    for j=1:col
        im1(i,j)=im(i,j);
    end
end
for i=1:(row+2)
    for j=1:(col+2)
        im2(i,j)=0;
    end
end
%im2=zeros(row+2,col+2);

for i=2:(row+1)
    for j=2:(col+1)
        if(i==2)
            im2(1,j)=im1(i,j);
        end
            if(j==2)
                im2(i,1)=im1(i,j);
            end
            if(i==(row+1))
                im2(row+2,j)=im1(i,j);
            end
            if(j==(row+1))
                im2(i,row+2)=im1(i,j);
            end
            if(i==2 && j==2)
                im2(1,1)=im1(i,j);
            end
            if(i==(row+1) && j==2)
                im2(row+2,1)=im1(i,j);
            end
            if(i==2 && j==(row+1))
                im2(1,row+2)=im1(i,j);
            end
            if(i==(row+1) && j==(row+1))
                im2(row+2,row+2)=im1(i,j);
            end
        end
end
subplot(2,2,1);
imshow(im1);title('Original Image');
subplot(2,2,2);
imshow(im2);title('Border Image');
