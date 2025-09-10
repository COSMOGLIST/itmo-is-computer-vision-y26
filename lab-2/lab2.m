cat=imread('kot1.jpg');
cat_gray=rgb2gray(cat);
cat_flip_gorizontal=flip(cat, 1);
cat_gray_flip_gorizontal=flip(cat_gray, 1);
cat_flip_vertical=flip(cat, 2);
cat_gray_flip_vertical=flip(cat_gray, 2);

T =[1   0   0;
    0   1   0;
    100 100 1];
tform = affine2d(T);
cat_shift = imwarp(cat, tform , 'Interp', 'nearest', 'OutputView', imref2d(size(cat), [1 size(cat,2)], [1 size(cat,1)]));
cat_gray_shift = imwarp(cat_gray, tform , 'Interp', 'nearest', 'OutputView', imref2d(size(cat_gray), [1 size(cat_gray,2)], [1 size(cat_gray,1)]));

T = [1      0       0;
     0.3    1       0;
     0      0       1];
tform = affine2d(T);
cat_bevel = imwarp(cat, tform);
cat_gray_bevel = imwarp(cat_gray, tform);

phi = 30*pi/180;
T = [cos(phi)   sin(phi)    0;
    -sin(phi)   cos(phi)    0;
    0           0           1];
tform = affine2d(T);
cat_rotate = imwarp(cat, tform, 'OutputView', imref2d(size(cat)));
cat_gray_rotate = imwarp(cat_gray, tform, 'OutputView', imref2d(size(cat_gray)));


center = [size(cat, 2) / 2, size(cat, 1) / 2];
T_center_to_coordinates = [1           0           0;
                0           1           0;
               -center(1)   -center(2)  1];
T_rotate = [cos(phi)   sin(phi)    0;
           -sin(phi)   cos(phi)    0;
            0          0           1];
T_coordinates_to_center = [1           0          0;
                0           1          0;
                center(1)   center(2)  1];
T_center = T_center_to_coordinates * T_rotate * T_coordinates_to_center;
tform_center = affine2d(T_center);
cat_rotate_center = imwarp(cat, tform_center, 'OutputView', imref2d(size(cat)));
cat_gray_rotate_center = imwarp(cat_gray, tform_center, 'OutputView', imref2d(size(cat_gray)));

subplot(4, 4, 1);
imshow(cat);
title('Цветное обычное');

subplot(4, 4, 2);
imshow(cat_gray);
title('Серое обычное');

subplot(4, 4, 3);
imshow(cat_flip_gorizontal);
title('Цветное по горизонтали');

subplot(4, 4, 4);
imshow(cat_gray_flip_gorizontal);
title('Серое по горизонтали');

subplot(4, 4, 5);
imshow(cat_flip_vertical);
title('Цветное по вертикали');

subplot(4, 4, 6);
imshow(cat_gray_flip_vertical);
title('Серое по вертикали');

subplot(4, 4, 7);
imshow(cat_shift);
title('Цветное со сдвигом');

subplot(4, 4, 8);
imshow(cat_gray_shift);
title('Серое со сдвигом');

subplot(4, 4, 9);
imshow(cat_bevel);
title('Цветное со скосом');

subplot(4, 4, 10);
imshow(cat_gray_bevel);
title('Серое со скосом');

subplot(4, 4, 11);
imshow(cat_rotate);
title('Цветное с поворотом, начало координат');

subplot(4, 4, 12);
imshow(cat_gray_rotate);
title('Серое с поворотом, начало координат');

subplot(4, 4, 13);
imshow(cat_rotate_center);
title('Цветное с поворотом, центр');

subplot(4, 4, 14);
imshow(cat_gray_rotate_center);
title('Серое с поворотом, центр');




