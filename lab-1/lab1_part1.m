dog=imread('dog.jpg');

subplot(3, 3, 1)
imshow(dog)
title('original image')

subplot(3, 3, 2)
dog_gray=rgb2gray(dog);
imshow(dog_gray)
title('grayscale')

subplot(3, 3, 3)
dog_red = uint8(zeros(size(dog)));
dog_red(:,:,1) = dog(:,:,1);
imshow(dog_red);
title('RED extracted')

subplot(3, 3, 4)
dog_green = uint8(zeros(size(dog)));
dog_green(:,:,2) = dog(:,:,2);
imshow(dog_green);
title('GREEN extracted')

subplot(3, 3, 5)
dog_blue = uint8(zeros(size(dog)));
dog_blue(:,:,3) = dog(:,:,3);
imshow(dog_blue);
title('BLUE extracted')

subplot(3, 3, 6)
R = double(dog(:, :, 1));
G = double(dog(:, :, 2));
B = double(dog(:, :, 3));
dog_gray_halftone=(R+G+B)/3;
dog_gray_halftone=uint8(dog_gray_halftone);
imshow(dog_gray_halftone);
title('halftone')

subplot(3, 3, 7)
dog_binary_25 = dog_gray_halftone > 0.25*255;
imshow(dog_binary_25);
title('binary 25%')

subplot(3, 3, 8)
dog_binary_50 = dog_gray_halftone > 0.5*255;
imshow(dog_binary_50);
title('binary 50%')

subplot(3, 3, 9)
dog_binary_75 = dog_gray_halftone > 0.75*255;
imshow(dog_binary_75);
title('binary 75%')
