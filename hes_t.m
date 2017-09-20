I0=double(imread('live10\(30).bmp'))/255;
omega=0.75;
win_size = 15;
r = 15;
res = 0.001;

dark_channel = get_dark_channel(I0, win_size);
A = get_atmosphere(I0, dark_channel);
trans_est = get_transmission_estimate(I0, A, omega, win_size);
t = guided_filter(rgb2gray(I0), trans_est, r, res);
imwrite(t, 'testimage\p4\777.bmp');

