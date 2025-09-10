image_stand_out=imread("stand_out.jpg");
[numRows, numCols, Layers] = size(image_stand_out);

subplot(3, 1, 1);
horizontal_projection = zeros(numCols, 1); 
for i=1:1:numCols
    horizontal_projection(i,1)=(round(sum(image_stand_out(:,i,1)))+round(sum(image_stand_out(:,i,2)))+round(sum(image_stand_out(:,i,3))))/(256*3);
end
plot(horizontal_projection);
title('horizontal projection')

subplot(3, 1, 2);
vertical_projection = zeros(numRows, 1); 
for i=1:1:numRows
    vertical_projection(i,1)=(round(sum(image_stand_out(i,:,1)))+round(sum(image_stand_out(i,:,2)))+round(sum(image_stand_out(i,:,3))))/(256*3);
end
plot(vertical_projection);
title('vertical projection')

subplot(3, 1, 3);
imshow(image_stand_out);
threshold = 0.999 * max(horizontal_projection);
horizontal_boundaries = [];
for i = 2:numCols
    if horizontal_projection(i) < threshold && horizontal_projection(i-1) >= threshold
        horizontal_boundaries = [horizontal_boundaries; i];
    elseif horizontal_projection(i) >= threshold && horizontal_projection(i-1) < threshold
        horizontal_boundaries = [horizontal_boundaries; i];
    end
end

for i = 1:length(horizontal_boundaries)
    line([horizontal_boundaries(i) horizontal_boundaries(i)], [1 numRows], 'Color', 'b');
end

threshold = 0.999 * max(vertical_projection);
vertical_boundaries = [];
for i = 2:numRows
    if vertical_projection(i) < threshold && vertical_projection(i-1) >= threshold
        vertical_boundaries = [vertical_boundaries; i];
    elseif vertical_projection(i) >= threshold && vertical_projection(i-1) < threshold
        vertical_boundaries = [vertical_boundaries; i];
    end
end

for i = 1:length(vertical_boundaries)
    line([1 numCols], [vertical_boundaries(i) vertical_boundaries(i)], 'Color', 'b');
end
