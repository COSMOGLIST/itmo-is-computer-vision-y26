kot=imread("kot3.jpg");
subplot(1, 3, 1)
imshow(kot)

laplacian_3x3 = [0,  1, 0;
                1, -4, 1;
                0,  1, 0];

laplacian_5x5 = [-1,  -3, -4,  -3,  -1;
                 -3, 0, 6, 0,  -3;
                -4, 6, 20, 6, -4;
                 -3, 0, 6, 0,  -3;
                 -1,  -3, -4,  -3,  -1;];

kot_filt_1=imfilter(kot, laplacian_3x3);

subplot(1, 3, 2)
imshow(kot_filt_1);
title('3x3');

kot_filt_2=imfilter(kot, laplacian_5x5);

subplot(1, 3, 3)
imshow(kot_filt_2);
title('5x5')