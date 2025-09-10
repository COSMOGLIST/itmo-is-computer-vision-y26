rat=rgb2gray(imread('rat1.jpg'));

subplot(5, 2, 1);
imshow(rat);
title('original');
subplot(5, 2, 2);
imhist(rat);

rat=im2double(rat);

N = 3;
intensity_range = linspace(min(rat(:)), max(rat(:)), N + 1);
rat_new_1 = im2double(zeros(size(rat)));
for i = 1:N
    lower_bound = intensity_range(i);
    upper_bound = intensity_range(i + 1);
    mask = (rat >= lower_bound) & (rat < upper_bound);
    rat_new_1(mask) = (rat(mask) - lower_bound) / (upper_bound - lower_bound);
end


subplot(5, 2, 3);
imshow(rat_new_1);
title('contrast');
subplot(5, 2, 4);
imhist(rat_new_1);

rat_new_2 = im2double(zeros(size(rat)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat >= lower_bound) & (rat < upper_bound);
rat_new_2(mask) = (rat(mask) - lower_bound) / (upper_bound - lower_bound);
rat_new_2(rat < lower_bound | rat >= upper_bound) = 0.5;


subplot(5, 2, 5);
imshow(rat_new_2);
title('contrast');
subplot(5, 2, 6);
imhist(rat_new_2);

rat_new_3 = im2double(zeros(size(rat)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat >= lower_bound) & (rat < upper_bound);
rat_new_3(mask) = (rat(mask) - lower_bound) / (upper_bound - lower_bound);
rat_new_3(rat < lower_bound | rat >= upper_bound) = 0.0;


subplot(5, 2, 7);
imshow(rat_new_3);
title('contrast');
subplot(5, 2, 8);
imhist(rat_new_3);

rat_new_4 = im2double(zeros(size(rat)));
lower_bound = 0.2;
upper_bound = 0.4;
mask = (rat >= lower_bound) & (rat < upper_bound);
rat_new_4(mask) = (rat(mask) - lower_bound) / (upper_bound - lower_bound);
rat_new_4(rat < lower_bound | rat >= upper_bound) = 1.0;


subplot(5, 2, 9);
imshow(rat_new_4);
title('contrast');
subplot(5, 2, 10);
imhist(rat_new_4);