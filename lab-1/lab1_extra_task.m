image_low=imread("low_contrast.jpg");

image_equalized_histeq = zeros(size(image_low), 'uint8');
for channel = 1:3
    image_equalized_histeq(:,:,channel) = histeq(image_low(:,:,channel));
end

image_low(image_low <= 95) = 95;
[numRows, numCols, Layers] = size(image_low);
for k=1:1:Layers
    image_min = min(min(image_low(:, :, k)));
    image_max = max(max(image_low(:, :, k)));
    for i=1:1:numRows
        for j=1:1:numCols
            element = (double(image_low(i,j,k) - image_min) / double(image_max - image_min));
            image_equalized_my(i,j,k) = element^0.5;
            if image_equalized_my(i,j,k) > 1
                image_equalized_my(i,j,k) = 1;
            end
            if image_equalized_my(i,j,k) < 0
                image_equalized_my(i,j,k) = 0;
            end
        end
    end
end

subplot(4, 3, 1);
imhist(image_low(:,:,1));
title('Исходный красный канал');
subplot(4, 3, 2);
imhist(image_low(:,:,2));
title('Исходный зеленый канал');
subplot(4, 3, 3);
imhist(image_low(:,:,3));
title('Исходный синий канал');

subplot(4, 3, 4);
imhist(image_equalized_histeq(:,:,1));
title('Выравненный красный канал (histeq)');
subplot(4, 3, 5);
imhist(image_equalized_histeq(:,:,2));
title('Выравненный зеленый канал (histeq)');
subplot(4, 3, 6);
imhist(image_equalized_histeq(:,:,3));
title('Выравненный синий канал (histeq)');

subplot(4, 3, 7);
imhist(image_equalized_my(:,:,1));
title('Выравненный красный канал (вручную)');
subplot(4, 3, 8);
imhist(image_equalized_my(:,:,2));
title('Выравненный зеленый канал (вручную)');
subplot(4, 3, 9);
imhist(image_equalized_my(:,:,3));
title('Выравненный синий канал (вручную)');

subplot(4, 3, 10);
imshow(image_low)
subplot(4, 3, 11);
imshow(image_equalized_histeq)
subplot(4, 3, 12);
imshow(image_equalized_my)
