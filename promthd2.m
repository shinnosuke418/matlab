tic;
num=50;%�摜�̗ʂŕύX
imcell2=cell(1,num);
t_cell=cell(1,num);
j_cell=cell(1,num);
se_bo  = strel('disk', 1); %�c���p (disk:�~�Տ�̔��a)
se_shu = strel('disk', 1); %���k�p (disk:�~�Տ�̔��a)

%�摜�̓ǂݍ���(�A�ԃt�@�C���ɂ���)
for i=1:num
    %Imgfilename = strcat('live3\',num2str(i),'.bmp');
    Imgfilename = strcat('data\data8\',num2str(i),'.bmp');
    imcell2{1,i}=double(imread(Imgfilename))/255;
    %imcell2{1,i}=imresize(imcell2{1,i},0.4);
end
%****************make he's process***********************
omega = 0.8;
win_size = 6;
r = 15;
res = 0.00001;
A=make_A(imcell2{1,1}, win_size);
trans_est = get_transmission_estimate(imcell2{1,1}, A, omega, win_size);
t = guided_filter(rgb2gray(imcell2{1,1}), trans_est, r, res);
J = get_radiance(imcell2{1,1}, t, A);
%*******************************************************
t_cell{1,1}=make_t1(t,J,imcell2{1,1},imcell2{1,2},A);
j_cell{1,1} = get_radiance(imcell2{1,2}, t_cell{1,1}, A);
for i=2:num
   
   t_cell{1,i}=make_t1(t_cell{1,i-1},j_cell{1,i-1},imcell2{1,i-1},imcell2{1,i},A);
   t_cell{1,i} = guided_filter(rgb2gray(j_cell{1,i}), t_cell{1,i}, r, res);
   %GIFilter&opening.ver
%    if rem(i,3)==0
%        t_cell{1,i} = imerode(t_cell{1,i}, se_shu); %���k(imerode)
%        t_cell{1,i} = imerode(t_cell{1,i}, se_bo); %�c��(imdilate)
%        t_cell{1,i} = guided_filter(rgb2gray(imcell2{1,i}), t_cell{1,i}, r, res);
%    end
   j_cell{1,i} = get_radiance(imcell2{1,i}, t_cell{1,i}, A);
   
   imgname=strcat('result\J\J',num2str(i),'.bmp');
   imwrite(j_cell{1,i}, imgname);
   imgname2=strcat('result\T\T',num2str(i),'.bmp');
   imwrite(t_cell{1,i}, imgname2);
end
toc;