% Read the image
i = imread('tablets.jpeg');

% Display the original image
figure;
subplot(2, 2, 1);
imshow(i);
title('Original Image');

% Convert the image to grayscale
g = rgb2gray(i);

% Display the grayscale image
subplot(2, 2, 2);
imshow(g);
title('Grayscale Image');

% Threshold the grayscale image
threshold = 130;
bw = g > threshold;

% Display the thresholded image
subplot(2, 2, 3);
imshow(bw);
title('Thresholded Image');

% Create a disk-shaped structuring element
se = strel('disk', 7);

% Perform morphological opening
afterOpening = imopen(bw, se);

% Display the result after opening
subplot(2, 2, 4);
imshow(afterOpening);
title('After Opening');

% Label connected components
[L, num] = bwlabel(afterOpening, 4);

% Display the number of pills missed in the command window
missedPills = 15 - num;
disp(['Number of pills missed: ' num2str(missedPills)]);