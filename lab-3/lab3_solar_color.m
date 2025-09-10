rat=im2double(imread("rat1.jpg"));
rat_new=im2double(rat);

rat_red=rat(:,:,1);
rat_red_max=max(rat_red);
k=3;
rat_red_new=im2double((rat_red_max-rat_red).*rat_red.*k);
rat_new(:,:,1)=rat_red_new;

rat_green=rat(:,:,2);
rat_green_max=max(rat_green);
k=3;
rat_green_new=im2double((rat_green_max-rat_green).*rat_green.*k);
rat_new(:,:,2)=rat_green_new;

rat_blue=rat(:,:,3);
rat_blue_max=max(rat_blue);
k=3;
rat_blue_new=im2double((rat_blue_max-rat_blue).*rat_blue.*k);
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
title('solar');
subplot(2, 4, 6);
imhist(rat_new(:,:,1));
title('red');
subplot(2, 4, 7);
imhist(rat_new(:,:,2));
title('green');
subplot(2, 4, 8);
imhist(rat_new(:,:,3));
title('blue');