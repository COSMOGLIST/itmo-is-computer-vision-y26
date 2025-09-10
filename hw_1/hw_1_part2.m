img = imread('рис.png');
figure; imshow(img); title('Исходное изображение');
hold on;
[x, y] = ginput(4);
plot(x, y, 'ro', 'MarkerSize', 10);

width = 500;
height = 500;
target_points = [1, 1; width, 1; width, height; 1, height];
source_points = [x, y];
H = fitgeotrans(source_points, target_points, 'projective');


output_view = imref2d([height, width]);
corrected_img = imwarp(img, H, 'OutputView', output_view);
[height, width, ~] = size(corrected_img);

[Y, X] = meshgrid(1:width, 1:height);
scale_factor_Y = 1 + 0.4*(Y/height);
scale_factor_X = 1 + 0.5*(X/width);

scaled_img = corrected_img;
for channel = 1:3
    scaled_img(:, :, channel) = interp2(double(corrected_img(:, :, channel)), Y .* scale_factor_Y, X.*scale_factor_X, 'linear', 0);
end


mask = any(scaled_img > 0, 3);  
[rows, cols] = find(mask);  
crop_rect = [min(cols), min(rows), max(cols)-min(cols), max(rows)-min(rows)];  
scaled_img = imcrop(scaled_img, crop_rect);

subplot(1,3,1); imshow(img); title('Исходное изображение');
subplot(1,3,2); imshow(corrected_img); title('Скорректированное');
subplot(1,3,3); imshow(scaled_img); title('Скорректированное масштабированное');