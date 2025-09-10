bright=imread("bright.jpg");
bright_noise=imread("bright_noise.jpg");

sizef1=[3 3];
R = bright(:,:,1);
G = bright(:,:,2);
B = bright(:,:,3);
R_filtered_bright = medfilt2(R, sizef1);
G_filtered_bright = medfilt2(G, sizef1);
B_filtered_bright = medfilt2(B, sizef1);
filtered_bright = zeros(size(bright), 'uint8');
filtered_bright(:,:,1) = R_filtered_bright;
filtered_bright(:,:,2) = G_filtered_bright;
filtered_bright(:,:,3) = B_filtered_bright;

subplot(2, 2, 1);
imshow(bright);
title('Высветленное');

subplot(2, 2, 2);
imshow(filtered_bright);
title('Высветленное с фильтром');

sizef2=[5 5];
R = bright_noise(:,:,1);
G = bright_noise(:,:,2);
B = bright_noise(:,:,3);
R_filtered_bright = medfilt2(R, sizef2);
G_filtered_bright = medfilt2(G, sizef2);
B_filtered_bright = medfilt2(B, sizef2);
filtered_bright_noise = zeros(size(bright_noise), 'uint8');
filtered_bright_noise(:,:,1) = R_filtered_bright;
filtered_bright_noise(:,:,2) = G_filtered_bright;
filtered_bright_noise(:,:,3) = B_filtered_bright;

subplot(2, 2, 3);
imshow(bright_noise);
title('Выстветленное с шумом');

subplot(2, 2, 4);
imshow(filtered_bright_noise);
title('Выстветленное с шумом и фильтром');

orig=imread("noised.jpg");
fprintf('Стандартное отклонение исходного изображения: %.4f\n', std2(orig));
fprintf('Стандартное отклонение НЕ отфильтрованного высветленного изображения: %.4f\n', std2(bright));
fprintf('Стандартное отклонение отфильтрованного высветленного изображения: %.4f\n', std2(filtered_bright));
fprintf('Стандартное отклонение НЕ отфильтрованного высветленного изображения с шумом: %.4f\n', std2(bright_noise));
fprintf('Стандартное отклонение отфильтрованного высветленного изображения с шумом: %.4f\n', std2(filtered_bright_noise));