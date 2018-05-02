%clc;
sample = xlsread('input.xlsx');
class = xlsread('class.xlsx');

w = zeros(1,3);
c = .1;
for i=1:100
    
   for j=1:length(class)
     for k=1:1
          D(k) = w(k,1) + w(k,2)*sample(j,1) + w(k,3)*sample(j,2);
      
          w(k,1) = w(k,1) - (c*(D(k)-class(j)));
          w(k,2) = w(k,2) - (c*(D(k)-class(j))*sample(j,1));
          w(k,3) = w(k,3) - (c*(D(k)-class(j))*sample(j,2));
%           fprintf('%.2f\t%.2f\t%.2f\n',w(1),w(2),w(3));
     end
   end
end
w
D = w(1,1) + (w(1,2)*2) + (w(1,3)*2);

if D >= 0
    disp('class: 1');
else
    disp('class: -1');
end
