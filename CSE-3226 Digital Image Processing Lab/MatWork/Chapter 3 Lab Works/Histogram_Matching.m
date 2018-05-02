clc;
src = imread('Histogram_Matching.tif');
ref = imread('Histogram_Matching_Reference.tif');
ref = rgb2gray(ref);
[row_src,col_src] =size(src);
pixel_src = row_src *col_src;
[row_ref,col_ref] =size(ref);
pixel_ref = row_ref *col_ref;
color_src = zeros(256,1);
color_ref = zeros(256,1);
prob_src = zeros(256,1);
prob_ref = zeros(256,1);
count_src = 0;
count_ref = 0;
output = zeros(256,1);
matched = zeros(256,1);
out = zeros(row_src,col_src);

%Finding Original Image Histogram
for index = 0:255
    for i = 1:row_src
        for j = 1:col_src
            if(src(i,j)==index)
                count_src = count_src + 1;
            end
        end
    end
    color_src(index+1) = count_src;
    prob_src(index+1) = color_src(index+1);
    prob_src(index+1) = prob_src(index+1)/pixel_src;
    count_src = 0;
end

%Finding Reference Histogram
for index = 0:255
    for i = 1:row_ref
        for j = 1:col_ref
            if(ref(i,j)==index)
                count_ref = count_ref + 1;
            end
        end
    end
    color_ref(index+1) = count_ref;
    prob_ref(index+1) = color_ref(index+1);
    prob_ref(index+1) = prob_ref(index+1)/pixel_ref;
    count_ref = 0;
end

%Histogram Equalization value of s = T(r)
for i = 1:256
    for j = 1:i
        output(i) = output(i) + prob_src(j);
    end
    output(i) = round(output(i)*255);
end


%Finding value of s = G(z)
for i = 1:256
    for j = 1:i
        matched(i) = matched(i) + prob_ref(j);
    end
    matched(i) = round(matched(i)*255);
end


final = output;

%Matching of s and G(z)
for i = 1:256
    %Finding minimum difference
       minimum = min(abs(output(i)-matched));
    %Mapping s = z
    for k = 1:256
        if(abs(output(i)-matched(k)) == minimum)
            final(i) = k;
        end
    end
end

%Putting r = s = z
for i = 1:row_src
    for j = 1:col_src
        out(i,j) = final(src(i,j)+1);
    end
end
out = uint8(out);

subplot(2,4,1);
imshow(src);title('Original image');
subplot(2,4,2);
imshow(ref);title('Target image');
subplot(2,4,3);
imshow(out);title('Matched image');



%Using inhistmatch function
out = imhistmatch(src,ref);
subplot(2,4,4);
imshow(out);title('Matched image using function');

subplot(2,4,5);
imhist(src);title('Original histogram');
subplot(2,4,6);
imhist(ref);title('Target histogram');
subplot(2,4,7);
imhist(out);title('Matched histogram');
subplot(2,4,8);
imhist(out);title('Matched histogram using function');
imwrite(out,'Histogram_Matched.jpg','jpg');
imwrite(out,'Histogram_Matched Function.jpg','jpg');