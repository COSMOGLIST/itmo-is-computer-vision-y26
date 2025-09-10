img=imread("Рис_ДЗ 2.2.jpg");

R = img(:, :, 1);
G = img(:, :, 2);
B = img(:, :, 3);
sizeF1 = [3, 3];

R_filtered_1 = imgaussfilt(R, sizeF1);
G_filtered_1 = imgaussfilt(G, sizeF1);
B_filtered_1 = imgaussfilt(B, sizeF1);

img_filt_1 = zeros(size(img), 'uint8');
img_filt_1(:,:,1) = R_filtered_1;
img_filt_1(:,:,2) = G_filtered_1;
img_filt_1(:,:,3) = B_filtered_1;

img_new=im2double(img_filt_1);

img_red=im2double(img_filt_1(:,:,1));
img_red_min=min(img_red(:));
img_red_max=max(img_red(:));
limit_red_new_min=0;
limit_red_new_max=1;
img_red_new=(img_red-img_red_min)/(img_red_max-img_red_min)*(limit_red_new_max-limit_red_new_min)+limit_red_new_min;
img_new(:,:,1)=img_red_new;

img_green=im2double(img_filt_1(:,:,2));
img_green_min=min(img_green(:));
img_green_max=max(img_green(:));
limit_green_new_min=0;
limit_green_new_max=1;
img_green_new=(img_green-img_green_min)/(img_green_max-img_green_min)*(limit_green_new_max-limit_green_new_min)+limit_green_new_min;
img_new(:,:,2)=img_green_new;

img_blue=im2double(img_filt_1(:,:,3));
img_blue_min=min(img_blue(:));
img_blue_max=max(img_blue(:));
limit_blue_new_min=0;
limit_blue_new_max=1;
img_blue_new=(img_blue-img_blue_min)/(img_blue_max-img_blue_min)*(limit_blue_new_max-limit_blue_new_min)+limit_blue_new_min;
img_new(:,:,3)=img_blue_new;

subplot(1, 2, 1)
imshow(img_filt_1)

subplot(1, 2, 2)
imshow(img_new)

imwrite(img_new, 'res_2.jpg')