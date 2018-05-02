clc;

%Reading Dataset
dataset = dir('E:\Academic\4th Year 2nd Term\CSE-4224 Data Warehousing and Mining Lab\Discimilar Image\dataset\*.jpg');

% Variable Declaration
feature = zeros(15,9);
average_matrix = zeros(15,15);

distance_mean_R = zeros(15,15);
distance_mean_G = zeros(15,15);
distance_mean_B = zeros(15,15);

distance_median_R = zeros(15,15);
distance_median_G = zeros(15,15);
distance_median_B = zeros(15,15);

distance_range_R = zeros(15,15);
distance_range_G = zeros(15,15);
distance_range_B = zeros(15,15);

% Creating Feature
for i=1: length(dataset)
    img_name = strcat('E:\Academic\4th Year 2nd Term\CSE-4224 Data Warehousing and Mining Lab\Discimilar Image\dataset\',dataset(i).name);
    img = imread(img_name);
    
    R = img(:,:,1);
    G = img(:,:,2);
    B = img(:,:,3);
    
    mean_R = double(mean(R(:)));
    mean_G = double(mean(G(:)));
    mean_B = double(mean(B(:)));
    
    median_R = double(median(R(:)));
    median_G = double(median(G(:)));
    median_B = double(median(B(:)));
    
    range_R = double(range(R(:)));
    range_G = double(range(G(:)));
    range_B = double(range(B(:)));
    
    feature(i,:) = [mean_R mean_G mean_B median_R median_G median_B range_R range_G range_B];
    
end
% Distance Counting
for i=1: length(dataset)
    for j=1: (i-1)
       distance_mean_R(i,j) = pdist2(feature(i,1),feature(j,1),'euclidean');
       distance_mean_G(i,j) = pdist2(feature(i,2),feature(j,2),'euclidean');
       distance_mean_B(i,j) = pdist2(feature(i,3),feature(j,3),'euclidean');
       
       distance_median_R(i,j) = pdist2(feature(i,4),feature(j,4),'euclidean');
       distance_median_G(i,j) = pdist2(feature(i,5),feature(j,5),'euclidean');
       distance_median_B(i,j) = pdist2(feature(i,6),feature(j,6),'euclidean');
       
       distance_range_R(i,j) = pdist2(feature(i,7),feature(j,7),'euclidean');
       distance_range_G(i,j) = pdist2(feature(i,8),feature(j,8),'euclidean');
       distance_range_B(i,j) = pdist2(feature(i,9),feature(j,9),'euclidean');
    end
end

% Average value of Distance Matrix
for i=1: length(dataset)
   for j=1: (i-1)
       average_matrix(i,j) = (distance_mean_R(i,j) + distance_mean_G(i,j) + distance_mean_B(i,j) + distance_median_R(i,j) + distance_median_G(i,j) +  distance_median_B(i,j) + distance_range_R(i,j) + distance_range_G(i,j) + distance_range_B(i,j))/9;
   end
end
% Finding MAX element
max_element = max(average_matrix(:));

for i=1: length(dataset)
    for j=1: length(dataset)
        if max_element == average_matrix(i,j)
            r=i;
            c=j;
            break;
        end
    end
end


% Showing Most 2 Discimilar Images
subplot(2,1,1);
suptitle('Most 2 Discimilar Images');
img_name = strcat('E:\Academic\4th Year 2nd Term\CSE-4224 Data Warehousing and Mining Lab\Discimilar Image\dataset\',dataset(r).name);
imshow(img_name);
title(dataset(r).name);

subplot(2,1,2);
img_name = strcat('E:\Academic\4th Year 2nd Term\CSE-4224 Data Warehousing and Mining Lab\Discimilar Image\dataset\',dataset(c).name);
imshow(img_name);
title(dataset(c).name);
