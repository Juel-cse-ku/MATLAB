clc;
x_0=0;
x1=0;
y_0=0
t=0:0.1:3*pi;
for rad=1:20
    x1=x1+1;
    x=x_0+rad*sin(t);
    y=y_0+rad*cos(t);
    x2=mod(x1,2);
    x3=mod(x1,3);
    if x2==0 && x3==0
        plot(x,y,'b','LineWidth',x1);
    elseif(x2==0)
        plot(x,y,'r','LineWidth',x1);
    elseif(x3==0)
        plot(x,y,'g','LineWidth',x1);
    else
        plot(x,y,'p','LineWidth',x1);
    end
    pause(0.3)
    hold on;
end
hold off;
        
        