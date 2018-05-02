clc;
a=.8;
f=10;
%t=0:.1:3;
sum1=(45*cos(45))+cos(45);
sum2=0;
for i=3:2:50
   sum3 =(2/((i*i)-1))*(cot(45)*sin(i*45)-((1/i)*cos(i*45)));
   sum2=sum2+sum3;
%     disp(sum2);
    
%      plot(sum2);
end
mainSum=sum1+sum2;
result=((2*a)/pi)*mainSum;
% t=1:.1:10;
plot(result);


