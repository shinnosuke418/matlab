    tic;
num=120;%�摜�̗ʂŕύX
imcell=cell(1,num);
%�摜�̓ǂݍ���(�A�ԃt�@�C���ɂ���)
for i=1:num
    Imgfilename = strcat('live4\',num2str(i),'.bmp');
    imcell{1,i}=double(imread(Imgfilename))/255;
    imcell{1,i}=get_hes_image(imcell{1,i},i);
end
toc;
for i=1:num
    imgname=strcat('result\he\',num2str(i),'.bmp');
    imwrite(imcell{1,i}, imgname);
end
