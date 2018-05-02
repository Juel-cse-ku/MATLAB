%clc;

samples = xlsread('input.xlsx');
[r,c] = size(samples);
distance_mat = NaN(r,r);
cluster = zeros(r,r);

for i=1:r
    for j=1:r
        if( i==j)
            cluster(i,j) = i;
            break;
        else
            distance_mat(i,j) = pdist2(samples(i,:),samples(j,:),'euclidean');
        end
    end
end

for a=1:r-2
   for i=1:r
        f=0;
        for j=1:r
            if distance_mat(i,j) == min(distance_mat(:))
                row = i;
                col = j;
                f=1;
                break;
            end
        end
        if f==1
            break;
        end
    end
    distance_mat(row,col) = NaN;
    distance_mat(col,row) = NaN;
    
    for i=1:r
        if((cluster(col,i)) ~= 0)
            cluster(row,i) = i;
            cluster(col,i) = 0;
        end
        if(distance_mat(i,row) < distance_mat(i,col))
            distance_mat(i,row) = distance_mat(i,col);
            distance_mat(i,col) = NaN;
        else
            distance_mat(i,col) = NaN;
        end
        if(distance_mat(row,i) < distance_mat(col,i))
            distance_mat(row,i) = distance_mat(col,i);
            distance_mat(col,i) = NaN;
        else
            distance_mat(col,i) = NaN;
        end
    end
    fprintf('step %i: ',a);
    for k=1:r
        if(cluster(k,k) ~= 0)
            fprintf('[');
            for m=1:r
                if(cluster(k,m) ~= 0)
                    fprintf('%i,',m);
                end
            end
            fprintf('\b],');
        end
    end
    fprintf('\n');
    
end
% Z = linkage(samples,'complete');                                                                  
% dendrogram(Z);
