clc;
im=imread('Fig0333(a).tif');
im1=imread('Fig0333(a).tif');
[r,c,d]=size(im);
temp=zeros(r+2,c+2);
for i=1:r
    for j=1:c
        if i==1 || j==1 || i==r || j==c
            temp(i,j)= im(i,j);
        end
        in1=i+1;
        in2=j+1;
        temp(in1,in2)=im(i,j);
     
    end
end
 %disp(temp);
filterSize=3;
filter=zeros(filterSize,filterSize);
disp('Input Filter Value:');
prompt='';
pixel=9;
sumF=0;
temp2=zeros(3,3);
for i=1:filterSize
    for j=1:filterSize
        filter(i,j)=input(prompt);
        sumF=sumF+filter(i,j);
    end
end
for m=1:r
    for n=1:c
        x=m+1;
        y=n+1;
        sum=0;
        temp2(1,1)=temp(x-1,y-1)*filter(1,1);
        sum=sum+temp2(1,1);
        temp2(1,2)=temp(x-1,y)*filter(1,2);
        sum=sum+temp2(1,2);
        temp2(1,3)=temp(x-1,y+1)*filter(1,3);
        sum=sum+temp2(1,3);
        temp2(2,1)=temp(x,y-1)*filter(2,1);
        sum=sum+temp2(2,1);
        temp2(2,2)=temp(x,y)*filter(2,2);
        sum=sum+temp2(2,2);
        temp2(2,3)=temp(x,y+1)*filter(2,3);
        sum=sum+temp2(2,3);
        temp2(3,1)=temp(x+1,y-1)*filter(3,1);
        sum=sum+temp2(3,1);
        temp2(3,2)=temp(x+1,y)*filter(3,2);
        sum=sum+temp2(3,2);
        temp2(3,3)=temp(x+1,y+1)*filter(3,3);
        sum=sum+temp2(3,3);
        output=round(sum/sumF);
        im(m,n)=output;
    end
end
im=uint8(im);
imshow(im1),title('Original');
figure,imshow(im),title('Border Padding');
%imwrite(im,'avg1.tif');
        

