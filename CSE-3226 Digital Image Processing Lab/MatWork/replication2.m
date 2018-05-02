function replication2()
f=imread('a2.jpg');
[r,c,d]=size(f);
k=1;
for i=1:2:c
    shrink(:,k,:)=f(:,i,:);
    k=k+1;
end
k=1;
for i=1:2:r
    shrink2(k,:,:)=shrink(i,:,:);
    k=k+1;
end
figure,imshow(f);title('main image');
figure,imshow(shrink2);title('half size image');
fprintf('old size %d*%d\n',c,r);
[r,c,d]=size(shrink2);
fprintf('new size %d*%d',c,r);