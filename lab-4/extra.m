I = im2double(imread('kot2.jpg'));
subplot(1, 3, 1)
imshow(I);
title('original');

LEN = 50;
THETA = 30;
PSF = fspecial('motion', LEN, THETA);
blurred = imfilter(I, PSF, 'conv', 'circular');

subplot(1, 3, 2)
imshow(blurred)
title('motion');

LEN = 50;
THETA = 35;
PSF = fspecial('motion', LEN, THETA);
wnr3 = deconvwnr(blurred, PSF);

subplot(1, 3, 3)
imshow(wnr3)
title('restoration');