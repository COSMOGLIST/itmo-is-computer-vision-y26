img=imread("Рис_ДЗ 1.3.png");
[height, width, channels] = size(img);

border_size = 0;
img_padded = uint8(zeros(height + 2*border_size, width + 2*border_size, channels));
img_padded(border_size+1:border_size+height, border_size+1:border_size+width, :) = img;

[height, width, ~] = size(img_padded);

center_x = width / 2;
center_y = height / 2;
k1 = -0.05;
k2 = -0.05;
k3 = 0;
[X, Y] = meshgrid(1:width, 1:height);

X_norm = (X - center_x) / center_x;
Y_norm = (Y - center_y) / center_y;
R = sqrt(X_norm.^2 + Y_norm.^2);
distortion_factor = 1 + k1 * R.^2 + k2 * R.^4 + k3 * R.^6;
X_corrected = X_norm .* distortion_factor;
Y_corrected = Y_norm .* distortion_factor;
X_corrected = X_corrected * center_x + center_x;
Y_corrected = Y_corrected * center_y + center_y;

corrected_img = zeros(height, width, 3, 'uint8');
for channel = 1:3
    corrected_img(:, :, channel) = uint8(interp2(...
        double(img_padded(:, :, channel)), ...
        X_corrected, Y_corrected, 'linear', 0));
end

corrected_img = uint8(corrected_img);

subplot(1, 3, 1); imshow(img); title('Искаженное изображение');

mask = any(corrected_img > 0, 3);  
[rows, cols] = find(mask);  
crop_rect = [min(cols), min(rows), max(cols)-min(cols), max(rows)-min(rows)];  
corrected_img = imcrop(corrected_img, crop_rect);

subplot(1, 3, 2); imshow(corrected_img); title('Скорректированное изображение');
subplot(1, 3, 3); imshow(imread('Рис_ДЗ 1.1.png')); title('Идеальное изображение');