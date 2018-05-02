clc;
f = imread('Local_Histogram.tif');
im = f;
[r,c] = size(f);
temp = zeros(r+2,c+2);
n=3;
for i=1:r
    for j=1:c
        k=i+1;
        l=j+1;
        temp(k,l)=f(i,j);
    end
end
result = zeros(r,c);
temp2 = zeros(n,n);
for m=1:r
    for n=1:c
        x=m+1;
        y=n+1;
        temp2(1,1)=temp(x-1,y-1);
        temp2(1,2)=temp(x-1,y);
        temp2(1,3)=temp(x-1,y+1);
        temp2(2,1)=temp(x,y-1);
        temp2(2,2)=temp(x,y);
        temp2(2,3)=temp(x,y+1);
        temp2(3,1)=temp(x+1,y-1);
        temp2(3,2)=temp(x+1,y);
        temp2(3,3)=temp(x+1,y+1);
        
        %Using histeq function
        temp3 = temp2;
        temp3 = histeq(temp3);
        result(m,n) = temp3(2,2);
        
        
        %Manual way
        
        pixel=9;
        Nk = zeros(256,1);
        for k=0:255
            for i=1:3
                for j=1:3
                    if temp2(i,j)==k
                        Nk(k+1)=Nk(k+1)+1;
                    end
                end
            end
            k=k+1;
        end
        %disp(Nk);
        PrRk = zeros(256,1);
        for k=1:256
            PrRk(k) = Nk(k)/pixel;
        end
        %disp(PrRk);
        s=zeros(256,1);
        for i=1:256
            jog = 0;
            for j=1:i
                jog = jog+PrRk(j);
            end
            %disp(i);
            s(i) = round((256-1)*jog);
        end
        %disp(s);
        
        for i=1:3
            for j=1:3
                index = temp2(i,j);
                temp2(i,j) = s(index+1);
            end
        end
        f(m,n)=temp2(2,2);
    end
end
 subplot(1,3,1);
 imshow(im);title('Original Image');
 subplot(1,3,2);
 imshow(f);title('Locally matched image');
 imwrite(f,'Locally matched image.jpg','jpg');
 subplot(1,3,3);
 imshow(result);title('Locally matched image using function');
 imwrite(result,'Locally matched image histeq.jpg','jpg');

