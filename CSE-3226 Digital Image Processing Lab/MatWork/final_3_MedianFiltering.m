clc;
im1=imread('Median.tif');
im=im1;
[row,col,d1]=size(im1);
im2=zeros(row+2,col+2);
for i=1:row
     index1=i+1;
    for j=1:col
        index2=j+1;
        im2(index1,index2)=im1(i,j);
    end
end

disp('Input Filter Values');
filtersize=3;
input_take='';
filterarr=zeros(filtersize,filtersize);
Filter_sum=0;

for i=1:filtersize
    for j=1:filtersize
        filterarr(i,j)=input(input_take);
        %Filter_sum = Filter_sum+filterarr(i,j);
    end
end
im3=zeros(3,3);
arr=zeros(1,9);
for i=1:row
      x=i+1;
    for j=1:col
        y=j+1;
        arr(1,1)=im2(x-1,y-1)*filterarr(1,1);
        
        arr(1,2)=im2(x-1,y)*filterarr(1,2);
        
        
        arr(1,3)=im2(x-1,y+1)*filterarr(1,3);
        
        
        arr(1,4)=im2(x,y-1)*filterarr(2,1);
        
        
       arr(1,5)=im2(x,y)*filterarr(2,2);
        
        
        arr(1,6)=im2(x,y+1)*filterarr(2,3);
        
        
        arr(1,7)=im2(x+1,y-1)*filterarr(3,1);
        
        
        arr(1,8)=im2(x+1,y)*filterarr(3,2);
        
        arr(1,9)=im2(x+1,y+1)*filterarr(3,3);
%         
        
        res = sort(arr);
       %res = median(arr);
        im1(i,j)=res(1,5);
       % im1(i,j) = res;
    end
end

%im1=uint8(im1);
subplot(2,2,1);
imshow(im);title('Original Image');
subplot(2,2,2);
imshow(im1);title('Median Filtering');
imwrite(im1,'MedianFiltering.tif');

