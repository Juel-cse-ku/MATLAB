function [] = tri()
l=1;
h=100;
for x=1:60
    for y=1:100
        
            im(x,y,1)=255;
            im(x,y,2)=0;
            im(x,y,3)=0;
   
            
    end
end
for x=1:60
    for y=1:100
        if (y>l&&y<h)
            im(x,y,1)=0;
            im(x,y,2)=255;
            im(x,y,3)=0;
        end
          
            
    end
      l=l+1;
      h=h-1;
end

imshow(im)
end