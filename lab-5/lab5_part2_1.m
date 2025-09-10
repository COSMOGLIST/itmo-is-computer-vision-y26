image=imread("noised.jpg");

subplot(1, 3, 1);
imshow(image);
title('Оригинал');

image=im2double(image);
image = image + 0.3;
image = min(image, 1);

subplot(1, 3, 2);
imshow(image);
title('Высветленное');
imwrite(image, 'bright.jpg');

gauss_mean = 0;
gauss_disp = 0.01;
image = image - (gauss_mean + sqrt(gauss_disp) * randn(size(image)));
image = max(0, min(image, 1));

subplot(1, 3, 3);
imshow(image);
title('С вычтенным шумом');
imwrite(image, 'bright_noise.jpg')
