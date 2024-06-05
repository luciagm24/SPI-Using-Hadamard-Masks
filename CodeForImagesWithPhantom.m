[final_image, final_recon, ~,~] = FunctionToReconstructImages(32, 'Measurement_fantoma6.xlsx');
[final_image_phantom, final_recon_phantom, num_total_patterns,N] = FunctionToReconstructImages(32, 'Measurement_phantom1.xlsx');

 %% APPLY MEDIAN FILTER TO PHATHOM FINAL IMAGE TO GET A SMOOTH IMAGE AND NORMALIZE THE RESULTS OF THE FINAL_IMAGE

final_image_phantom_filtered=zeros(N, N, 400);
for z=1:400
    final_image_phantom_filtered(:,:,z)=medfilt2(final_image_phantom(:,:,z), [3 3]);
end


%% VISUALIZE IMAGES ALONG DIFFERENT WAVELENGTHS OF THE SPECTRUM

% RED
figure('Name', 'RED Spectrum', 'NumberTitle', 'off', 'Color', 'white');
count=0;
for red=200:10:310
    count=count + 1;
    subplot(4,4,count)
    imagesc(final_image(:,:,red)./(final_image_phantom(:,:,red)+10)); colormap('gray'); axis off, axis image; axis xy;
    title([num2str(red+430) ' nm'], 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
    
end
set(gca, 'Color', 'white');


% GREEN
figure('Name', 'GREEN Spectrum', 'NumberTitle', 'off', 'Color', 'white');
count=0;
for green=70:10:140
    count=count + 1;
    subplot(2,4,count)
    imagesc(final_image(:,:,green)./(final_image_phantom(:,:,green)+10)); colormap('gray'); axis off, axis image; axis xy;
    title([num2str(green+430) ' nm'], 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
end
set(gca, 'Color', 'white');

% BLUE
figure('Name', 'BLUE Spectrum', 'NumberTitle', 'off', 'Color', 'white');
count=0;
for blue=10:10:70
    count=count + 1;
    subplot(2,4,count)
    imagesc(final_image(:,:,blue)./(final_image_phantom(:,:,blue)+10)); colormap('gray'); axis off, axis image; axis xy;
    title([num2str(blue+430) ' nm'], 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
end
set(gca, 'Color', 'white');


%% OBTAIN RED, GREEN, AND BLUE COMPONENTS

% Info:
% RED: 620–750 nm
% GREEN: 495–570 nm
% BLUE: 450–495 nm

final_img=zeros(N,N,3);
final_image_phantom_color=zeros(N,N,3);

% RED component
final_img(:,:,1)=sum(final_image(:,:,190:320),3);
final_image_phantom_color(:,:,1) = sum(final_image_phantom_filtered(:,:,190:320), 3);


% GREEN component
final_img(:,:,2)=sum(final_image(:,:,65:140), 3);
final_image_phantom_color(:,:,2) = sum(final_image_phantom_filtered(:,:,65:140), 3);


% BLUE component
final_img(:,:,3)=sum(final_image(:,:,20:65), 3);
final_image_phantom_color(:,:,3) = sum(final_image_phantom_filtered(:,:,20:65), 3);


%% PLOT RED, GREEN, AND BLUE COMPONENT IMAGES

figure('Name', 'Image', 'NumberTitle', 'off', 'Color', 'white');

% Display the red channel
subplot(1,3,1)
imagesc(final_img(:,:,1)./(final_image_phantom_color(:,:,1)+2048)); colormap('gray'); axis on; axis image; axis xy;
title('RED', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the green channel
subplot(1,3,2)
imagesc(final_img(:,:,2)./(final_image_phantom_color(:,:,2)+2048)); colormap('gray'); axis on; axis image; axis xy;
title('GREEN', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');

% Display the blue channel
subplot(1,3,3)
imagesc(final_img(:,:,3)./(final_image_phantom_color(:,:,3)+2048)); colormap('gray'); axis on; axis image; axis xy;
title('BLUE', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold', 'FontAngle', 'normal');
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');


%% B&W IMAGE

figure('Color', 'white')
imagesc(sum(final_img,3)./(sum(final_image_phantom_color,3)+2048)); title('Color image RGB'); colormap('gray'); axis on; axis image; axis xy;
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white')


%% RGB IMAGE

figure('Color', 'white')
imagesc(final_img./final_image_phantom_color+0.05); title('RGB Image'); colormap('jet'); axis on; axis image; axis xy;
xlabel('x (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('y (pixel)', 'FontName', 'Comic Sans', 'FontSize', 10, 'FontWeight', 'bold');
set(gca, 'Color', 'white');