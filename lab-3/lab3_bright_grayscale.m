rat=imread("rat1.jpg");
rat_gray_1=rgb2gray(rat);
rat_gray_2=rat_gray_1;
rat_gray_3=rat_gray_2;

range_bottom=140;
range_top=160;

subplot(3, 2, 1);
rat_gray_1(rat_gray_1 > range_top | rat_gray_1 < range_bottom) = 0;
rat_gray_1(rat_gray_1 <= range_top & rat_gray_1 >= range_bottom) = 255;
imshow(rat_gray_1);
subplot(3, 2, 2);
imhist(rat_gray_1);

subplot(3, 2, 3);
rat_gray_2(rat_gray_2 <= range_top & rat_gray_2 >= range_bottom) = 255;
imshow(rat_gray_2);
subplot(3, 2, 4);
imhist(rat_gray_2);

subplot(3, 2, 5);
rat_gray_3(rat_gray_3 >= range_bottom) = 255;
imshow(rat_gray_3);
subplot(3, 2, 6);
imhist(rat_gray_3);