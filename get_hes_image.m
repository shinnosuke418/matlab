function [ result ] = get_hes_image( I,idx )
%i=double(i)/255;
omega = 0.8;
win_size = 6;
r = 15;
res = 0.001;

dark_channel = get_dark_channel(I, win_size);
Ax = get_atmosphere(I, dark_channel);

trans_est = get_transmission_estimate(I, Ax, omega, win_size);

tx = guided_filter(rgb2gray(I), trans_est, r, res);
imgname=strcat('result\het\',num2str(idx),'.bmp');
imwrite(tx, imgname);
result = get_radiance(I, tx, Ax);


end

