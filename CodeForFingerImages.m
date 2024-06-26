[final_image1, final_recon1, ~,~] = FunctionToReconstructImages(16, 'Measurement_padre1.xlsx');
[final_image2, final_recon2, ~,~] = FunctionToReconstructImages(16, 'Measurement_padre2.xlsx');
[final_image3, final_recon3, ~,~] = FunctionToReconstructImages(16, 'Measurement_padre4.xlsx');
[final_image4, final_recon4, ~,~] = FunctionToReconstructImages(16, 'Measurement_padre5.xlsx');
[final_image7, final_recon7, ~, N] = FunctionToReconstructImages(16, 'Measurement_padre6.xlsx');


%% NORMALIZE WITH GLOBAL MIN AND MAX

all_matrices = cat(4, final_image1, final_image2, final_image3, final_image4);

% Find the global minimum value
global_min = min(all_matrices(:));

% Find the global maximum value
global_max = max(all_matrices(:));

normalized_image1=(final_image1 - global_min)./(global_max - global_min);
normalized_image2=(final_image2 - global_min)./(global_max - global_min);
normalized_image3=(final_image3 - global_min)./(global_max - global_min);
normalized_image4=(final_image4 - global_min)./(global_max - global_min);


%% VISUALIZE IMAGES ALONG DIFFERENT WAVELENGTHS OF THE RED COMPONENT OF THE SPECTRUM

%IMAGE 1

figure('Name', 'RED - Image 1', 'NumberTitle', 'off', 'Color', 'white');
count=0;
for red=200:10:310
    count=count + 1;
    subplot(4,4,count)
    imagesc(normalized_image1(:,:,red)); colormap('gray'); axis off, axis image; axis xy;
    title([num2str(red+430) ' nm'], 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
end
set(gca, 'Color', 'white');


%IMAGE 2

figure('Name', 'RED - Image 2', 'NumberTitle', 'off', 'Color', 'white');
count=0;
for red=200:10:310
    count=count + 1;
    subplot(4,4,count)
    imagesc(normalized_image2(:,:,red)); colormap('gray'); axis off, axis image; axis xy;
    title([num2str(red+430) ' nm'], 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
end
set(gca, 'Color', 'white');


%IMAGE 3

figure('Name', 'RED - Image 3', 'NumberTitle', 'off', 'Color', 'white');
count=0;
for red=200:10:310
    count=count + 1;
    subplot(4,4,count)
    imagesc(normalized_image3(:,:,red)); colormap('gray'); axis off, axis image; axis xy;
    title([num2str(red+430) ' nm'], 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
end
set(gca, 'Color', 'white');

%IMAGE 4

figure('Name', 'RED - Image 4', 'NumberTitle', 'off', 'Color', 'white');
count=0;
for red=200:10:310
    count=count + 1;
    subplot(4,4,count)
    imagesc(normalized_image4(:,:,red)); colormap('gray'); axis off, axis image; axis xy;
    title([num2str(red+430) ' nm'], 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
end
set(gca, 'Color', 'white');



%% RED, GREEN, AND BLUE COMPONENTS

% Info:
% RED: 620–750 nm
% GREEN: 495–570 nm
% BLUE: 450–495 nm

final_image_color1=zeros(N,N,3);


% RED component
final_image_color1(:,:,1) = sum(normalized_image1(:,:,190:320),3);
final_image_color2(:,:,1) = sum(normalized_image2(:,:,190:320),3);
final_image_color3(:,:,1) = sum(normalized_image3(:,:,190:320),3);
final_image_color4(:,:,1) = sum(normalized_image4(:,:,190:320),3);


% GREEN component
final_image_color1(:,:,2) = sum(normalized_image1(:,:,65:140), 3);
final_image_color2(:,:,2) = sum(normalized_image2(:,:,65:140), 3);
final_image_color3(:,:,2) = sum(normalized_image3(:,:,65:140), 3);
final_image_color4(:,:,2) = sum(normalized_image4(:,:,65:140), 3);


% BLUE component
final_image_color1(:,:,3) = sum(normalized_image1(:,:,20:65), 3);
final_image_color2(:,:,3) = sum(normalized_image2(:,:,20:65), 3);
final_image_color3(:,:,3) = sum(normalized_image3(:,:,20:65), 3);
final_image_color4(:,:,3) = sum(normalized_image4(:,:,20:65), 3);


%% PLOT IMAGES

%% IMAGE 1

figure('Name', 'Image', 'NumberTitle', 'off', 'Color', 'white');
% Display the red channel
subplot(1,3,1)
imagesc(final_image_color1(:,:,1)); colormap('gray'); axis on; axis image; axis xy;
title('RED Image 1', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the green channel
subplot(1,3,2)
imagesc(final_image_color1(:,:,2)); colormap('gray'); axis on; axis image; axis xy;
title('GREEN Image 1', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the blue channel
subplot(1,3,3)
imagesc(final_image_color1(:,:,3)); colormap('gray'); axis on; axis image; axis xy;
title('BLUE Image 1', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

%% IMAGE 2

figure('Name', 'Image', 'NumberTitle', 'off', 'Color', 'white');
% Display the red channel
subplot(1,3,1)
imagesc(final_image_color2(:,:,1)); colormap('gray'); axis on; axis image; axis xy;
title('RED Image 2', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the green channel
subplot(1,3,2)
imagesc(final_image_color2(:,:,2)); colormap('gray'); axis on; axis image; axis xy;
title('GREEN Image 2', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the blue channel
subplot(1,3,3)
imagesc(final_image_color2(:,:,3)); colormap('gray'); axis on; axis image; axis xy;
title('BLUE Image 2', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

%% IMAGE 3

figure('Name', 'Image', 'NumberTitle', 'off', 'Color', 'white');
% Display the red channel
subplot(1,3,1)
imagesc(final_image_color3(:,:,1)); colormap('gray'); axis on; axis image; axis xy;
title('RED Image 3', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the green channel
subplot(1,3,2)
imagesc(final_image_color3(:,:,2)); colormap('gray'); axis on; axis image; axis xy;
title('GREEN Image 3', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the blue channel
subplot(1,3,3)
imagesc(final_image_color3(:,:,3)); colormap('gray'); axis on; axis image; axis xy;
title('BLUE Image 3', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

%% IMAGE 4

figure('Name', 'Image', 'NumberTitle', 'off', 'Color', 'white');
% Display the red channel
subplot(1,3,1)
imagesc(final_image_color4(:,:,1)); colormap('gray'); axis on; axis image; axis xy;
title('RED Image 4', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the green channel
subplot(1,3,2)
imagesc(final_image_color4(:,:,2)); colormap('gray'); axis on; axis image; axis xy;
title('GREEN Image 4', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the blue channel
subplot(1,3,3)
imagesc(final_image_color4(:,:,3)); colormap('gray'); axis on; axis image; axis xy;
title('BLUE Image 4', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');


%% B&W IMAGES

figure('Name', 'Image', 'NumberTitle', 'off', 'Color', 'white');

subplot(2,2,1)
imagesc(sum(final_image_color1,3)); colormap('gray'); axis on; axis image; axis xy;
title('Image 1', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');


subplot(2,2,2)
imagesc(sum(final_image_color2,3)); colormap('gray'); axis on; axis image; axis xy;
title('Image 2', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');


subplot(2,2,3)
imagesc(sum(final_image_color3,3)); colormap('gray'); axis on; axis image; axis xy;
title('Image 3', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');


subplot(2,2,4)
imagesc(sum(final_image_color4,3)); colormap('gray'); axis on; axis image; axis xy;
title('Image 4', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');