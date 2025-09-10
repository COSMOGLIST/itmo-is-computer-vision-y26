rat_1=imread("rat2.jpg");
rat_2=rat_1;
rat_3=rat_2;

range_bottom_red=85;
range_top_red=115;
range_bottom_green=55;
range_top_green=100;
range_bottom_blue=30;
range_top_blue=60;

subplot(3, 4, 1);

red_channel=rat_1(:,:,1);
red_channel(red_channel > range_top_red | red_channel < range_bottom_red) = 0;
red_channel(red_channel <= range_top_red & red_channel >= range_bottom_red) = 255;
rat_1(:,:,1)=red_channel;

green_channel=rat_1(:,:,2);
green_channel(green_channel > range_top_green | green_channel < range_bottom_green) = 0;
green_channel(green_channel <= range_top_green & green_channel >= range_bottom_green) = 255;
rat_1(:,:,2)=green_channel;

blue_channel=rat_1(:,:,3);
blue_channel(blue_channel > range_top_blue | blue_channel < range_bottom_blue) = 0;
blue_channel(blue_channel <= range_top_blue & blue_channel >= range_bottom_blue) = 255;
rat_1(:,:,3)=blue_channel;

imshow(rat_1);

subplot(3, 4, 2);
imhist(rat_1(:,:,1));
title('red');
subplot(3, 4, 3);
imhist(rat_1(:,:,2));
title('green');
subplot(3, 4, 4);
imhist(rat_1(:,:,3));
title('blue');


subplot(3, 4, 5);

red_channel=rat_2(:,:,1);
red_channel(red_channel <= range_top_red & red_channel >= range_bottom_red) = 255;
rat_2(:,:,1)=red_channel;

green_channel=rat_2(:,:,2);
green_channel(green_channel <= range_top_green & green_channel >= range_bottom_green) = 255;
rat_2(:,:,2)=green_channel;

blue_channel=rat_2(:,:,3);
blue_channel(blue_channel <= range_top_blue & blue_channel >= range_bottom_blue) = 255;
rat_2(:,:,3)=blue_channel;

imshow(rat_2);

subplot(3, 4, 6);
imhist(rat_2(:,:,1));
title('red');
subplot(3, 4, 7);
imhist(rat_2(:,:,2));
title('green');
subplot(3, 4, 8);
imhist(rat_2(:,:,3));
title('blue');


subplot(3, 4, 9);

red_channel=rat_3(:,:,1);
red_channel(red_channel >= range_bottom_red) = 255;
rat_3(:,:,1)=red_channel;

green_channel=rat_3(:,:,2);
green_channel(green_channel >= range_bottom_green) = 255;
rat_3(:,:,2)=green_channel;

blue_channel=rat_3(:,:,3);
blue_channel(blue_channel >= range_bottom_blue) = 255;
rat_3(:,:,3)=blue_channel;

imshow(rat_3);

subplot(3, 4, 10);
imhist(rat_3(:,:,1));
title('red');
subplot(3, 4, 11);
imhist(rat_3(:,:,2));
title('green');
subplot(3, 4, 12);
imhist(rat_3(:,:,3));
title('blue');

