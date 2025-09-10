kot=imread("kot1.jpg");
subplot(1, 3, 1)
imshow(kot)

R = kot(:, :, 1);
G = kot(:, :, 2);
B = kot(:, :, 3);

R_filtered_1 = edge(R, 'prewitt', 'horizontal');
G_filtered_1 = edge(G, 'prewitt', 'horizontal');
B_filtered_1 = edge(B, 'prewitt', 'horizontal');

cat_filt_1 = zeros(size(kot), 'double');
cat_filt_1(:,:,1) = R_filtered_1;
cat_filt_1(:,:,2) = G_filtered_1;
cat_filt_1(:,:,3) = B_filtered_1;

subplot(1, 3, 2)
imshow(cat_filt_1);
title('horizontal');

R_filtered_2 = edge(R, 'prewitt', 'vertical');
G_filtered_2 = edge(G, 'prewitt', 'vertical');
B_filtered_2 = edge(B, 'prewitt', 'vertical');

cat_filt_2 = zeros(size(kot), 'double');
cat_filt_2(:,:,1) = R_filtered_2;
cat_filt_2(:,:,2) = G_filtered_2;
cat_filt_2(:,:,3) = B_filtered_2;

subplot(1, 3, 3)
imshow(cat_filt_2);
title('vertical')