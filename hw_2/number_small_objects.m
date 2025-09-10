img = imread('res3.jpg');
grayImg = rgb2gray(img);

bw = imbinarize(grayImg, 'adaptive');
cleanBw = bwareaopen(bw, 50);

smallObjects = cleanBw;
stats = regionprops(smallObjects, 'Area');
areas = [stats.Area];

smallThreshold = 10000;
minsmallThreshold = 200;

smallObjectsIndices = find((areas >= minsmallThreshold) & (areas <= smallThreshold));
numSmallObjects = length(smallObjectsIndices);

labelMat = bwlabel(cleanBw);
smallLabels = ismember(labelMat, smallObjectsIndices);

figure;
subplot(1,2,1); imshow(img); title('Исходное изображение');
subplot(1,2,2); imshow(smallLabels); 
title(['Мелкие объекты: ', num2str(numSmallObjects), ' шт (размер ', ...
      num2str(minsmallThreshold), '-', num2str(smallThreshold), ' px)']);