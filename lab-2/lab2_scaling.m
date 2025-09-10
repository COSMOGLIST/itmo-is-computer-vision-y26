cat=imread('kot2.jpg');
cat_gray=rgb2gray(cat);

a=2;
b=2;

T = [a 0 0;
     0 b 0;
     0 0 1];
tform = affine2d(T);
cat_scale_1= imwarp(cat, tform);
cat_gray_scale_1= imwarp(cat_gray, tform);

a=0.1;
b=0.1;

T = [a 0 0;
     0 b 0;
     0 0 1];
tform = affine2d(T);
cat_scale_2= imwarp(cat, tform);
cat_gray_scale_2= imwarp(cat_gray, tform);

a=5;
b=2;

T = [a 0 0;
     0 b 0;
     0 0 1];
tform = affine2d(T);
cat_scale_3= imwarp(cat, tform);
cat_gray_scale_3= imwarp(cat_gray, tform);

a=0.1;
b=0.5;

T = [a 0 0;
     0 b 0;
     0 0 1];
tform = affine2d(T);
cat_scale_4= imwarp(cat, tform);
cat_gray_scale_4= imwarp(cat_gray, tform);

subplot(2, 5, 1);
imshow(cat);
title('Цветное оригинальное');

subplot(2, 5, 2);
imshow(cat_scale_1);
imwrite(cat_scale_1, 'kot2_scale_up.jpg');
title('Цветное масштаб. a>1 b>1 a=b');

subplot(2, 5, 3);
imshow(cat_scale_2);
title('Цветное масштаб. a<1 b<1 a=b');

subplot(2, 5, 4);
imshow(cat_scale_3);
title('Цветное масштаб. a>1 b>1 a=/=b');

subplot(2, 5, 5);
imshow(cat_scale_4);
title('Цветное масштаб. a<1 b<1 a=/=b');


subplot(2, 5, 6);
imshow(cat_gray);
imwrite(cat_gray, 'kot2_gray.jpg');
title('Серое оригинальное');

subplot(2, 5, 7);
imshow(cat_gray_scale_1);
imwrite(cat_gray_scale_1, 'kot2_gray_scale_up.jpg');
title('Серое масштаб. a>1 b>1 a=b');

subplot(2, 5, 8);
imshow(cat_gray_scale_2);
title('Серое масштаб. a<1 b<1 a=b');

subplot(2, 5, 9);
imshow(cat_gray_scale_3);
title('Серое масштаб. a>1 b>1 a=/=b');

subplot(2, 5, 10);
imshow(cat_gray_scale_4);
title('Серое масштаб. a<1 b<1 a=/=b');