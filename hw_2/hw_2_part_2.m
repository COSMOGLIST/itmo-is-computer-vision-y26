rat_1=imread("res_2_3.jpg");
rat_3=rat_2;

range_bottom_red= 50;
range_bottom_green=50;
range_bottom_blue=50;


subplot(1, 2, 1);
imshow(rat_1);


red_channel=rat_3(:,:,1);
red_channel(red_channel >= range_bottom_red) = 255;
rat_3(:,:,1)=red_channel;

green_channel=rat_3(:,:,2);
green_channel(green_channel >= range_bottom_green) = 255;
rat_3(:,:,2)=green_channel;

blue_channel=rat_3(:,:,3);
blue_channel(blue_channel >= range_bottom_blue) = 255;
rat_3(:,:,3)=blue_channel;

subplot(1, 2, 2);
imshow(rat_3);

imwrite(rat_3, 'res_2_4.jpg')
