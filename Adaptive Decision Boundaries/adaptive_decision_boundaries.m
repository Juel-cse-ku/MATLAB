clc;

% data = input('number of samples: ','s');
% n_samples = str2double(data);
% 
% data = input('number of features: ','s');
% n_features = str2double(data);
% 
% samples = zeros(10,10);
% 
% for i=1:n_samples
%     M = ['for sample ',num2str(i),' :'];
%     disp(M);
%     for j=1: n_features + 1
%         if(j <= n_features)
%             M = ['feature ',num2str(j),' :'];
%             data = input(M,'s');
%             samples(i,j) = str2double(data);
%         else
%             M = ['class',num2str(j-1),' :'];
%             data = input(M,'s');
%             samples(i,j) = str2double(data);
%         end
%     end
% end
samples = xlsread('input.xlsx');
[r,c] = size(samples);
n_samples = r;
n_features = c-1;


weight = zeros(n_features + 1,1);

error = zeros(n_samples,1);
iteration = 0;
C=1;
K=1;
%min(error(:)) == 0


while min(error(:)) == 0

    for i=1:n_samples
        
        if(min(error(:)) ~= 0)
            break;
        end
        iteration = iteration  + 1;
        D = 0;
  
        for j=0:n_features
            if(j==0)
                D = weight(1,1);
            else
                D = D + weight(j+1,1)*samples(i,j);
            end
        end
        
        if(D >= samples(i,n_features+1) && samples(i,n_features+1)>0)
            error(i,1) = 1;
        elseif(samples(i,n_features+1)<0 && D <= samples(i,n_features+1))
            error(i,1) = 1;
        else
            error(i,1) = 0;
            for m=1:n_features+1
                if(m==1)
                    weight(m,1) = weight(m,1) + (C*K*samples(i,n_features+1));
                else
                    weight(m,1) = weight(m,1) + (C*samples(i,n_features+1)*samples(i,m-1));
                end
            end
                     
        end
        
    end
end

M = ['iteration required ',num2str(iteration),' times'];
disp(M);

disp('Final Weight List:');
for i=1:n_features+1
    M = ['W',num2str(i-1),' = ',num2str(weight(i,1))];
    disp(M);
end