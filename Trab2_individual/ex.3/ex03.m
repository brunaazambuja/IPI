% para limpar o terminal e fechar as telas antes de come�ar
close all;
clc;

ImOriginal = imread('cookies.tif');

k = graythresh(ImOriginal);
IBin = imbinarize(ImOriginal, k);
figure; imshow(IBin); %imagem bin�ria com os dois cookies

I = FindCookie(IBin); 
% temos uma m�scara com apenas o cookie inteiro

I = uint8(I);
I = I.*ImOriginal;
figure; imshow(I); %imagem com o cookie em n�vel de cinza
