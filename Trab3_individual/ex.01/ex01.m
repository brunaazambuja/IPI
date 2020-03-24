% para limpar o terminal e fechar as telas antes de começar
close all;
clc;

I = imread('img_cells.jpg');

% primeiro, transformamos a imagem para sua versão em níveis de cinza,
% depois devemos binarizá-la
I = imbinarize(rgb2gray(I), graythresh(I));
figure; imshow(I);

I = Fill(I);
I = distWatershed(I);

