img = imread('rat1.jpg');
img = rgb2gray(img); 

global_thresh = graythresh(img);
binary_global = imbinarize(img, global_thresh);

subplot(1,3,1); imshow(img); title('Исходное изображение');
subplot(1,3,2); imshow(binary_global); title('Глобальная бинаризация (Оцу)');

block_size = 32;
binary_local = zeros(size(img));
for i = 1:block_size:size(img, 1)
    for j = 1:block_size:size(img, 2)
        row_end = min(i + block_size - 1, size(img, 1));
        col_end = min(j + block_size - 1, size(img, 2));
        block = img(i:row_end, j:col_end);
        local_thresh = graythresh(block);
        binary_local(i:row_end, j:col_end) = imbinarize(block, local_thresh);
    end
end

subplot(1,3,3); imshow(binary_local); title('Локальная бинаризация (Оцу по блокам)');