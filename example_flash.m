function x = example_flash(b, trans_est, r, eps)

% example: flash/noflash denoising
% figure 8 in our paper
% *** Errata ***: there is a typo in the caption of figure 8, the eps should be 0.02^2 instead of 0.2^2; sig_r should be 0.02 instead of 0.2.


%close all;

%I = double(imread('image\1720.jpg'))/255;

%b = double(imread('huji\2.jpg')) / 255;


%r = 15;

%r = 8;
%eps = 0.02^2;

x = zeros(size(trans_est));
%figure, imshow(trans_est)
bb = rgb2gray(b);

%x(:, :, 1) = guidedfilter(trans_est(:, :), bb, r, eps);
x(:, :, 1) = guidedfilter(bb, trans_est(:, :), r, eps);
x(:, :, 1) = guidedfilter(bb, x(:, :), r, eps);
x(:, :, 1) = guidedfilter(bb, x(:, :), r, eps);

%x(:, :, 1) = guidedfilter(trans(:, :, 1), b(:, :, 1), r, eps);
%x(:, :, 2) = guidedfilter(trans(:, :, 2), b(:, :, 2), r, eps);
%x(:, :, 3) = guidedfilter(trans(:, :, 3), b(:, :, 3), r, eps);

%x = example_flash(trans_est, b, r, eps);

%figure();
%imshow([I, p, q], [0, 1]);

%figure, imshow(I);
%figure, imshow(p);
%figure, imshow(q);
