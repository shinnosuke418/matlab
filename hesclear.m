i = double(imread('data\data1\25.bmp'))/255;
% i = double(imread('live6\ (20).bmp'))/255;
%i = imresize(i,0.6);
omega = 0.75;
win_size = 15;
r = 30;
res = 0.001;


dark_channel = get_dark_channel(i, win_size);
Ax = get_atmosphere(i, dark_channel);
trans_est = get_transmission_estimate(i, Ax, omega, win_size);
tx = guided_filter(rgb2gray(i), trans_est, r, res);
Jx = get_radiance(i, tx, Ax);
figure, imshow(Jx);
imwrite(Jx, 'testimage\j.bmp');
imwrite(tx, 'testimage\t.bmp');