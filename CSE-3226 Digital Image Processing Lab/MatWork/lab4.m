function [] =lab4()
a=imread('b.jpg');
im=a;
%Linear
for x=1:400
    for y=1:400
        Linear(x,y,:) = 255-a(x,y,:);
    end
end
clc;

%Logarithm
a=im2double(a);
for x=1:400
    for y=1:400
       imlog(x,y,:)=log(1+a(x,y,:));
    end
end
%Power
a=im2double(a);
for x=1:400
    for y=1:400
       power(x,y,:)=1*a(x,y,:).^(.10);
    end
end

subplot(2,2,1);
imshow(im);title('Orginal');
subplot(2,2,2);
imshow(Linear);title('Negative');
subplot(2,2,3);
imshow(imlog);title('Logrithm');
subplot(2,2,4);
imshow(power);title('Power');



end