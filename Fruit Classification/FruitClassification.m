 clc;
dataset = dir('E:\Academic\4th Year 2nd Term\CSE-4222 Pattern Recognition Lab\Fruit Classification\dataset\*.jpg');

[~,class] = xlsread('name.xlsx');

%features extraction
t = .7;
feature = zeros(length(dataset),10);
for  i=1:length(dataset)
    imgName = strcat('E:\Academic\4th Year 2nd Term\CSE-4222 Pattern Recognition Lab\Fruit Classification\dataset\',dataset(i).name);
    img = imread(imgName);
    
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
    
    b = (0.2989 * double(R) + 0.5870 * double(G) + 0.1140 * double(B))/255;
    c = b < t;
    shape = sum(c(:));
    
    feature(i,:) = [mean_R mean_G mean_B median_R median_G median_B range_R range_G range_B shape];
end



%prediction
test_dataset = dir('E:\Academic\4th Year 2nd Term\CSE-4222 Pattern Recognition Lab\Fruit Classification\test_data_set\*.jpg');
testing_feature = zeros(length(test_dataset),10);
for i=1: length(test_dataset)
    imgName = strcat('E:\Academic\4th Year 2nd Term\CSE-4222 Pattern Recognition Lab\Fruit Classification\test_data_set\',test_dataset(i).name);
    img = imread(imgName);
    
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
    
    b = (0.2989 * double(R) + 0.5870 * double(G) + 0.1140 * double(B))/255;
    c = b<t;
    shape = sum(c(:));
    
    testing_feature(i,:) = [mean_R mean_G mean_B median_R median_G median_B range_R range_G range_B shape];
    
%     subplot(1,length(test_dataset),i);
%     imshow(img);
%     title(predict(training, testing_feature(i,:)));
end

distance = pdist2(testing_feature,feature,'cityblock');
distance = distance ./ (1.0e+03);

count = zeros(size(distance,1),5);
t = 2;
for i=1:size(distance,1)
    for j=1:20
        if distance(i,j)<= t
            count(i,1) = count(i,1) + 1;
        end
        if distance(i,j+20) <= t
            count(i,2) = count(i,2) + 1;
        end
        if distance(i,j+40) <= t
            count(i,3) = count(i,3) + 1;
        end
        if distance(i,j+60) <= t
            count(i,4) = count(i,4) + 1;
        end
        if distance(i,j+80) <= t
            count(i,5) = count(i,5) + 1;
        end
    
    end
end
class_probability = zeros(size(count,1),5);
for i=1:size(count,1)
    for j=1:5
        class_probability(i,j) = count(i,j) * .2;
    end
end
nb = zeros(size(count,1),1);
for i=1:size(count,1)
    a = sum(class_probability(i,:));
    nb(1,1) = class_probability(i,1) / a;
    nb(2,1) = class_probability(i,2) / a;
    nb(3,1) = class_probability(i,3) / a;
    nb(4,1) = class_probability(i,4) / a;
    nb(5,1) = class_probability(i,5) / a;
    
    [r,c] = max(nb);
    
    subplot(1,size(count,1),i);
    imgName = strcat('E:\Academic\4th Year 2nd Term\CSE-4222 Pattern Recognition Lab\Fruit Classification\test_data_set\',test_dataset(i).name);                                                                                                            c=i;
    img = imread(imgName);
    imshow(img);
    if c==1
        title('APPLE');
    elseif c==2
        title('BANANA');
    elseif c==3
        title('MANGO');
    elseif c==4
        title('ORANGE');
    else
        title('STRAWBERRY');
    end

end

fclose('all');
 