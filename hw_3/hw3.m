%% 1. Загрузка исходного изображения
originalImage = imread('Рис_ДЗ 3 (2).jpg');

%% 2. Сегментация по цветам
hsvImage = rgb2hsv(originalImage);

redMask1 = hsvImage(:,:,1) < 0.05;
redMask2 = hsvImage(:,:,1) > 0.95;
redMask = (redMask1 | redMask2) & (hsvImage(:,:,2) > 0.4);
redMask = bwareaopen(redMask, 50);

whiteMask = (hsvImage(:,:,2) < 0.2) & (hsvImage(:,:,3) > 0.9);
whiteMask = bwareaopen(whiteMask, 20);

blueMask = (hsvImage(:,:,1) > 0.4) & (hsvImage(:,:,1) < 0.7) & (hsvImage(:,:,2) > 0.4);
blueMask = bwareaopen(blueMask, 100);

%% 3. Обработка объектов
redStats = regionprops(redMask, 'Centroid', 'BoundingBox');
animalCentroid = redStats(1).Centroid;

whiteStats = regionprops(whiteMask, 'Centroid', 'BoundingBox');

blueStats = regionprops(blueMask, 'Centroid', 'BoundingBox');
targetCentroid = blueStats(1).Centroid;

%% 4. Алгоритм построения пути
pathPoints = animalCentroid;
currentPos = animalCentroid;
remainingObjects = [whiteStats; blueStats];
maxSteps = length(remainingObjects) + 2;

for step = 1:maxSteps
    availableObjects = remainingObjects;
    if isempty(availableObjects)
        break;
    end
    
    distances = arrayfun(@(x) norm(currentPos - x.Centroid), availableObjects);
    [~, idx] = min(distances);
    closestObj = availableObjects(idx);

    pathPoints = [pathPoints; closestObj.Centroid];
    currentPos = closestObj.Centroid;
    remainingObjects(idx) = [];

    if ~isempty(find([blueStats.Centroid] == closestObj.Centroid, 1))
        break;
    end
end

%% 5. Визуализация результата
resultImage = originalImage;

bbox = blueStats(1).BoundingBox;
resultImage = insertShape(resultImage, 'Rectangle', bbox, 'LineWidth', 3, 'Color', 'cyan');

for i = 1:length(whiteStats)
    arrowBox = whiteStats(i).BoundingBox;
    resultImage = insertShape(resultImage, 'Rectangle', arrowBox, 'LineWidth', 2, 'Color', 'white');
end

resultImage = insertShape(resultImage, 'Line', [pathPoints(1:end-1,1), pathPoints(1:end-1,2), pathPoints(2:end,1), pathPoints(2:end,2)],'LineWidth', 3, 'Color', 'yellow');
resultImage = insertMarker(resultImage, pathPoints, 'o','Color', 'green', 'Size', 6);

figure; imshow(resultImage); title('Результат обработки');