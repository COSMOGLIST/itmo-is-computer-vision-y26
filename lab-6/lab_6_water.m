img = imread('rat1.jpg');
img = rgb2gray(img);
[labels, fg_markers, bg_markers] = watershed_segmentation(img);

imshow(label2rgb(labels, 'jet', 'k', 'shuffle'));
title('Окончательная сегментация');

function [labels, foreground_markers, background_markers] = watershed_segmentation(img)
    se = strel('disk', 5);
    img = imclose(img, se);

    bw = imbinarize(img);
    D = bwdist(~bw);

    mask = imextendedmax(D, 2);

    foreground_markers = bwlabel(mask);
    num_objects = max(foreground_markers(:));

    background_markers = ~bw;
    background_markers = imdilate(background_markers, strel('disk', 3));

    markers = foreground_markers;
    markers(background_markers) = num_objects + 1;

    D = imcomplement(D);
    D = imimposemin(D, markers);
    labels = watershed(D);

    subplot(2,2,1); imshow(img); title('Исходное изображение');
    subplot(2,2,2); imshow(D,[]); title('Преобразование расстояния');
    subplot(2,2,3); imshow(label2rgb(markers)); title('Маркеры');
    subplot(2,2,4); imshow(label2rgb(labels)); title('Результат сегментации');
end