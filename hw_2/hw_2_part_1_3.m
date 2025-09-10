rat=imread('res_2_2.jpg');
rat=im2double(rat);

rat_red=rat(:,:,1);
rat_green=rat(:,:,2);
rat_blue=rat(:,:,3);

laplacian = fspecial('laplacian', 1);

sharpened_red = rat_red - imfilter(rat_red, laplacian, 'replicate');
sharpened_blue = rat_blue - imfilter(rat_blue, laplacian, 'replicate');
sharpened_green = rat_green - imfilter(rat_green, laplacian, 'replicate');

rat_new_3=im2double(zeros(size(rat)));
rat_new_3(:,:,1)=sharpened_red;
rat_new_3(:,:,2)=sharpened_green;
rat_new_3(:,:,3)=sharpened_blue;

subplot(1, 2, 1);
imshow(rat);

subplot(1, 2, 2);
imshow(rat_new_3);

imwrite(rat_new_3, 'res_2_3.jpg')