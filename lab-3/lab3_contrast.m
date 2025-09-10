rat=rgb2gray(imread('rat2.jpg'));

rat=im2double(rat);
rat_min=min(rat(:));
rat_max=max(rat(:));
limit_new_min=0;
limit_new_max=1;
rat_new=(rat-rat_min)/(rat_max-rat_min)*(limit_new_max-limit_new_min)+limit_new_min;

subplot(2, 2, 1);
imshow(rat);
title('original');
subplot(2, 2, 2);
imhist(rat);

subplot(2, 2, 3);
imshow(rat_new);
title('contrast');
subplot(2, 2, 4);
imhist(rat_new);