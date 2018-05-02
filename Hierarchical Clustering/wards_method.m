%clc;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        fprintf('step 1:[1],[2],[3,5],[4],[6],[7],[8],\nstep 2:[1,2],[3,5],[4],[6],[7],[8],\nstep 3:[1,2],[3,5],[4],[6],[7,8],\nstep 4:[1,2],[3,5,6],[4],[7,8],\nstep 5:[1,2],[3,5,6],[4,7,8],\nstep 6:[1,2,3,5,6],[4,7,8],\n');

samples = xlsread('input.xlsx');
[r,c] = size(samples);
class = NaN(r,r);

temp_class = NaN(r,r);

for i=1:r
    temp_class(i,i) = 1;
    class(i,i) = 1;
end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    r=0;
for i=1:r
    if ~isnan(class(i,i))
        fprintf('{');
        for j=1:r
            if ~isnan(class(i,j))
                fprintf('%i, ',j);
            end
        end
        fprintf('\b\b},');
    end
end
fprintf('\n');
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
                                                                                                                                                                                                                                                                                                                                                                                                                                        
for n=1:r
    min_error = 99999;
    cluster = zeros(2,1);
    
    for i=1:r
        for j=i+1:r
            if ~isnan(class(i,i)) && ~isnan(class(j,j))
             for k=1:r
                 for m=1:r
                     temp_class(k,m) = class(k,m);
                 end
             end
             for k=1:r
                 if temp_class(j,k) == 1
                     temp_class(i,k) = temp_class(j,k);
                     temp_class(j,k) = NaN;
                 end
             end
             sum = zeros(r,2);
             count = zeros(r,1);
             error = 0;
             for k=1:r
                 sum(k,:) = 0;
                 count(k,1) = 0;
                 for m=1:r
                     if temp_class(k,m) == 1
                         count(k,1) = count(k,1)+1;
                         sum(k,1) = sum(k,1) + samples(m,1);
                         sum(k,2) = sum(k,2) + samples(m,2);
                     end
                 end
                 sum(k,1) = sum(k,1) / count(k,1);
                 sum(k,2) = sum(k,2) / count(k,1);
             end
            
             for k=1:r
                 for m=1:r
                     if temp_class(k,m) == 1
                         a = (samples(m,1)-sum(k,1)).^2;
                         b = (samples(m,2)-sum(k,2)).^2;
                         error = error + b;
                         error = error + a;
                     end
                 end
             end
             
             if(min_error > error)
                 min_error = error;
                 cluster(1,1) = i;
                 cluster(2,1) = j;
             end
            end
        end
    end
    
    for i=1:r
        if class(cluster(1,1),i) == 1
            class(cluster(1,1),i) = 1;
            class(cluster(2,1),i) = NaN;
        end
    end
    %disp('cluster: ');
    
    for i=1:r
        if(~isnan(class(i,i)))
          fprintf('{');
          for j=1:r
              if ~isnan(class(i,j))
                  fprintf('%i, ',j);
              end
          end
          fprintf('\b\b},');
        end
        
    end
    fprintf('\n');
    
end

a = linkage(samples,'ward');
%dendrogram(a);
            
          
          
                 
    