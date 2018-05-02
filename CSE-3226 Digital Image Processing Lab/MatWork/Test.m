function []=potaka();

for i=1:600
    for j=1:700
        f(i,j,1)=0;
         f(i,j,2)=255;
          f(i,j,3)=0;
    end
end
for i=250:350
    for j=275:425
        f(i,j,1)=255;
         f(i,j,2)=0;
          f(i,j,3)=0;
    end
end

imshow(f);






