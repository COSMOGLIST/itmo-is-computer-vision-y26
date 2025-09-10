kot=imread("Рис_ДЗ 2.2.jpg");

subplot(1, 2, 1)
imshow(kot)

R = kot(:, :, 1);
G = kot(:, :, 2);
B = kot(:, :, 3);
sizeF2 = [5, 5];

R_filtered_2 = medfilt2(R, sizeF2);
G_filtered_2 = medfilt2(G, sizeF2);
B_filtered_2 = medfilt2(B, sizeF2);
cat_filt_2 = zeros(size(kot), 'uint8');
cat_filt_2(:,:,1) = R_filtered_2;
cat_filt_2(:,:,2) = G_filtered_2;
cat_filt_2(:,:,3) = B_filtered_2;
subplot(1, 2, 2)
imshow(cat_filt_2)

imwrite(cat_filt_2, "res_2.jpg")