clc;
im1=imread('averageFilter.tif');
m=im1;
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
%total_sum=0;
for i=1:filtersize
    for j=1:filtersize
        filterarr(i,j)=input(input_take);
        Filter_sum = Filter_sum+filterarr(i,j);
    end
end
disp('Filter Summation: ');
disp(Filter_sum);
im3=zeros(3,3);
for i=1:row
     x=i+1;
    for j=1:col
        total_sum=0;
        y=j+1;
        im3(1,1)=im2(x-1,y-1)*filterarr(1,1);
        total_sum=total_sum+ im3(1,1);
        
        im3(1,2)=im2(x-1,y)*filterarr(1,2);
        total_sum=total_sum+ im3(1,2);
        
        im3(1,3)=im2(x-1,y+1)*filterarr(1,3);
        total_sum=total_sum+ im3(1,3);
        
        im3(2,1)=im2(x,y-1)*filterarr(2,1);
        total_sum=total_sum+ im3(2,1);
        
        im3(2,2)=im2(x,y)*filterarr(2,2);
        total_sum=total_sum+ im3(2,2);
        
        im3(2,3)=im2(x,y+1)*filterarr(2,3);
        total_sum=total_sum+ im3(2,3);
        
        im3(3,1)=im2(x+1,y-1)*filterarr(3,1);
        total_sum=total_sum+ im3(3,1);
        
        im3(3,2)=im2(x+1,y)*filterarr(3,2);
        total_sum=total_sum+ im3(3,2);
        
        im3(3,3)=im2(x+1,y+1)*filterarr(3,3);
        total_sum=total_sum+ im3(3,3);
        
        avg=round(total_sum/Filter_sum);
        im1(i,j)=avg;
    end
end
% disp('Average Filter :');
% disp(avg);
 im1=uint8(im1);
 subplot(2,2,1);
 imshow(m);title('Original Image');
 subplot(2,2,2);
 imshow(im1);title('Average Filtering Image');
imwrite(im1,'AverageFiltering.tif');

