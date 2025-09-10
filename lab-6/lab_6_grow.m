img = imread('rat1.jpg');
img = rgb2gray(img);

seeds = [100, 100; 200, 200; 300, 300; 400, 400; 500, 500];
delta_thresh = 30;
[segmented, boundaries] = region_growing(img, seeds, delta_thresh);

subplot(1,2,1); imshow(img); title('Исходное изображение');
subplot(1,2,2); imshow(label2rgb(segmented)); title('Результат сегментации');

function [labeled_image, boundaries] = region_growing(image, seeds, delta_threshold)
    [height, width] = size(image);
    labeled_image = zeros(height, width);
    boundaries = false(height, width);
    
    n_regions = size(seeds, 1);
    region_means = zeros(n_regions, 1);
    
    for i = 1:n_regions
        x = seeds(i, 1);
        y = seeds(i, 2);
        labeled_image(y, x) = i;
        region_means(i) = image(y, x);
    end

    listB = zeros(0, 4, 'uint32');
    visited = false(height, width);

    for i = 1:n_regions
        x = seeds(i, 1);
        y = seeds(i, 2);
        neighbors = get_neighbors(x, y, height, width);
        
        for j = 1:size(neighbors, 1)
            nx = neighbors(j, 1);
            ny = neighbors(j, 2);
            if labeled_image(ny, nx) == 0 && ~boundaries(ny, nx) && ~visited(ny, nx)
                delta = abs(image(ny, nx) - region_means(i));
                listB = [listB; uint32(nx), uint32(ny), delta, i];
                visited(ny, nx) = true;
            end
        end
    end

    listB = sortrows(listB, 3);

    while ~isempty(listB)
        current = listB(1, :);
        listB(1, :) = [];
        
        x = current(1);
        y = current(2);
        region_id = current(4);
        neighbors = get_neighbors(x, y, height, width);
        neighbor_regions = [];
        
        for j = 1:size(neighbors, 1)
            nx = neighbors(j, 1);
            ny = neighbors(j, 2);
            nr = labeled_image(ny, nx);
            if nr > 0
                neighbor_regions = [neighbor_regions; nr];
            end
        end
        
        neighbor_regions = unique(neighbor_regions);
        
        if numel(neighbor_regions) == 1 && neighbor_regions == region_id
            labeled_image(y, x) = region_id;
      
            region_pixels = image(labeled_image == region_id);
            region_means(region_id) = mean(region_pixels);
       
            neighbors = get_neighbors(x, y, height, width);
            
            for j = 1:size(neighbors, 1)
                nx = neighbors(j, 1);
                ny = neighbors(j, 2);
                
                if labeled_image(ny, nx) == 0 && ~boundaries(ny, nx) && ~visited(ny, nx)
                    delta = abs(image(ny, nx) - region_means(region_id));
                    if delta <= delta_threshold
                        listB = [listB; nx, ny, delta, region_id];
                        visited(ny, nx) = true;
                    end
                end
            end

            listB = sortrows(listB, 3);
        else
            boundaries(y, x) = true;
        end
    end
end

function neighbors = get_neighbors(x, y, height, width)
    neighbors = [];
    
    if x > 1, neighbors = [neighbors; x-1, y]; end
    if x < width, neighbors = [neighbors; x+1, y]; end
    if y > 1, neighbors = [neighbors; x, y-1]; end
    if y < height, neighbors = [neighbors; x, y+1]; end
end