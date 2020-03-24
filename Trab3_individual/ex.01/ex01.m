% para limpar o terminal e fechar as telas antes de come�ar
close all;
clc;

I = imread('img_cells.jpg');

% primeiro, transformamos a imagem para sua vers�o em n�veis de cinza,
% depois devemos binariz�-la
I = imbinarize(rgb2gray(I), graythresh(I));
figure; imshow(I);

I = Fill(I);
I = distWatershed(I);

