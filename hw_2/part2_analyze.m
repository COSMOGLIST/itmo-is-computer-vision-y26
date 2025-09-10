img = imread('res_2_4.jpg');
figure; imshow(img); title('Исходное изображение');

%% a) Два красных объекта на максимальном расстоянии
redChannel = img(:,:,1);
greenChannel = img(:,:,2);
blueChannel = img(:,:,3);
redObjects = redChannel > 150 & greenChannel < 100 & blueChannel < 100;

redObjects = bwareaopen(redObjects, 50);
redObjects = imfill(redObjects, 'holes');

redStats = regionprops(redObjects, 'Centroid');
redCentroids = cat(1, redStats.Centroid);

if size(redCentroids,1) >= 2
    distances = pdist(redCentroids);
    distanceMatrix = squareform(distances);
    [maxDist, idx] = max(distanceMatrix(:));
    [obj1, obj2] = ind2sub(size(distanceMatrix), idx);
    
    figure;
    imshow(img); hold on;
    plot(redCentroids([obj1 obj2],1), redCentroids([obj1 obj2],2), 'yx', 'MarkerSize', 15, 'LineWidth', 2);
    plot(redCentroids([obj1 obj2],1), redCentroids([obj1 obj2],2), 'm-', 'LineWidth', 2);
    title(['Два самых далеких красных объекта: расстояние = ', num2str(maxDist)]);
    hold off;
else
    disp('Не найдено достаточно красных объектов для анализа');
end

%% b) Два зеленых объекта на минимальном расстоянии
greenObjects = greenChannel > 150 & redChannel < 100 & blueChannel < 100;
greenObjects = bwareaopen(greenObjects, 50);
greenObjects = imfill(greenObjects, 'holes');

greenStats = regionprops(greenObjects, 'Centroid');
greenCentroids = cat(1, greenStats.Centroid);

if size(greenCentroids,1) >= 2
    distances = pdist(greenCentroids);
    distanceMatrix = squareform(distances);
    distanceMatrix(distanceMatrix == 0) = Inf;
    [minDist, idx] = min(distanceMatrix(:));
    [obj1, obj2] = ind2sub(size(distanceMatrix), idx);

    figure;
    imshow(img); hold on;
    plot(greenCentroids([obj1 obj2],1), greenCentroids([obj1 obj2],2), 'wx', 'MarkerSize', 15, 'LineWidth', 2);
    plot(greenCentroids([obj1 obj2],1), greenCentroids([obj1 obj2],2), 'm-', 'LineWidth', 2);
    title(['Два самых близких зеленых объекта: расстояние = ', num2str(minDist)]);
    hold off;
else
    disp('Не найдено достаточно зеленых объектов для анализа');
end

%% c) Наибольший по площади синий объект
blueObjects = blueChannel > 150 & redChannel < 100 & greenChannel < 100;
blueObjects = bwareaopen(blueObjects, 50);
blueObjects = imfill(blueObjects, 'holes');

blueStats = regionprops(blueObjects, 'Area', 'BoundingBox');
if ~isempty(blueStats)
    [~, idx] = max([blueStats.Area]);
    figure;
    imshow(img); hold on;
    rectangle('Position', blueStats(idx).BoundingBox, 'EdgeColor', 'm', 'LineWidth', 2);
    title('Наибольший по площади синий объект');
    hold off;
else
    disp('Синие объекты не найдены');
end

%% d) Квадратные объекты
allObjects = imbinarize(rgb2gray(img), 'adaptive');
allObjects = bwareaopen(allObjects, 50);
allObjects = imfill(allObjects, 'holes');

stats = regionprops(allObjects, 'Area', 'BoundingBox', 'Extent');
aspectRatios = zeros(1, length(stats));
squareIndices = [];

for i = 1:length(stats)
    bbox = stats(i).BoundingBox;
    aspectRatio = bbox(3)/bbox(4);
    aspectRatios(i) = aspectRatio;
    if abs(aspectRatio - 1) < 0.2 && stats(i).Extent > 0.8
        squareIndices = [squareIndices i];
    end
end

figure;
imshow(img); hold on;
for i = squareIndices
    rectangle('Position', stats(i).BoundingBox, 'EdgeColor', 'm', 'LineWidth', 2);
end
title(['Квадратные объекты: найдено ', num2str(length(squareIndices)), ' шт.']);
hold off;