clc;
a=imread('c.jpg');
%imshow(a);
b=rgb2gray(a);
% subplot(2,3,1);
% imshow(a);
% subplot(2,3,2);
% imshow(b);
%figure,imshow(b)
%figure,imshowpair(a,b,'montage');
d=imread('b.jpg');
m=imread('m.jpg');
% load mri
% montage(b,map)
% figure
% montage(b, map, 'Indices', 1:9);
fileFolder = fullfile(matlabroot,'toolbox','images','imdata');
dirOutput = dir(fullfile(fileFolder,'AT3_1m4_*.jpg'));
fileNames = {dirOutput.name};
fileNames =
'AT3_1m4_b.jpg'
'AT3_1m4_c.jpg'
'AT3_1m4_m.jpg'
montage(fileNames, 'Size', [2 5]);
