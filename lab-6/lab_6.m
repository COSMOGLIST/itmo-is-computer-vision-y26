img = imread('rat1.jpg');

x = [350, 500, 700, 500, 350];
y = [350, 200, 400, 700, 400];

[rows, cols, ~] = size(img);
[X, Y] = meshgrid(1:cols, 1:rows);
mask = inpolygon(X, Y, x, y);

masked_img = bsxfun(@times, img, uint8(mask));

subplot(1,2,1); imshow(img); title('Исходное изображение');
subplot(1,2,2); imshow(masked_img); title('Вырезанный пятиугольник');