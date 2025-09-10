originalImg = imread('rat1.jpg');
maskImg = imread('ЛР6_1.jpg');

maskImg = rgb2gray(maskImg);
binaryMask = imbinarize(maskImg);
binaryMask = imresize(binaryMask, [size(originalImg, 1), size(originalImg, 2)]);
segmentedImg = bsxfun(@times, originalImg, uint8(binaryMask));

subplot(1,3,1); imshow(originalImg); title('Исходное изображение');
subplot(1,3,2); imshow(maskImg); title('Маска');
subplot(1,3,3); imshow(segmentedImg); title('Сегментированное изображение');