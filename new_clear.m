warning('off','all');

I0 = double(imread('live6\ (1).jpg'))/255;
I1 = double(imread('live6\ (2).jpg'))/255;
%{
I0 = double(imread('testimage\1350.jpg'))/255;
I0 = imresize(I0,0.6);
I1 = double(imread('testimage\1400.jpg'))/255;
I1 = imresize(I1,0.6);
%}
%****************make he's process***********************
omega = 0.75;
win_size = 15;
r = 15;
res = 0.001;

dark_channel = get_dark_channel(I0, win_size);
A = get_atmosphere(I0, dark_channel);
trans_est = get_transmission_estimate(I0, A, omega, win_size);
t = guided_filter(rgb2gray(I0), trans_est, r, res);
J = get_radiance(I0, t, A);
%*******************************************************

result=make_t1(t,J,I0,I1,A);
r2 = get_radiance(I1, result, A);

%imwrite(r2, 'testimage\r3.jpg')

figure, imshow(result);
figure, imshow([I1, r2]);
warning('on','all');