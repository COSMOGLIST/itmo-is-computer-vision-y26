kot=imread("kot2.jpg");

subplot(1, 3, 1)
imshow(kot)

R = kot(:, :, 1);
G = kot(:, :, 2);
B = kot(:, :, 3);
sizeF1 = [3, 3];
sizeF2 = [5, 5];

R_filtered_1 = imgaussfilt(R, sizeF1);
G_filtered_1 = imgaussfilt(G, sizeF1);
B_filtered_1 = imgaussfilt(B, sizeF1);

cat_filt_1 = zeros(size(kot), 'uint8');
cat_filt_1(:,:,1) = R_filtered_1;
cat_filt_1(:,:,2) = G_filtered_1;
cat_filt_1(:,:,3) = B_filtered_1;

subplot(1, 3, 2)
imshow(cat_filt_1)

R_filtered_2 = imgaussfilt(R, sizeF2);
G_filtered_2 = imgaussfilt(G, sizeF2);
B_filtered_2 = imgaussfilt(B, sizeF2);
cat_filt_2 = zeros(size(kot), 'uint8');
cat_filt_2(:,:,1) = R_filtered_2;
cat_filt_2(:,:,2) = G_filtered_2;
cat_filt_2(:,:,3) = B_filtered_2;
subplot(1, 3, 3)
imshow(cat_filt_2)