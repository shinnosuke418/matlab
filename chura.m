    tic;
num=120;%画像の量で変更
imcell=cell(1,num);
%画像の読み込み(連番ファイルにする)
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
