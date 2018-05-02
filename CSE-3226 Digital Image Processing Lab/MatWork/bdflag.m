function []=bdflag()
for x= 1:600
    for y= 1:1000
        im(x,y,1)=0;
        im(x,y,2)=255;
        im(x,y,3)=0;
    end
end

for x= 200:400
    for y= 450:550
        im(x,y,1)=200;
        im(x,y,2)=0;
        im(x,y,3)=0;
    end
end
for x= 250:350
    for y= 400:550
        im(x,y,1)=200;
        im(x,y,2)=0;
        im(x,y,3)=0;
    end
end
for x= 250:350
    for y= 550:600
        im(x,y,1)=200;
        im(x,y,2)=0;
        im(x,y,3)=0;
    end
end
for x= 225:375
    for y= 425:500
        im(x,y,1)=200;
        im(x,y,2)=0;
        im(x,y,3)=0;
    end
end
for x= 225:375
    for y= 500:575
        im(x,y,1)=200;
        im(x,y,2)=0;
        im(x,y,3)=0;
    end
end
imshow(im)
end