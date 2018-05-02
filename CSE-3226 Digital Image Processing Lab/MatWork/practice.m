function []= practice();
for i=1:600
    for j=1:700
        a(i,j,1)=0;
        a(i,j,2)=255;
        a(i,j,3)=0;
    end
end

for i=1:600
    for j=230:460
        a(i,j,1)=255;
        a(i,j,2)=0;
        a(i,j,3)=0;
    end
end
for i=1:600
    for j=460:700
        a(i,j,1)=0;
        a(i,j,2)=0;
        a(i,j,3)=255;
    end
end
imshow(a);