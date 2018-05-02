%clc;

samples = xlsread('input.xlsx');
[r,c] = size(samples);
n_samples = r;
n_features = c-1;
n_class = 2;
n_weight = n_features+1;
iteration = 0;
C=1;
K=1;

error = zeros(n_samples,1);
weight = zeros(n_class,n_features + 1);
D_list = zeros(n_class,1);

while iteration <10
    iteration = iteration  + 1;
    f=0;
    for i=1:n_samples
        if(min(error(:)) ~= 0)
            f=1;
            break;
        end
       
        for j=1:n_class
            for k=1:n_weight
                if(k==1)
                    D_list(j,1) = weight(j,k);
                else
                    D_list(j,1) =  D_list(j,1) + (weight(j,k)*samples(i,k-1));
                end
            end
        end
        
        [~, index] = max(D_list(:));
        true_class = samples(i,n_features+1);
        calc_class = index;
        
        if(true_class == calc_class)
            error(i,1) = 1;
        else
            error(i,1) = 0;
            for j=1:n_features+1
                if(j==1)
                    weight(true_class,j) = weight(true_class,1) + (C*K);
                    weight(calc_class,j) = weight(calc_class,1) - (C*K);
                else
                    weight(true_class,j) = weight(true_class,j) + (C*samples(i,j-1));
                    weight(calc_class,j) = weight(calc_class,j) - (C*samples(i,j-1));
                end
            end
        end
    end
   if(f==1)
       break;
   end
end
        
disp('Final Weight List:');
weight