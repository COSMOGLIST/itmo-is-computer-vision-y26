rat=imread("rat2.jpg");
rat_gray=im2double(rgb2gray(rat));

rat_gray_max=max(rat_gray(:));
k=3;

rat_gray_new=im2double((rat_gray_max-rat_gray).*rat_gray.*k);


subplot(2, 2, 1);
imshow(rat_gray);
title('original');
subplot(2, 2, 2);
imhist(rat_gray);
subplot(2, 2, 3);
imshow(rat_gray_new);
title('solar');
subplot(2, 2, 4);
imhist(rat_gray_new);