rat=imread('rat1.jpg');
rat=im2double(rat);

rat_red=rat(:,:,1);
rat_green=rat(:,:,2);
rat_blue=rat(:,:,3);

N = 3;
intensity_range = linspace(min(rat_red(:)), max(rat_red(:)), N + 1);
rat_red_new_1 = im2double(zeros(size(rat_red)));
for i = 1:N
    lower_bound = intensity_range(i);
    upper_bound = intensity_range(i + 1);
    mask = (rat_red >= lower_bound) & (rat_red < upper_bound);
    rat_red_new_1(mask) = (rat_red(mask) - lower_bound) / (upper_bound - lower_bound);
end

N = 3;
intensity_range = linspace(min(rat_green(:)), max(rat_green(:)), N + 1);
rat_green_new_1 = im2double(zeros(size(rat_green)));
for i = 1:N
    lower_bound = intensity_range(i);
    upper_bound = intensity_range(i + 1);
    mask = (rat_green >= lower_bound) & (rat_green < upper_bound);
    rat_green_new_1(mask) = (rat_green(mask) - lower_bound) / (upper_bound - lower_bound);
end

N = 3;
intensity_range = linspace(min(rat_blue(:)), max(rat_blue(:)), N + 1);
rat_blue_new_1 = im2double(zeros(size(rat_blue)));
for i = 1:N
    lower_bound = intensity_range(i);
    upper_bound = intensity_range(i + 1);
    mask = (rat_blue >= lower_bound) & (rat_blue < upper_bound);
    rat_blue_new_1(mask) = (rat_blue(mask) - lower_bound) / (upper_bound - lower_bound);
end

rat_new_1=im2double(zeros(size(rat)));
rat_new_1(:,:,1)=rat_red_new_1;
rat_new_1(:,:,2)=rat_green_new_1;
rat_new_1(:,:,3)=rat_blue_new_1;

rat_red_new_2 = im2double(zeros(size(rat_red)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_red >= lower_bound) & (rat_red < upper_bound);
rat_red_new_2(mask) = (rat_red(mask) - lower_bound) / (upper_bound - lower_bound);
rat_red_new_2(rat_red < lower_bound | rat_red >= upper_bound) = 0.5;

rat_green_new_2 = im2double(zeros(size(rat_green)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_green >= lower_bound) & (rat_green < upper_bound);
rat_green_new_2(mask) = (rat_green(mask) - lower_bound) / (upper_bound - lower_bound);
rat_green_new_2(rat_green < lower_bound | rat_green >= upper_bound) = 0.5;

rat_blue_new_2 = im2double(zeros(size(rat_blue)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_blue >= lower_bound) & (rat_blue < upper_bound);
rat_blue_new_2(mask) = (rat_blue(mask) - lower_bound) / (upper_bound - lower_bound);
rat_blue_new_2(rat_blue < lower_bound | rat_blue >= upper_bound) = 0.5;

rat_new_2=im2double(zeros(size(rat)));
rat_new_2(:,:,1)=rat_red_new_2;
rat_new_2(:,:,2)=rat_green_new_2;
rat_new_2(:,:,3)=rat_blue_new_2;

rat_red_new_3 = im2double(zeros(size(rat_red)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_red >= lower_bound) & (rat_red < upper_bound);
rat_red_new_3(mask) = (rat_red(mask) - lower_bound) / (upper_bound - lower_bound);
rat_red_new_3(rat_red < lower_bound | rat_red >= upper_bound) = 0.0;

rat_green_new_3 = im2double(zeros(size(rat_green)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_green >= lower_bound) & (rat_green < upper_bound);
rat_green_new_3(mask) = (rat_green(mask) - lower_bound) / (upper_bound - lower_bound);
rat_green_new_3(rat_green < lower_bound | rat_green >= upper_bound) = 0.0;

rat_blue_new_3 = im2double(zeros(size(rat_blue)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_blue >= lower_bound) & (rat_blue < upper_bound);
rat_blue_new_3(mask) = (rat_blue(mask) - lower_bound) / (upper_bound - lower_bound);
rat_blue_new_3(rat_blue < lower_bound | rat_blue >= upper_bound) = 0.0;

rat_new_3=im2double(zeros(size(rat)));
rat_new_3(:,:,1)=rat_red_new_3;
rat_new_3(:,:,2)=rat_green_new_3;
rat_new_3(:,:,3)=rat_blue_new_3;

rat_red_new_4 = im2double(zeros(size(rat_red)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_red >= lower_bound) & (rat_red < upper_bound);
rat_red_new_4(mask) = (rat_red(mask) - lower_bound) / (upper_bound - lower_bound);
rat_red_new_4(rat_red < lower_bound | rat_red >= upper_bound) = 1.0;

rat_green_new_4 = im2double(zeros(size(rat_green)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_green >= lower_bound) & (rat_green < upper_bound);
rat_green_new_4(mask) = (rat_green(mask) - lower_bound) / (upper_bound - lower_bound);
rat_green_new_4(rat_green < lower_bound | rat_green >= upper_bound) = 1.0;

rat_blue_new_4 = im2double(zeros(size(rat_blue)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat_blue >= lower_bound) & (rat_blue < upper_bound);
rat_blue_new_4(mask) = (rat_blue(mask) - lower_bound) / (upper_bound - lower_bound);
rat_blue_new_4(rat_blue < lower_bound | rat_blue >= upper_bound) = 1.0;

rat_new_4=im2double(zeros(size(rat)));
rat_new_4(:,:,1)=rat_red_new_4;
rat_new_4(:,:,2)=rat_green_new_4;
rat_new_4(:,:,3)=rat_blue_new_4;


subplot(5, 4, 1);
imshow(rat);
title('original');
subplot(5, 4, 2);
imhist(rat(:,:,1));
title('red');
subplot(5, 4, 3);
imhist(rat(:,:,2));
title('green');
subplot(5, 4, 4);
imhist(rat(:,:,3));
title('blue');

subplot(5, 4, 5);
imshow(rat_new_1);
subplot(5, 4, 6);
imhist(rat_new_1(:,:,1));
title('red');
subplot(5, 4, 7);
imhist(rat_new_1(:,:,2));
title('green');
subplot(5, 4, 8);
imhist(rat_new_1(:,:,3));
title('blue');

subplot(5, 4, 9);
imshow(rat_new_2);
subplot(5, 4, 10);
imhist(rat_new_2(:,:,1));
title('red');
subplot(5, 4, 11);
imhist(rat_new_2(:,:,2));
title('green');
subplot(5, 4, 12);
imhist(rat_new_2(:,:,3));
title('blue');

subplot(5, 4, 13);
imshow(rat_new_3);
subplot(5, 4, 14);
imhist(rat_new_3(:,:,1));
title('red');
subplot(5, 4, 15);
imhist(rat_new_3(:,:,2));
title('green');
subplot(5, 4, 16);
imhist(rat_new_3(:,:,3));
title('blue');

subplot(5, 4, 17);
imshow(rat_new_4);
subplot(5, 4, 18);
imhist(rat_new_4(:,:,1));
title('red');
subplot(5, 4, 19);
imhist(rat_new_4(:,:,2));
title('green');
subplot(5, 4, 20);
imhist(rat_new_4(:,:,3));
title('blue');
