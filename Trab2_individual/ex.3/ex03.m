% para limpar o terminal e fechar as telas antes de começar
close all;
clc;

ImOriginal = imread('cookies.tif');

k = graythresh(ImOriginal);
IBin = imbinarize(ImOriginal, k);
figure; imshow(IBin); %imagem binária com os dois cookies

I = FindCookie(IBin); 
% temos uma máscara com apenas o cookie inteiro

I = uint8(I);
I = I.*ImOriginal;
figure; imshow(I); %imagem com o cookie em nível de cinza
