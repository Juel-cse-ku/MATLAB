%clc;

samples = xlsread('input.xlsx');
[r,c] = size(samples);

n_samples = r;
n_features = c-1;

syms f(x) E(x) W0 W1 W2 x1 x2;

E(x) = 0;
for i=1:n_samples
    f(x) = W0 + (W1*samples(i,1)) + (W2*samples(i,2));
    E(x) = E(x) + (f(x) - samples(i,3))^2;
end

solution = solve([(diff(E,W0)==0), (diff(E,W1)==0), (diff(E,W2)==0)], [W0, W1, W2]);

fprintf('W0 = %f\n',solution.W0);
fprintf('W1 = %f\n',solution.W1);
fprintf('W2 = %f\n',solution.W2);

