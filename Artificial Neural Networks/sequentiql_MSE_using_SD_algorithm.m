clc;
syms f(x) w1 w2;
f(x) = str2sym(input('Enter function: ','s'));

%subs(f(x),[w1,w2],[0,0]);

for i=1:5
    if i==1
        fprintf('%.3f\t%.3f\t%.3f\t0.000\t0.000\n',subs(f(x),[w1,w2],[0,0]),subs(diff(f,w1),[w1,w2],[0,0]),subs(diff(f,w2),[w1,w2],[0,0]));
        old_w1 = 0;
        old_w2 = 0;
    else
        value_w1 = old_w1 - (.1 * subs(diff(f(x),w1),[w1,w2],[old_w1,old_w2]));
        value_w2 = old_w2 - (.1 * subs(diff(f(x),w2),[w1,w2],[old_w1,old_w2]));
        
        old_w1 = value_w1;
        old_w2 = value_w2;
        fprintf('%.3f\t%.3f\t%.3f\t%.3f\t%.3f\n',subs(f(x),[w1,w2],[old_w1,old_w2]),subs(diff(f(x),w1),[w1,w2],[old_w1,old_w2]),subs(diff(f(x),w2),[w1,w2],[old_w1,old_w2]),old_w1,old_w2);
    end
    
end
