rat=imread("rat1.jpg");
rat=im2double(rat);

gauss_mean = 0;
gauss_disp = 0.1;
noisy_gauss = rat + gauss_mean + sqrt(gauss_disp) * randn(size(rat));
noisy_gauss = max(0, min(noisy_gauss, 1));

rayleigh_scale = 0.5;
rayleigh_noise = raylrnd(rayleigh_scale, size(rat));
rayleigh_noise = rayleigh_noise - mean(rayleigh_noise(:));
noisy_rayleigh = rat + rayleigh_noise;
noisy_rayleigh = max(0, min(noisy_rayleigh, 1));

exponential_mu = 0.2;
exponential_noise = exprnd(exponential_mu, size(rat));
exponential_noise = exponential_noise - mean(exponential_noise(:));
noisy_exponential = rat + exponential_noise;
noisy_exponential = max(0, min(noisy_exponential, 1));

salt_pepper_density = 0.2;
noisy_salt_pepper = imnoise(rat, 'salt & pepper', salt_pepper_density);

uniform_low = -0.5;
uniform_high = 0.5;
noisy_uniform = rat + unifrnd(uniform_low, uniform_high, size(rat));
noisy_uniform = max(0, min(noisy_uniform, 1));

subplot(2, 3, 1);
imshow(im2uint8(rat));
title('Оригинал')

subplot(2, 3, 2);
imshow(im2uint8(noisy_gauss));
title('Гауссов шум')

subplot(2, 3, 3);
imshow(im2uint8(noisy_rayleigh));
title('Шум Релея')

subplot(2, 3, 4);
imshow(im2uint8(noisy_exponential));
title('Экспоненциальный шум')


subplot(2, 3, 5);
imshow(im2uint8(noisy_salt_pepper));
title('Импульсный шум')


subplot(2, 3, 6);
imshow(im2uint8(noisy_uniform));
title('Равномерный шум')

