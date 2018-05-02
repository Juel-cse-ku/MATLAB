clc;
im = imread('Median_Filtering.tif');
[row,col] = size(im);
temp = zeros(row+2,col+2);
for i=1:row
    for j=1:col
        if(i==1 || j==1 || i==row || j==col)
            temp(i,j)=im(i,j);
        end
        k=i+1;
        l=j+1;
        temp(k,l)=im(i,j);
    end
end
filter = zeros(3,3);
temp2 = zeros(3,3);
sum = zeros(1,9);
disp('Input the filter values:');
prompt = '';
for i = 1:3
    for j=1:3
        filter(i,j) = input(prompt);
    end
end


for m=1:row
    for n=1:col
        x=m+1;
        y=n+1;
        temp2(1,1)=temp(x-1,y-1)*filter(1,1);
        sum(1,1) = temp2(1,1);
        temp2(1,2)=temp(x-1,y)*filter(1,2);
        sum(1,2) = temp2(1,2);
        temp2(1,3)=temp(x-1,y+1)*filter(1,3);
        sum(1,3) = temp2(1,3);
        temp2(2,1)=temp(x,y-1)*filter(2,1);
        sum(1,4) = temp2(2,1);
        temp2(2,2)=temp(x,y)*filter(2,2);
        sum(1,5) = temp2(2,2);
        temp2(2,3)=temp(x,y+1)*filter(2,3);
        sum(1,6) = temp2(2,3);
        temp2(3,1)=temp(x+1,y-1)*filter(3,1);
        sum(1,7) = temp2(3,1);
        temp2(3,2)=temp(x+1,y)*filter(3,2);
        sum(1,8) = temp2(3,2);
        temp2(3,3)=temp(x+1,y+1)*filter(3,3);
        sum(1,9) = temp2(3,3);
        
        res = sort(sum);
        result = res(1,5);
        
        im(m,n)=result;
    end
end
im = uint8(im);
imshow(im);
imwrite(im,'Median_Filtering_Border_Padding.jpg','jpg');
