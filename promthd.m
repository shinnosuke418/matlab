tic;
num=50;%画像の量で変更
imcell2=cell(1,num);
t_cell=cell(1,num);
j_cell=cell(1,num);

%画像の読み込み(連番ファイルにする)
for i=1:num
    %Imgfilename = strcat('live3\',num2str(i),'.bmp');
    Imgfilename = strcat('data\data3\',num2str(i),'.bmp');
    imcell2{1,i}=double(imread(Imgfilename))/255;
end
%****************make he's process***********************
omega = 0.85;
win_size = 15;
r = 12;
res = 0.001;
A=make_A(imcell2{1,1}, win_size);
trans_est = get_transmission_estimate(imcell2{1,1}, A, omega, win_size);
t = guided_filter(rgb2gray(imcell2{1,1}), trans_est, r, res);
J = get_radiance(imcell2{1,1}, t, A);
%*******************************************************
t_cell{1,1}=make_t1(t,J,imcell2{1,1},imcell2{1,2},A);
j_cell{1,1} = get_radiance(imcell2{1,2}, t_cell{1,1}, A);
for i=2:num
   t_cell{1,i}=make_t1(t_cell{1,i-1},j_cell{1,i-1},imcell2{1,i-1},imcell2{1,i},A);

   t_cell{1,i} = guided_filter(rgb2gray(imcell2{1,i}), t_cell{1,i}, r, res);
   j_cell{1,i} = get_radiance(imcell2{1,i}, t_cell{1,i}, A);
   
   imgname=strcat('result\J\J',num2str(i),'.bmp');
   imwrite(j_cell{1,i}, imgname);
   imgname2=strcat('result\T\T',num2str(i),'.bmp');
   imwrite(t_cell{1,i}, imgname2);
end

toc;