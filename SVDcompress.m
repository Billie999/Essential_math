function outimage = SVDcompress(filename, Nretain)

% Function SVDcompress is defined with two arguments: a filename and the number of singular values 
% used to reconstruct the image (Nretain) in the file.
% Images with less singualar values were generated in two ways: by applying values of interest of 
% Nretain (5,10,50 and 100) to the SVDcompress function and generating the four images one-by-one or by using 
% the loop that is presented in a file called master.m and producing them all at once.
% First we need to define different values of Nretain that should be uncommented before
% application.In general, you can specify different Nretain values and
% produce reconstructed image.

% Nretain = 5;
% Nretain = 10;
% Nretain = 50;
% Nretain = 100;

pic = imread(filename);

% imread function ,[...] = imread(filename), returns the image data in the array A.
% If the file contains a grayscale image, A is a two-dimensional (M-by-N) array. 
% If the file contains a color image, A is a three-dimensional (M-by-N-by-3) array like in this case.
% The image is loaded as a a three-dimensional (M-by-N-by-3) array in integer format.  It is 
% converted to floating point values so SVD can be taken.

pic = double(pic);

% The loaded data is in the range from 0-255. Then, it is converted to the
% range 0-1 with the code below.

pic = pic / 255;

% Extracting the  3 colour components: the red, green and blue
% components of the image are accessed with the last dimension.

red = pic(:,:,1);
green = pic(:,:,2);
blue = pic(:,:,3);

% SVD values calculated for the 3 colour components.
 
[UR, SR, VR] = svd(red);
[UG, SG, VG] = svd(green);
[UB, SB, VB] = svd(blue);
 
% Each colour is reconstructed from SVD values.
 
U2R = UR(:,1:Nretain);
V2R = VR(:,1:Nretain);
S2R = SR(1:Nretain,1:Nretain);
    
U2G = UG(:,1:Nretain);
V2G = VG(:,1:Nretain);
S2G = SG(1:Nretain,1:Nretain);
    
U2B = UB(:,1:Nretain);
V2B = VB(:,1:Nretain);
S2B = SB(1:Nretain,1:Nretain);

 % At the end, the image is reconstructed.
 
outimage(:,:,1) = U2R*S2R*V2R';
outimage(:,:,2) = U2G*S2G*V2G';
outimage(:,:,3) = U2B*S2B*V2B';
 
% Plotting reconstructed image.
 
figure;
imshow(outimage, []); 
title('Reconstructed');


% Plotting original versus reconstructed image.
 
figure;
subplot(1,2,1);
imshow(filename);
title('Original Image');
subplot(1,2,2);
imshow(outimage, []);
title('Reconstructed Image');


end

% After running the function with at least one Nretain value we can produce reconstructed image. For the 
% completion of the task as part of Assessment 2B, we can either continue running the above function with the 
% rest Nretain values and generate the four reconstructed images or move to the master.m file and produced 
% all four images for the four Nreatin values specified all at once.