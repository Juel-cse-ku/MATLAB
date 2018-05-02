function colorMoments = colorMoment(image)

%imgGray = double(rgb2gray(image));
%imgGray = imresize(imgGray, [256 256]);
%meanC=mean(imgGray(:));
%stdC=std(imgGray(:));
%sknC=skewness(imgGray);
image = imread('E:\Teaching\Courses\DIP\images\Experiment\b.jpg');
R = double(image(:, :, 1));
G = image(:, :, 2);
B = image(:, :, 3);
%disp(R);
%disp(G);
%imshow(R);
%figure,imshow(G);
meanR = mean( R(:) );
stdR  = std( R(:) );
%sknR=skewness(R(:));
%meanG = mean( G(:) );
%stdG  = std( G(:) );
%sknG=skewness(G(:));
%meanB = mean( B(:) );
%stdB  = std( B(:) );
%sknB=skewness(B(:));

colorMoments = zeros(1, 2);
colorMoments(1, :) = [meanR stdR];

%clear('R','G','B','meanR','stdR','meanG','stdG','meanB','stdB');

end