bright=imread("bright.jpg");
bright_noise=imread("bright_noise.jpg");

sizef1=[3 3];
R = bright(:,:,1);
G = bright(:,:,2);
B = bright(:,:,3);
R_filtered_bright = medfilt2(R, sizef1);
G_filtered_bright = medfilt2(G, sizef1);
B_filtered_bright = medfilt2(B, sizef1);
filtered_bright = zeros(size(bright), 'uint8');
filtered_bright(:,:,1) = R_filtered_bright;
filtered_bright(:,:,2) = G_filtered_bright;
filtered_bright(:,:,3) = B_filtered_bright;


orig=imread("noised.jpg");
subplot(2, 3, 1);
imhist(orig);
title('Гистограмма оригинала');


subplot(2, 3, 2);
imhist(bright);
title('Гистограмма высветленного');

subplot(2, 3, 3);
imhist(filtered_bright);
title('Гистограмма высветленного с фильтром');

sizef2=[5 5];
R = bright_noise(:,:,1);
G = bright_noise(:,:,2);
B = bright_noise(:,:,3);
R_filtered_bright = medfilt2(R, sizef2);
G_filtered_bright = medfilt2(G, sizef2);
B_filtered_bright = medfilt2(B, sizef2);
filtered_bright_noise = zeros(size(bright_noise), 'uint8');
filtered_bright_noise(:,:,1) = R_filtered_bright;
filtered_bright_noise(:,:,2) = G_filtered_bright;
filtered_bright_noise(:,:,3) = B_filtered_bright;

subplot(2, 3, 4);
imhist(bright_noise);
title('Гистограмма выстветленного с шумом');

subplot(2, 3, 5);
imhist(filtered_bright_noise);
title('Гистограмма выстветленного с шумом и фильтром');