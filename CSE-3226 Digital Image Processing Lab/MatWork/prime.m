clc;
close all;
ck = input('Enter a number ');
count=0;
for i=1:ck
    if rem(ck,i)==0
        count=count+1;
    end
end
if count==2
    fprintf('Prime Number');
else
    fprintf('Not Prime Number');
end