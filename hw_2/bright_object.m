img = imread('res3.jpg');
if size(img, 3) == 3
    grayImg = rgb2gray(img);
else
    grayImg = img;
end

bw = imbinarize(grayImg, 'adaptive');
cleanBw = bwareaopen(bw, 20);
stats = regionprops(cleanBw, grayImg, 'MeanIntensity', 'BoundingBox');
[~, brightestIdx] = max([stats.MeanIntensity]);

figure;
imshow(img);
hold on;
rectangle('Position', stats(brightestIdx).BoundingBox, ...
          'EdgeColor', 'y', 'LineWidth', 2, 'LineStyle', '--');
title(['Самый яркий объект (яркость: ', ...
       num2str(stats(brightestIdx).MeanIntensity), ')']);
hold off;