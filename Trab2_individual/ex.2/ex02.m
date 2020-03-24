% para limpar o terminal e fechar as telas antes de come�ar
close all;
clc;

f = imread('moire.tif');
figure; imshow(f);

Fpadding = Fourier(f);

filtro = butterworth(h, w);

G = Fpadding.*filtro;
% para aplicar o filtro na imagem da tranformada de Fourier, 
% basta fazer a multiplica��o elemento por elemento

g = inversaFourier(G, h, w);