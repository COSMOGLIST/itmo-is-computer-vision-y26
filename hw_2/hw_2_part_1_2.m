rat=imread('res_2.jpg');
rat=im2double(rat);

rat_red=rat(:,:,1);
rat_green=rat(:,:,2);
rat_blue=rat(:,:,3);

lower_bound = 0.3;
upper_bound = 1.001;

rat_red_new_3 = im2double(zeros(size(rat_red)));
mask = (rat_red >= lower_bound) & (rat_red < upper_bound);
rat_red_new_3(mask) = (rat_red(mask) - lower_bound) / (upper_bound - lower_bound);
rat_red_new_3(rat_red < lower_bound | rat_red >= upper_bound) = 0.0;

rat_green_new_3 = im2double(zeros(size(rat_green)));
mask = (rat_green >= lower_bound) & (rat_green < upper_bound);
rat_green_new_3(mask) = (rat_green(mask) - lower_bound) / (upper_bound - lower_bound);
rat_green_new_3(rat_green < lower_bound | rat_green >= upper_bound) = 0.0;

rat_blue_new_3 = im2double(zeros(size(rat_blue)));
mask = (rat_blue >= lower_bound) & (rat_blue < upper_bound);
rat_blue_new_3(mask) = (rat_blue(mask) - lower_bound) / (upper_bound - lower_bound);
rat_blue_new_3(rat_blue < lower_bound | rat_blue >= upper_bound) = 0.0;

rat_new_3=im2double(zeros(size(rat)));
rat_new_3(:,:,1)=rat_red_new_3;
rat_new_3(:,:,2)=rat_green_new_3;
rat_new_3(:,:,3)=rat_blue_new_3;


subplot(1, 2, 1);
imshow(rat);

subplot(1, 2, 2);
imshow(rat_new_3);

imwrite(rat_new_3, 'res_2_2.jpg')
