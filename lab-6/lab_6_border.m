img = imread('rat1.jpg');
img = rgb2gray(img);

sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];
Gx = imfilter(double(img), sobel_x, 'same');
Gy = imfilter(double(img), sobel_y, 'same');
gradient_magnitude = sqrt(Gx.^2 + Gy.^2);
gradient_normalized = mat2gray(gradient_magnitude);
binary_edges = imbinarize(gradient_normalized, 0.1);

subplot(1,3,1); imshow(img); title('Исходное');
subplot(1,3,2); imshow(binary_edges); title('Границы (Собель)');

edges_canny = edge(img, 'canny', [0.1 0.2]);
subplot(1,3,3); imshow(edges_canny); title('Границы (Кенни)');