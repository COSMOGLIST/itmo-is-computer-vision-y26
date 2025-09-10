rat=imread('rat1.jpg');
rat_new=im2double(rat);

rat_red=im2double(rat(:,:,1));
rat_red_min=min(rat_red(:));
rat_red_max=max(rat_red(:));
limit_red_new_min=0;
limit_red_new_max=1;
rat_red_new=(rat_red-rat_red_min)/(rat_red_max-rat_red_min)*(limit_red_new_max-limit_red_new_min)+limit_red_new_min;
rat_new(:,:,1)=rat_red_new;

rat_green=im2double(rat(:,:,2));
rat_green_min=min(rat_green(:));
rat_green_max=max(rat_green(:));
limit_green_new_min=0;
limit_green_new_max=1;
rat_green_new=(rat_green-rat_green_min)/(rat_green_max-rat_green_min)*(limit_green_new_max-limit_green_new_min)+limit_green_new_min;
rat_new(:,:,2)=rat_green_new;

rat_blue=im2double(rat(:,:,3));
rat_blue_min=min(rat_blue(:));
rat_blue_max=max(rat_blue(:));
limit_blue_new_min=0;
limit_blue_new_max=1;
rat_blue_new=(rat_blue-rat_blue_min)/(rat_blue_max-rat_blue_min)*(limit_blue_new_max-limit_blue_new_min)+limit_blue_new_min;
rat_new(:,:,3)=rat_blue_new;

subplot(2, 4, 1);
imshow(rat);
title('original');
subplot(2, 4, 2);
imhist(rat(:,:,1));
title('red');
subplot(2, 4, 3);
imhist(rat(:,:,2));
title('green');
subplot(2, 4, 4);
imhist(rat(:,:,3));
title('blue');

subplot(2, 4, 5);
imshow(rat_new);
title('contrast');
subplot(2, 4, 6);
imhist(rat_new(:,:,1));
title('red');
subplot(2, 4, 7);
imhist(rat_new(:,:,2));
title('green');
subplot(2, 4, 8);
imhist(rat_new(:,:,3));
title('blue');