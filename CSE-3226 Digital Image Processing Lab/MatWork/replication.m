function replication()
f=imread('rail2.jpg');
[r,c,d]=size(f);
k=1;
for i=1:c
    zoom(:,k,:)=f(:,i,:);
    zoom(:,k+1,:)=f(:,i,:);
    k=k+2;
end
k=1;
for i=1:r
    zoom2(k,:,:)=zoom(i,:,:);
    zoom2(k+1,:,:)=zoom(i,:,:);
    k=k+2;
end
figure,imshow(f);
figure,imshow(zoom2);
%subplot(1,2,1);
%imshow(f);title('main image');
%subplot(1,2,2);
%imshow(zoom2);title('double size image');
fprintf('old size %d*%d\n',c,r);
[r,c,d]=size(zoom2);
fprintf('new size %d*%d',c,r);