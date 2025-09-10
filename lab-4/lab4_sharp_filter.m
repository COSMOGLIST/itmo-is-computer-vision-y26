kot=imread("kot4.jpg");
subplot(1, 2, 1)
imshow(kot)

sharp_3x3 =     [-1,  -1, -1;
                 -1, 9, -1;
                -1,  -1, -1];


kot_filt_1=imfilter(kot, sharp_3x3);

subplot(1, 2, 2)
imshow(kot_filt_1);