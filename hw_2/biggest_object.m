img = imread('res3.jpg');
grayImg = rgb2gray(img);

bw = imbinarize(grayImg, 'adaptive');
cleanBw = bwareaopen(bw, 50);

cc = bwconncomp(cleanBw);
stats = regionprops(cc, 'Area', 'BoundingBox');
[~, idx] = max([stats.Area]);
largestObj = ismember(labelmatrix(cc), idx);

figure;
imshow(img);
hold on;
rectangle('Position', stats(idx).BoundingBox, 'EdgeColor', 'r', 'LineWidth', 2);
title(['Наибольший объект площадью: ', num2str(stats(idx).Area), ' пикселей']);
hold off;